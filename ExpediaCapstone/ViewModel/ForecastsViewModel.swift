//
//  ForecastViewModel.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import Foundation
import Combine

final class ForecastsViewModel: ObservableObject {
    
    var forecasts: [Forecast]
    
    init(forecasts: [Forecast]){
        self.forecasts = forecasts
    }
    
    @Published var selection = Set<Int>()
    @Published var searchText : String = ""
    
    var searchResults : [Forecast] {
        return search(searchText)
    }
    
    private func search(_ query: String) -> [Forecast] {
        let lquery = query.lowercased()
        return forecasts.filter  { forecast in
            if  query=="" || forecast.city.lowercased().contains(lquery) || forecast.country.lowercased().contains(lquery){
                return true
            }
            return false
        }
    }
    
    func deleteSingle(_ offsets: IndexSet) {
        let validOffsets = IndexSet(offsets.filter { $0 < forecasts.count && $0 >= 0 })
        forecasts.remove(atOffsets: validOffsets)
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
        selection = Set<Int>()
        let helper = Helper("forecastData.json")
        forecasts = helper.load()
    }
}



