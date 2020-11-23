//
//  BrandTest.swift
//  1120_DesafioMvcUITests
//
//  Created by Jorge Roberto on 23/11/20.
//

import XCTest

class BrandTest: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        
        app.launch()
    }

    func testNavigation() {
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Acura"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Integra GS 1.8"]/*[[".cells.staticTexts[\"Integra GS 1.8\"]",".staticTexts[\"Integra GS 1.8\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Marcas"].buttons["Modelos Acura"].tap()
        app.navigationBars["Modelos Acura"].buttons["Marcas"].tap()
        
    }
    func testRow() {
        let tablesQuery = app.tables
        let row = tablesQuery.staticTexts["cell_0"]
        row.tap()
        XCTAssertTrue(row.exists)
        row.tap()
    }

}
