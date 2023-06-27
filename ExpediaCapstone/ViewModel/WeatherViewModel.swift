//
//  WeatherCardViewModel.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 21/06/23.
//

import Foundation

struct WeatherViewModel {
    var weatherCondition: String{
        forecast.weatherCondition
    }
    var formattedTemperature: String{
        return "\(forecast.temperature)°"
    }
    var formattedHiLo: String {
        return "H:\(forecast.high)° L:\(forecast.low)°"
    }
    var location: String {
        return "\(forecast.city), \(forecast.country)"
    }
    var city: String {
        forecast.city
    }
    
    
    private let forecast: Forecast
    
    init(forecast : Forecast){
        self.forecast = forecast
    }
    enum WeatherImage: String {
        case midRain = "Rainy"
        case fastWind = "FastWind"
        case showers = "AngledRain"
        case tornado = "Tornado"
        var imageName: String {
            return self.rawValue
        }
    }
    private func getWeatherImageEnum() -> WeatherImage {
        switch weatherCondition {
        case "Mid Rain":
            return .midRain
        case "Fast Wind":
            return .fastWind
        case "Showers":
            return .showers
        case "Tornado":
            return .tornado
        default:
            return .tornado
        }
    }
    
    func getWeatherImage() -> String {
        return getWeatherImageEnum().imageName
    }
    
}
