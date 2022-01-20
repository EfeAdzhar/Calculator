//  ViewController.swift
//  Calculator
//  Created by Efe on 20.01.2022.

import UIKit

class ViewController: UIViewController {
    //MARK: Variables
    var numberOnScreen : Double = 0
    var previousNumber : Double = 0
    var operations = 0
    var mathOperation : Bool = false
    var allButtons = [UIButton]()
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttons: UIButton!
    
    override func viewDidLoad() {
        self.view.backgroundColor = .black
        super.viewDidLoad()
    }
    
    //MARK: BRUH MOMENT. I tried to make button titles bigger, but they only do get bigger when you actually press them XD
    @IBAction func buttonsFont(_ sender: UIButton) {
        allButtons.append(sender)
        for i in allButtons {
            i.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        }
    }
    
    //MARK: IBAction. I gave all buttons a tag in Storyboard. In this function it looks if there's a math symbol on Label. If it is there, then it removes it when a person clicks on another number.
    @IBAction func numbers(_ sender: UIButton) {
        if mathOperation == true {
            label.text = String(sender.tag)
            numberOnScreen = Double(label.text!)!
            mathOperation = false
        } else {
            label.text = label.text! + String(sender.tag)
            numberOnScreen = Double(label.text!)!
        }
    }
    //MARK: Second IBAction. I'm using math operation tags from Storyboard. When a person presses on them, they show up in label. Simple.
    @IBAction func operations(_ sender: UIButton) {
        if label.text != "" && sender.tag != 10 && sender.tag != 15 {
            
            //MATH OPERATION IS TRUE BECAUSE THERE'S A MATH SYMBOL ON A SCREEN.
            mathOperation = true
            operations = sender.tag
            
            previousNumber = Double(label.text!)!
            if operations == 11 { //Divide
                label.text = "÷"
            }
            if operations == 12 { //Multiply
                label.text = "x"
            }
            if operations == 13 { //Minus
                label.text = "-"
            }
            if operations == 14 { //Plus
                label.text = "+"
            }
        }
        //MARK: If Person presses Equel button, wich is a tag at number 15.
        else if sender.tag == 15 {
            if operations == 11 {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operations == 12 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operations == 13 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operations == 14 {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        //MARK: If Person Pressed AC
        else if sender.tag == 10 {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operations = 0
        }
    }
}
