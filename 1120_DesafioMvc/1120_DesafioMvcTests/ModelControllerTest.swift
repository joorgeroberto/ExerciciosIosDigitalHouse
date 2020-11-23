//
//  ModelControllerTest.swift
//  1120_DesafioMvcTests
//
//  Created by Jorge Roberto on 23/11/20.
//

import XCTest
@testable import _120_DesafioMvc

class ModelControllerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let brand = BrandController()
        //var dictionary = [String: String, String: String]
        //brand.arrayBrands.append(Brand(fromDictionary: <#T##[String : Any]#>))
        //print("brand: \(brand.arrayBrands)")
        XCTAssertEqual(brand.getNumberOfRows(), 0, "Deu erro!")
        XCTAssertEqual(brand.getViewTitle(), "Marcas", "Deu erro!")
        
    }

}
