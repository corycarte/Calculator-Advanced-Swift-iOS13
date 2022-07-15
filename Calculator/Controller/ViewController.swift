//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error converting displayLabel.text \(displayLabel.text!)")
            }
            
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()

    @IBOutlet weak var displayLabel: UILabel!
    
    

    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        if let action = sender.currentTitle {
            calculator.setNumber(displayValue)
            if let result = calculator.calculate(action) {
                displayValue = result
            }
        }
        
        isFinishedTypingNumber = true
    }

    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let num = sender.currentTitle {
            if isFinishedTypingNumber {
                
                displayLabel.text = num
                
                if displayValue != 0 { // Prevent leading zeroes
                    isFinishedTypingNumber = false
                }
            } else {
                if num == "." {
                    if !(floor(displayValue) == displayValue) {
                        return
                    }
                    
                }
                displayLabel.text?.append(num)
            }
        }
    }

}

