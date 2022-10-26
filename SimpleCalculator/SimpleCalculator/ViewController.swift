//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Yakup OS on 26.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func sumClicked(_ sender: Any) {
        
        if  let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                result = firstNumber + secondNumber
                resultLabel.text = String(result)
                
            }
            
        }    // içerdeki ünlemin anlamı kesinlikle bir sayı girilecek  . En dıştaki integera cevireceğinden eminim anlamına geliyor.
        
       
        
       
        
    }
    
    
    
    @IBAction func minusClicked(_ sender: Any) {
        if  let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                 result = firstNumber - secondNumber
                resultLabel.text = String(result)
                
            }
            
        }
    }
    
    
    @IBAction func multiplyClicked(_ sender: Any) {
        if  let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                result = firstNumber * secondNumber
                resultLabel.text = String(result)
                
            }
            
        }
    }
    
    
    @IBAction func divideClicked(_ sender: Any) {
        if  let firstNumber = Int(firstText.text!){
            if let secondNumber = Int(secondText.text!){
                
                result = firstNumber / secondNumber
                resultLabel.text = String(result)
                
            }
            
        }
    }
}

