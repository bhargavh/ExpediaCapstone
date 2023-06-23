//
//  ExpediaCapstoneTests.swift
//  ExpediaCapstoneTests
//
//  Created by Bhargav Hegde on 21/06/23.
//

import XCTest
@testable import ExpediaCapstone // Replace with your app's module name

class ForecastViewModelTests: XCTestCase {
    var forecastsViewModel: ForecastsViewModel? = nil
    var weatherViewModel: WeatherViewModel? = nil
    
    override func setUpWithError() throws {
        forecastsViewModel = ForecastsViewModel()
        let forecast = Forecast(id: 1, temperature: 20, high: 25, low: 15, city: "London", country: "UK", weatherCondition: "Mid Rain")
        weatherViewModel = WeatherViewModel(forecast: forecast)
    }
    
    override func tearDownWithError() throws {
        forecastsViewModel = nil
    }
    
    func testPartialSearch(){
        // Test searching by city
        forecastsViewModel?.searchText = "Mumb"
        guard let cityResults = forecastsViewModel?.searchResults else{
            XCTFail()
            return
        }
        XCTAssertEqual(cityResults.count, 1)
        XCTAssertEqual(cityResults.first?.city, "Mumbai")
        
    }
    
    func testEmptySearch(){
        // Test searching with empty query
        forecastsViewModel?.searchText = ""
        guard let emptyResults = forecastsViewModel?.searchResults else{
            XCTFail()
            return
        }
        XCTAssertEqual(emptyResults.count, forecastsViewModel?.forecasts.count)
    }
    
    func testSearch() {
        // Test searching by country
        forecastsViewModel?.searchText = "India"
        guard let countryResults = forecastsViewModel?.searchResults else{
            XCTFail()
            return
        }
        XCTAssertEqual(countryResults.count, 2)
        XCTAssertTrue(countryResults.contains(where: { $0.country == "India" }))
    }
    
    func testRefresh(){
        forecastsViewModel?.forecasts = []
        XCTAssertEqual(forecastsViewModel?.forecasts.count, 0)
        forecastsViewModel?.refresh()
        XCTAssertNotEqual(forecastsViewModel?.forecasts.count, 0)
    }
    
    func testDeleteSingle() {
        
        let forecast1 = Forecast(id: 1, temperature: 20, high: 25, low: 15, city: "London", country: "UK", weatherCondition: "Mid Rain")
        let forecast2 = Forecast(id: 2, temperature: 25, high: 30, low: 20, city: "Paris", country: "France", weatherCondition: "Mid Rain")
        forecastsViewModel?.forecasts = [forecast1, forecast2]
        
        
        forecastsViewModel?.deleteSingle(IndexSet(integer: 0))
        XCTAssertEqual(forecastsViewModel?.forecasts, [forecast2])
    }
    
    func testDeleteMultiple() {
        let forecast1 = Forecast(id: 1, temperature: 20, high: 25, low: 15, city: "London", country: "UK", weatherCondition: "Mid Rain")
        let forecast2 = Forecast(id: 2, temperature: 25, high: 30, low: 20, city: "Paris", country: "France", weatherCondition: "Mid Rain")
        let forecast3 = Forecast(id: 3, temperature: 15, high: 20, low: 10, city: "Berlin", country: "Germany", weatherCondition: "Mid Rain")
        forecastsViewModel?.forecasts = [forecast1, forecast2, forecast3]
        forecastsViewModel?.selection = Set([2, 3])
        
        forecastsViewModel?.deleteMultiple()
        
        XCTAssertEqual(forecastsViewModel?.forecasts, [forecast1])
        XCTAssertEqual(forecastsViewModel?.selection, Set<Int>())
    }
    
    func testWeatherCondition() {
        XCTAssertEqual(weatherViewModel?.weatherCondition, "Mid Rain")
    }
    
    func testFormattedTemperature() {
        XCTAssertEqual(weatherViewModel?.formattedTemperature, "20°")
    }
    
    func testFormattedHiLo() {
        XCTAssertEqual(weatherViewModel?.formattedHiLo, "H:25° L:15°")
    }
    
    func testLocation() {
        XCTAssertEqual(weatherViewModel?.location, "London, UK")
    }
    
    func testCity() {
        XCTAssertEqual(weatherViewModel?.city, "London")
    }
    func testWeatherImage(){
        XCTAssertEqual(weatherViewModel?.getWeatherImage(), "Rainy")
    }
}
