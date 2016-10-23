//
//  ContiCodeTestTests.swift
//  ContiCodeTestTests
//
//  Created by Michael Dautermann on 10/23/16.
//  Copyright © 2016 Michael Dautermann. All rights reserved.
//

import XCTest

class ContiCodeTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFilenameWithDuplicateWords() {
        
        let outputClosure = { (outputDictDescription : String) -> () in
            
            // In case Apple ever changes how .prettyPrint operates, or if we get an unexpected issue
            // in future versions of iOS, let's simply compare the expected output string with what
            // our parser class came up with.  If a problem, we can investigate it (and maybe file
            // a bug with Apple, and get a free t-shirt!
            let expectDictDescription = "{\n  \"NAME\" : \"duplicate\",\n  \"d\" : \"og\",\n  \"c\" : \"ar\"\n}"
            XCTAssertEqual(expectDictDescription, outputDictDescription)
        }
        
        ContinentalFilenameParser.parseThisFilename(inputFilename: "duplicate_cat_car_dog.txt", closure: outputClosure)
    }
    
}
