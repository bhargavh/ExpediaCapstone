//
//  ExpediaCapstoneApp.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import SwiftUI

@main
struct ExpediaCapstoneApp: App {
    var body: some Scene {
        WindowGroup {
            let helper = Helper("forecastData.json")
            WeatherList(forecastsViewModel: ForecastsViewModel(forecasts: helper.load())).preferredColorScheme(.dark)
        }
    }
}
