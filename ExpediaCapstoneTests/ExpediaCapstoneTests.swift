//
//  ExpediaCapstoneTests.swift
//  ExpediaCapstoneTests
//
//  Created by Bhargav Hegde on 21/06/23.
//

import XCTest
@testable import ExpediaCapstone // Replace with your app's module name

class ForecastViewModelTests: XCTestCase {
    var viewModel: ForecastViewModel!
    
    override func setUpWithError() throws {
        viewModel = ForecastViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testPartialSearch(){
        // Test searching by city
        let cityResults = viewModel.search("Mumb")
        XCTAssertEqual(cityResults.count, 1)
        XCTAssertEqual(cityResults.first?.city, "Mumbai")
    }
    
    func testEmptySearch(){
        // Test searching with empty query
        let emptyResults = viewModel.search("")
        XCTAssertEqual(emptyResults.count, viewModel.forecasts.count)
    }
    
    func testSearch() {
        // Test searching by country
        let countryResults = viewModel.search("India")
        XCTAssertEqual(countryResults.count, 2)
        XCTAssertTrue(countryResults.contains(where: { $0.country == "India" }))
    }
    func testRefresh(){
        viewModel.forecasts = []
        XCTAssertEqual(viewModel.forecasts.count, 0)
        viewModel.refresh()
        XCTAssertNotEqual(viewModel.forecasts.count, 0)
    }
}
