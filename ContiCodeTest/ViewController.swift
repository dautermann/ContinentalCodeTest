//
//  ViewController.swift
//  ContiCodeTest
//
//  Created by Michael Dautermann on 10/23/16.
//  Copyright © 2016 Michael Dautermann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputFilenameTextField : UITextField!
    @IBOutlet var outputResultTextView : UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveFileButtonTouched(sender: UIButton)
    {
        let outputClosure = { (outputDictDescription : String) -> () in
            // UI should always be done on the main queue, in case
            // something along the way was called on a separate thread or queue
            DispatchQueue.main.async {
                print("\(outputDictDescription)")
                self.outputResultTextView.text = outputDictDescription
            }
        }
        
        if let inputFilename = self.inputFilenameTextField.text {
            ContinentalFilenameParser.parseThisFilename(inputFilename: inputFilename, closure: outputClosure)
        }
    }
}

