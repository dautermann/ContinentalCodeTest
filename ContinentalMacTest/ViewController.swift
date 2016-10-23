//
//  ViewController.swift
//  ContinentalMacTest
//
//  Created by Michael Dautermann on 10/23/16.
//  Copyright © 2016 Michael Dautermann. All rights reserved.
//

import Cocoa

class ContiMacViewController: NSViewController {

    @IBOutlet var inputFilenameTextField : NSTextField!
    @IBOutlet var outputResultTextView : NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func saveFileButtonTouched(sender: NSButton)
    {
        let outputClosure = { (outputDictDescription : String) -> () in
            // UI should always be done on the main queue, in case
            // something along the way was called on a separate thread or queue
            DispatchQueue.main.async {
                print("\(outputDictDescription)")
                self.outputResultTextView.string = outputDictDescription
            }
        }
        
        ContinentalFilenameParser.parseThisFilename(inputFilename: self.inputFilenameTextField.stringValue, closure: outputClosure)
    }
}

