//
//  CalculatorTests.swift
//  PCICSampleApp
//
//  Created by Tristan Behrens on 30.09.16.
//  Copyright © 2016 Porsche Digital Lab. All rights reserved.
//

import XCTest

class CalculatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSum() {
        let calculator = Calculator()
        
        let sum = calculator.sum(3, b:3)
        
        XCTAssertEqual(sum,  6)
    }

    func testProduct() {
        let calculator = Calculator()
        
        let product = calculator.product(3, b:3)
        
        XCTAssertEqual(product,  9)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
