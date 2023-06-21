//
//  ExpediaCapstoneTests.swift
//  ExpediaCapstoneTests
//
//  Created by Bhargav Hegde on 21/06/23.
//

import XCTest
@testable import ExpediaCapstone // Replace with your app's module name

class ForecastViewModelTests: XCTestCase {
    var viewModel: ForecastsViewModel? = nil
    
    override func setUpWithError() throws {
        viewModel = ForecastsViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testPartialSearch(){
        // Test searching by city
        guard let cityResults = viewModel?.search("Mumb") else {
            XCTFail()
            return
        }
        XCTAssertEqual(cityResults.count, 1)
        XCTAssertEqual(cityResults.first?.city, "Mumbai")
        
    }
    
    func testEmptySearch(){
        // Test searching with empty query
        guard let emptyResults = viewModel?.search("") else{
            XCTFail()
            return
        }
        XCTAssertEqual(emptyResults.count, viewModel?.forecasts.count)
    }
    
    func testSearch() {
        // Test searching by country
        guard let countryResults = viewModel?.search("India") else{
            XCTFail()
            return
        }
        XCTAssertEqual(countryResults.count, 2)
        XCTAssertTrue(countryResults.contains(where: { $0.country == "India" }))
    }
    
    func testRefresh(){
        viewModel?.forecasts = []
        XCTAssertEqual(viewModel?.forecasts.count, 0)
        viewModel?.refresh()
        XCTAssertNotEqual(viewModel?.forecasts.count, 0)
    }
}
