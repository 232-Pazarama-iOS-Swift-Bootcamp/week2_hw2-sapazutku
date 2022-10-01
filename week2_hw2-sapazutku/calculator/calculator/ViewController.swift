//
//  ViewController.swift
//  calculator
//
//  Created by utku on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var number : Double = 0
    var previousNumber : Double = 0
    var performingMath = false
    var operation = 0
    var calcNumber : Int = 0
    
    @IBOutlet weak var lastResult: UILabel!
    @IBOutlet weak var labelOpe: UILabel!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = ""
        labelOpe.text = ""
        lastResult.text = ""
    }

    
    @IBAction func operations(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 12 && sender.tag != 16 {
            previousNumber = Double(label.text!)!
            if sender.tag == 15 {
                labelOpe.text = "/"
                label.text = ""
            }
            else if sender.tag == 14 {
                labelOpe.text = "X"
                label.text = ""

            }
            else if sender.tag == 24 {
                labelOpe.text = "-"
                label.text = ""
            }
            else if sender.tag == 13 {
                labelOpe.text = "+"
                label.text = ""
            }
            else if sender.tag == 17{
                label.text = "-" + label.text!
            }
            else if sender.tag == 21{
                number = number * number
                label.text = String(number)
                labelOpe.text = "a²"
            }
            else if sender.tag == 23{
                number = 1 / number
                label.text = String(number)
                labelOpe.text = "1/a"
            }
            else if sender.tag == 20{
                number = number.squareRoot()
                label.text = String(number)
                labelOpe.text = "√"
            }
            else if sender.tag == 19{
                label.text = ""
                labelOpe.text = "mod"
            }
            else if sender.tag == 18{
                label.text = String(number/100)
                labelOpe.text = "%"
            }

          
            
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 12 {
            labelOpe.text = "="
            
            if operation == 15 {
                label.text = String(previousNumber / number)
            }
            else if operation == 14 {
                label.text = String(previousNumber * number)
            }
            else if operation == 24 {
                label.text = String(previousNumber - number)
            }
            else if operation == 13 {
                label.text = String(previousNumber + number)
            }
            else if operation == 19{
                label.text = String(Int(previousNumber) % Int(number))
            }
            
            if calcNumber != 0 {
                lastResult.text = String(previousNumber)
            }
            calcNumber = calcNumber+1
        }
        else if sender.tag == 16 {
            label.text = ""
            labelOpe.text = ""
            lastResult.text = ""
            previousNumber = 0
            number = 0
            operation = 0
        }
        
        
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        label.text! += String(sender.tag-1)
        number = Double(label.text!) ?? 0
        
    }
    
    @IBAction func dot(_ sender: UIButton) {
        label.text! += "."
    }
}

