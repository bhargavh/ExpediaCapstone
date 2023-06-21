//
//  Forecast.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import Foundation

struct Forecast: Decodable, Identifiable {
    var id: Int
    var temperature: Int
    var high: Int
    var low: Int
    var city: String
    var country: String
    var weatherCondition: String
}
