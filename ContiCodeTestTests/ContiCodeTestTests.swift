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
    
    func testCorrectFilenameBehavior() {
        let outputClosure = { (outputDictDescription : String) -> () in
            
            let expectDictDescription = "{\n  \"NAME\" : \"continental\",\n  \"m\" : \"e\",\n  \"h\" : \"ire\",\n  \"p\" : \"lease\"\n}"
            XCTAssertEqual(expectDictDescription.characters.count, outputDictDescription.characters.count)
        }
        
        ContinentalFilenameParser.parseThisFilename(inputFilename: "continental_hire_me_please.txt", closure: outputClosure)
    }
    
    func testFilenameWithoutExtension() {

        let outputClosure = { (outputDictDescription : String) -> () in
            
            if let data = outputDictDescription.data(using: String.Encoding.utf8) {
                do {
                    if let serializedDictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:String]
                    {
                        let testConstantDictionary = [ "NAME" : "are", "y" : "ou", "l" : "ooking", "h" : "ere" ]
                        
                        XCTAssertEqual(serializedDictionary, testConstantDictionary)
                    } else {
                        XCTFail("JSONSerialization.jsonObject came up with an empty dictionary")
                    }

                } catch let error as NSError {
                    XCTFail("couldn't create dictionary from output - \(error.localizedDescription)")
                }
            }
        }

        ContinentalFilenameParser.parseThisFilename(inputFilename: "are_you_looking_here", closure: outputClosure)

    }

    func testFilenameWithDuplicateWords() {
        
        let outputClosure = { (outputDictDescription : String) -> () in
            
            // In case Apple ever changes how .prettyPrint operates, or if we get an unexpected issue
            // in future versions of iOS, let's simply compare the expected output string with what
            // our parser class came up with.  If a problem, we can investigate it (and maybe file
            // a bug with Apple, and get a free t-shirt!
            let expectDictDescription = "{\n  \"NAME\" : \"duplicate\",\n  \"d\" : \"og\",\n  \"c\" : \"ar\"\n}"
            
            // we'll just compare the overall characters count for what we expect and what is calculated,
            // because Dictionaries aren't guaranteed to have keys in any particular order...
            XCTAssertEqual(expectDictDescription.characters.count, outputDictDescription.characters.count)
        }
        
        ContinentalFilenameParser.parseThisFilename(inputFilename: "duplicate_cat_car_dog.txt", closure: outputClosure)
    }
    
    func testFilenameWithBogusComponents() {
        
        let outputClosure = { (outputDictDescription : String) -> () in
            
            XCTFail("bogus components in the filename should never save")
        }

        ContinentalFilenameParser.parseThisFilename(inputFilename: "backslash_/_colon_:", closure: outputClosure)
        
    }
}
