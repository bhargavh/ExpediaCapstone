//
//  ForecastViewModel.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import Foundation
import Combine

final class ForecastsViewModel: ObservableObject {
    
    let title = "Weather"
    let searchPrompt = "search for a city or country"
    let menu_delete_text = "Delete"
    let menu_refresh_text = "Refresh"
    
    var forecasts: [Forecast] = Helper.load("forecastData.json")
    @Published var selection = Set<Int>()
    @Published var searchText = ""
    
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
        selection = Set<Int>()
        forecasts = Helper.load("forecastData.json")
    }
}



