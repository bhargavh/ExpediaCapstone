//
//  Utils.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import Foundation


class Utils
{
    static func getWeatherImage(weatherCondition: String) -> String {
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
