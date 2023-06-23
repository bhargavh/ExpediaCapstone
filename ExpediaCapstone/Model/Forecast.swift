//
//  Forecast.swift
//  ExpediaCapstone
//
//  Created by Bhargav Hegde on 20/06/23.
//

import Foundation

struct Forecast: Decodable, Identifiable, Equatable {
    let id: Int
    let temperature: Int
    let high: Int
    let low: Int
    let city: String
    let country: String
    let weatherCondition: String
}
