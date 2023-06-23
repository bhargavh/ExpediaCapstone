//
//  WeatherCardViewModel.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 21/06/23.
//

import Foundation
import Combine

final class WeatherViewModel : ObservableObject {
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

    
    private var forecast: Forecast
    
    init(forecast f: Forecast){
        forecast = f
    }
    enum WeatherImage: String {
        case midRain = "Rainy"
        case fastWind = "FastWind"
        case showers = "AngledRain"
        case tornado = "Tornado"
        
        var imageName: String {
            return self.rawValue
        }
        
        static func getWeatherImageEnum(weatherCondition: String) -> WeatherImage {
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
                fatalError("Unexpected value: \(weatherCondition)")
            }
        }
    }
    
    func getWeatherImage() -> String {
        return WeatherImage.getWeatherImageEnum(weatherCondition: weatherCondition).imageName
    }
}
