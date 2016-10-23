//
//  ContinentalFilenameParser.swift
//  ContiCodeTest
//
//  Created by Michael Dautermann on 10/23/16.
//  Copyright © 2016 Michael Dautermann. All rights reserved.
//

import Foundation

class ContinentalFilenameParser {
    
    // I did this as a class function as what needs to be done is pretty straightforward
    //
    // If we had many more bells & whistles in the requirements, then I'd either create an 
    // instance of this parser object and split out functionality into individual functions
    class func parseThisFilename(inputFilename : String, closure: (String) -> ())
    {
        var fileNameToParse = inputFilename
        var wordDictionary = [String: String]()
        
        // remove the extension, if it exists
        if let fileNameWithoutExtension = NSURL(fileURLWithPath: inputFilename).deletingPathExtension?.lastPathComponent {
            fileNameToParse = fileNameWithoutExtension
        }

        // split the filename into an array based on the _ underscore
        let wordArray = fileNameToParse.characters.split(separator: "_").map(String.init)
        
        // okay, so this part was fuzzy in your coding challenge description.
        //
        // if we have two words in the filename with the same first character (e.g. "cat", "car"),
        // should we append the characters onto the dictionary values or should we replace the first
        // word contents with the second word contents.  Since the description says "filename could
        // "end up with incorrect characters or incorrect amounts of characters", I'm going to assume
        // the latter...
        for eachWord in wordArray {
            if wordDictionary.count == 0 {
                wordDictionary["NAME"] = eachWord
            } else {
                let index = eachWord.index(eachWord.startIndex, offsetBy: 1)
                
                // if a word with the same first letter was already encountered,
                // this *erases* the original value and replaces it with a new value
                wordDictionary[eachWord.substring(to: index)] = eachWord.substring(from: index)
            }
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: wordDictionary, options: .prettyPrinted)
            
            let documentsUrl = FileManager.default.urls(for: .documentDirectory,
                                                        in: .userDomainMask).first!
            
            let ourFileURL = documentsUrl.appendingPathComponent(inputFilename)
            
            try jsonData.write(to: ourFileURL, options: .atomic)
            
            if let outputJSONString = String(data: jsonData, encoding: .utf8) {
                closure(outputJSONString)
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
