//
//  _123_TestesUITests.swift
//  1123_TestesUITests
//
//  Created by Jorge Roberto on 23/11/20.
//

import XCTest

class _123_TestesUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()

        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test01SegmentedControll() throws {
        app/*@START_MENU_TOKEN@*/.buttons["First"]/*[[".segmentedControls.buttons[\"First\"]",".buttons[\"First\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let secondButton = app/*@START_MENU_TOKEN@*/.buttons["Second"]/*[[".segmentedControls.buttons[\"Second\"]",".buttons[\"Second\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        secondButton.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Third"]/*[[".segmentedControls.buttons[\"Third\"]",".buttons[\"Third\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Fourth"]/*[[".segmentedControls.buttons[\"Fourth\"]",".buttons[\"Fourth\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        secondButton.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Button"]/*[[".buttons[\"Button\"].staticTexts[\"Button\"]",".staticTexts[\"Button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        print("a")
    }
    
    func test02Button() throws {
        
        print("a")
    }
}
