//
//  HomeViewModelTests.swift
//  NYTimesDemoTests
//
//  Created by Gajula Ravi Kiran on 28/02/2022.
//

import XCTest
@testable import NYTimesDemo

class HomeViewModelTests: XCTestCase {
    let viewModel = HomeViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections(), 2)
    }
    
    func testNumberOfRowsInSections() {
        XCTAssertEqual(viewModel.numberOfRowsInSection(section: 0), 1)
        XCTAssertEqual(viewModel.numberOfRowsInSection(section: 1), 3)
    }
    
    func testSectionTitle() {
        XCTAssertEqual(viewModel.sectionTitle(section: 0), "Search")
        XCTAssertEqual(viewModel.sectionTitle(section: 1), "Popular")
    }

    func testRowTitle() {
        XCTAssertEqual(viewModel.rowTitleForIndex(indexPath: IndexPath(row: 0, section: 0)), "Search Articles")
        XCTAssertEqual(viewModel.rowTitleForIndex(indexPath: IndexPath(row: 1, section: 1)), "Most Shared")
    }
    
    func testArticleType() {
        XCTAssertEqual(viewModel.getArticleType(title: "Search Articles"), .SEARCHRESULT)
        XCTAssertEqual(viewModel.getArticleType(title: "Most Shared"), .MOSTSHARED)
        XCTAssertEqual(viewModel.getArticleType(title: "Most Viewed"), .MOSTVIEWED)
        XCTAssertEqual(viewModel.getArticleType(title: "Most Emailed"), .MOSTEMAILED)
    }
    
}
