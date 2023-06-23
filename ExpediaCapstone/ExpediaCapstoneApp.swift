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
            WeatherList(forecastsViewModel: ForecastsViewModel()).preferredColorScheme(.dark)
        }
    }
}
