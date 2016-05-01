//
//  ViewController.swift
//  Calculator
//
//  Created by Jacky Chiu on 2015-12-24.
//  Copyright © 2015 Jacky Chiu. 
//

import UIKit

//extension of string to make it more simple
extension String {
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        return substringWithRange(startIndex.advancedBy(r.startIndex)..<startIndex.advancedBy(r.endIndex))
    }
}

class ViewController: UIViewController {

    var colorRoation:Int = 0
    
    func deleteLastEntry() {
        if operationsLabel.text! != ""{
            operationsLabel.text!.removeAtIndex(operationsLabel.text!.endIndex.predecessor())
        }
    }
    
    func clearLabel(){
        if operationsLabel.text! == ""{
            answerLabel.text = ""
        }
        else{
            operationsLabel.text! = ""
        }
    }
    
    func longPressed(sender:UILongPressGestureRecognizer){
        clearLabel()
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        
        var colorList =
            [UIColor(red: 24/255, green: 194/255, blue: 255/255, alpha: 1.0),
            UIColor(red: 84/255, green: 234/255, blue: 102/255, alpha: 1.0),
            UIColor(red: 251/255, green: 90/255, blue: 112/255, alpha: 1.0)]

        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.Up{
                colorRoation += 1
                if colorRoation >= colorList.count{
                    colorRoation = 0
                }
            }
            else if swipeGesture.direction == UISwipeGestureRecognizerDirection.Down{
                colorRoation -= 1
                if colorRoation < 0{
                    colorRoation = colorList.count-1
                }
            }
        }
        
        divison.backgroundColor = colorList[colorRoation]
        multiplication.backgroundColor = colorList[colorRoation]
        minus.backgroundColor = colorList[colorRoation]
        plus.backgroundColor = colorList[colorRoation]
        equal.backgroundColor = colorList[colorRoation]
    }
    
    //Equations labels
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    //button objects
    @IBOutlet weak var divison: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    //Number button
    @IBAction func numpadWasPressed(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += sender.currentTitle!
    }
    
    //Operations buttons
    @IBAction func deleteButton(sender: UIButton) {
        deleteLastEntry()
    }
    
    @IBAction func negativeButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
                operationsLabel.text! += "-"
            }
            else if listIsInPartString(operationsLabel.text![operationsLabel.text!.characters.count-1], list: numbersListWithNegative) == false{
                operationsLabel.text! += "-"
            }
        }
        else{
            operationsLabel.text! += "-"
        }
    }
    
    @IBAction func answerButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
                operationsLabel.text! += "ANS"
            }
            else if listIsInPartString(operationsLabel.text![operationsLabel.text!.characters.count-1], list: numbersList) == false{
                operationsLabel.text! += "ANS"
            }

        }
        else{
            operationsLabel.text! += "ANS"
        }
    }

    @IBAction func operatorWasPressed(sender: UIButton) {
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.characters.count-1], list: operationsListWithNegative) == false{
                operationsLabel.text! += sender.currentTitle!
            }
            if endOfOperationLine(operationsLabel.text!){
                clearLabel()
                operationsLabel.text! += ("ANS" + sender.currentTitle!)
            }
        }
    }

    @IBAction func equalButton(sender: UIButton) {
       let calculator = Calculator(line: operationsLabel.text!)
        operationsLabel.text! += "="
       answerLabel.text = String(calculator.calculate())
    }
        

    override func viewDidLoad() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPressed(_:)))
        self.view.addGestureRecognizer(longPressRecognizer)

    }
}

