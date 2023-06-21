//
//  ForecastViewModel.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import Foundation
import Combine

final class ForecastsViewModel: ObservableObject {
    @Published var forecasts: [Forecast] = load("forecastData.json")
    @Published var selection = Set<Int>()
    
    func search(_ query: String) -> [Forecast] {
        let lquery = query.lowercased()
        return forecasts.filter  { forecast in
            if  query=="" || forecast.city.lowercased().contains(lquery) || forecast.country.lowercased().contains(lquery){
                return true
            }
            return false
        }
    }
    
    func deleteSingle(_ offset: IndexSet){
        forecasts.remove(atOffsets: offset)
    }
    
    func deleteMultiple() {
        for id in selection {
            if let index = forecasts.lastIndex(where: { $0.id == id }) {
                forecasts.remove(at: index)
            }
        }
        selection = Set<Int>()
    }
    
    func refresh() {
        forecasts = load("forecastData.json")
    }
}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
