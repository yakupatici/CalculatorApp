//
//  ViewController.swift
//  Scientific Calculator
//
//  Created by Jacob on 6.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var firstNum : String = ""
    
    var operation: String = ""
    
    var secondNum : String = ""
    
    var haveResult : Bool = false
    
    var resultNumber : String = ""
    
    var numAfterResult : String = ""
    var decimalEntered: Bool = false
    
    
    @IBAction func add(_ sender: Any) {
        if firstNum.isEmpty {
                
            showAlert(message: "Please enter a number first.")
                return
            }
        
        operation = "+"
    }
    
    
    @IBAction func subtract(_ sender: Any) {
        if firstNum.isEmpty {
               
            showAlert(message: "Please enter a number first.")
                return
            }
      
        operation = "-"
    }
    
    @IBAction func multiply(_ sender: Any) {
        if firstNum.isEmpty {
                
            showAlert(message: "Please enter a number first.")
            return
            }
     
        operation = "x"
    }
    
    
    @IBAction func divide(_ sender: Any) {
        if firstNum.isEmpty {
              
            showAlert(message: "Please enter a number first.")
               return
           }
        
        operation = "÷"
    }
    @IBAction func percent(_ sender: Any) {  
        if firstNum.isEmpty {
            showAlert(message: "Please enter a number first.")
            return }
        
        operation = "%"
    }
    
    
    @IBAction func equals(_ sender: Any) {
 
        if firstNum.isEmpty || secondNum.isEmpty {
            showAlert(message: "Please enter both first and second numbers.")
            return
        }

        resultNumber = String(doOperation())
        let numArray = resultNumber.components(separatedBy: ".")
        print(numArray)
        if numArray[1] == "0" {
            resultLabel.text = numArray[0]
        } else {
            resultLabel.text = resultNumber
        }
        
        numAfterResult = ""
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBOutlet var calcButton: [UIButton]!
    
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if operation == "" {
            firstNum += String(sender.tag);
            resultLabel.text = firstNum
        }
        else if operation != ""  && !haveResult{
            secondNum += String(sender.tag)
            resultLabel.text = secondNum
        }
        else if operation != "" && haveResult {
            numAfterResult += String(sender.tag)
            resultLabel.text = numAfterResult
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        firstNum  = ""
        
        operation = ""
        
        secondNum  = ""
        
        haveResult  = false
        
        resultNumber  = ""
        
        numAfterResult = ""
        
        decimalEntered = false
        resultLabel.text = "0"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calcButton {
            button.layer.cornerRadius = button.frame.size.height / 2
            button.titleLabel?.font = UIFont(name: "System", size: 24)
        }
        
        
    }
    func doOperation() -> Double {
        if operation == "+" {
            if !haveResult {
                haveResult = true
                return Double(firstNum)! + Double(secondNum)!
            }
            else {
                return Double(resultNumber)! + Double(numAfterResult)!
            }
        }
        else if operation == "-" {
            if !haveResult{
                haveResult = true
                return Double(firstNum)! - Double(secondNum)!
                
            }
            else {
                return Double(resultNumber)! - Double(numAfterResult)!
            }
        }
        else if operation == "x" {
            if !haveResult{
                haveResult = true
                return Double(firstNum)! * Double(secondNum)!
                
            }
            else {
                return Double(resultNumber)! * Double(numAfterResult)!
            }
        }
        else if operation == "÷" {
            if !haveResult{
                haveResult = true
                return Double(firstNum)! / Double(secondNum)!
                
            }
            else {
                return Double(resultNumber)! / Double(numAfterResult)!
            }
        }
        else if operation == "%" {
                
                return Double(firstNum)! / 100.0
            }
        return 0
    }
    
    
    @IBAction func decimalPointPressed(_ sender: UIButton) {
        
            if firstNum.isEmpty && operation.isEmpty {
                showAlert(message: "Please enter a number first.") 
                return
            }

            var targetNumber: String

            if operation == "" {
                targetNumber = firstNum
            } else if !haveResult {
                targetNumber = secondNum
            } else {
                targetNumber = numAfterResult
            }

            if !targetNumber.contains(".") && !decimalEntered {
                targetNumber += "."
                decimalEntered = true // Bayrağı ayarla
                resultLabel.text = targetNumber
            }

            if operation == "" {
                firstNum = targetNumber
            } else if !haveResult {
                secondNum = targetNumber
            } else {
                numAfterResult = targetNumber
            }
        }

        func showAlert(message: String) {
            let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }

}




