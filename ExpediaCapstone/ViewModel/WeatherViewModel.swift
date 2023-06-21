//
//  WeatherCardViewModel.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 21/06/23.
//

import Foundation
import Combine

final class WeatherViewModel : ObservableObject {
    private(set) var id:Int
    private(set) var temperature: Int
    private(set) var weatherCondition: String
    private(set) var high: Int
    private(set) var low: Int
    private(set) var city: String
    private(set) var country: String
    
    init(forecast : Forecast){
        id = forecast.id
        temperature = forecast.temperature
        weatherCondition = forecast.weatherCondition
        high = forecast.high
        low = forecast.low
        city = forecast.city
        country = forecast.country
    }
    func getWeatherImage() -> String {
        switch weatherCondition{
        case "Mid Rain":
            return "Rainy"
        case "Fast Wind":
            return "FastWind"
        case "Showers":
            return "AngledRain"
        case "Tornado":
            return "Tornado"
        default:
            fatalError("Unexpected value: \(weatherCondition)")
        }
    }
    
}

