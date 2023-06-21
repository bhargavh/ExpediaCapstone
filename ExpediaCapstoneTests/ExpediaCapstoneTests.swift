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
    
    func testSearch() {
        // Test searching by city
        let cityResults = viewModel.search("Mumbai")
        XCTAssertEqual(cityResults.count, 1)
        XCTAssertEqual(cityResults.first?.city, "Mumbai")
        
        // Test searching by country
        let countryResults = viewModel.search("India")
        XCTAssertEqual(countryResults.count, 2)
        XCTAssertTrue(countryResults.contains(where: { $0.country == "India" }))
        
        // Test searching with empty query
        let emptyResults = viewModel.search("")
        XCTAssertEqual(emptyResults.count, viewModel.forecasts.count)
    }
}
