//
//  ContentView.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var forecastViewModel: ForecastViewModel
    
    var body: some View {
        WeatherList(forecastViewModel: forecastViewModel).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    @ObservedObject static var forecastViewModel: ForecastViewModel = ForecastViewModel()
    static var previews: some View {
        ContentView(forecastViewModel: forecastViewModel)
    }
}
