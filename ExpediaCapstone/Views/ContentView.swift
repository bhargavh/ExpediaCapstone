//
//  ContentView.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var forecastsViewModel: ForecastsViewModel
    
    var body: some View {
        WeatherList(forecastsViewModel: forecastsViewModel).preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    @ObservedObject static var forecastsViewModel: ForecastsViewModel = ForecastsViewModel()
    static var previews: some View {
        ContentView(forecastsViewModel: forecastsViewModel)
    }
}
