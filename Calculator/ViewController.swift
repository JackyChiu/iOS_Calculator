//
//  ViewController.swift
//  Calculator
//
//  Created by Jacky Chiu on 2015-12-24.
//  Copyright © 2015 Jacky Chiu. All rights reserved.
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
        return substringWithRange(Range(start: startIndex.advancedBy(r.startIndex), end: startIndex.advancedBy(r.endIndex)))
    }
}

class ViewController: UIViewController {
    
    var finalAnswer: Float! = 0.0
    var answer: Float! = 0.0
    var numbersList = [".","0","1","2","3","4","5","6","7","8","9","S"]
    var numbersListWithNegative = ["-",".","0","1","2","3","4","5","6","7","8","9","S"]
    var operationsList = ["=","+","⁃","x","/","^"]
    var operationsListWithNegative = ["=","+","⁃","x","/","^","-"]
    var operationsListWithoutEquals = ["+","⁃","x","/"]
    var operationsListWithoutEqualsWithExponent = ["+","⁃","x","/","^"]
    var higherPrecOperationsList = ["x","/"]
    var lowerPrecOperationsList = ["+","⁃","="]
    var colorRoation:Int = 0
    
    func listIsInPartString(varible:String,list:[String])->Bool{
        for i in list{
            if varible == i{
                return true
            }
        }
        return false
    }
    
    func listIsInWholeString(varible:String, list:[String])->Bool{
        for i in varible.characters{
            for j in list{
                if String(i) == j{
                    return true
                }
            }
        }
        return false
    }
    
    func clearLabel(){
        if operationsLabel.text! == ""{
            answerLabel.text = ""
        }
        else{
            operationsLabel.text! = ""
        }
    }
    
    func deleteLastEntry() {
        if operationsLabel.text! != ""{
            operationsLabel.text!.removeAtIndex(operationsLabel.text!.endIndex.predecessor())
        }
    }
    
    func longPressed(sender:UILongPressGestureRecognizer){
        clearLabel()
    }
    
    func onlyEqualsLeft(operationsLine:String)->Bool{
        for i in 0..<operationsLine.length{
            if listIsInPartString(String(operationsLine[i]), list: operationsListWithoutEqualsWithExponent){
                return false
            }
        }
        return true
    }
    
    func endOfOperationLine(operationsLine:String)->Bool{
        if operationsLine[operationsLine.length-1] == "="{
         return true
        }
        return false
    }

    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        
        var colorList =
            [UIColor(red: 24/255, green: 194/255, blue: 255/255, alpha: 1.0),
            UIColor(red: 84/255, green: 234/255, blue: 102/255, alpha: 1.0),
            UIColor(red: 251/255, green: 90/255, blue: 112/255, alpha: 1.0)]

        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            if swipeGesture.direction == UISwipeGestureRecognizerDirection.Up{
                colorRoation++
                if colorRoation >= colorList.count{
                    colorRoation = 0
                }
            }
            else if swipeGesture.direction == UISwipeGestureRecognizerDirection.Down{
                colorRoation--
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
    
    //button actions
    //Number buttons
    @IBAction func decimalButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "."
    }

    @IBAction func zeroButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "0"
    }
 
    @IBAction func oneButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "1"
    }

    @IBAction func twoButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "2"
    }
    
    @IBAction func threeButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "3"
    }
    
    @IBAction func fourButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "4"
    }
    
    @IBAction func fiveButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "5"
    }

    @IBAction func sixButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "6"
    }
    
    @IBAction func sevenButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "7"
    }
    
    @IBAction func eightButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "8"
    }
    
    @IBAction func nineButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "9"
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
            else if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: numbersListWithNegative) == false{
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
            else if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: numbersList) == false{
                operationsLabel.text! += "ANS"
            }

        }
        else{
            operationsLabel.text! += "ANS"
        }
    }

    @IBAction func plusButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: operationsListWithNegative) == false{
                operationsLabel.text! += "+"
            }
            if endOfOperationLine(operationsLabel.text!){
                clearLabel()
                operationsLabel.text! += "ANS+"
            }
        }

    }
    
    @IBAction func minusButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: operationsListWithNegative) == false{
                operationsLabel.text! += "⁃"
                
            }
            if endOfOperationLine(operationsLabel.text!){
                clearLabel()
                operationsLabel.text! += "ANS⁃"
            }

        }
    }
    
    @IBAction func mutipleButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: operationsListWithNegative) == false{
            operationsLabel.text! += "x"
            }
            if endOfOperationLine(operationsLabel.text!){
                clearLabel()
                operationsLabel.text! += "ANSx"
            }
        }
    }
    
    @IBAction func divisonButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: operationsListWithNegative) == false{
            operationsLabel.text! += "/"
            }
            if endOfOperationLine(operationsLabel.text!){
                clearLabel()
                operationsLabel.text! += "ANS/"
            }
        }
    }
    
    @IBAction func squareButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: operationsListWithNegative) == false{
                operationsLabel.text! += "^"
            }
            if endOfOperationLine(operationsLabel.text!){
                clearLabel()
                operationsLabel.text! += "ANS^"
            }
        }
    }
    

    @IBAction func equalButton(sender: UIButton) {
        
        var operationsLine:String
        var input1:Float!
        var input2:Float!
        var operatorPosition:Int!
        var startPosition:Int!
        var endPosition:Int!
        var operation:Character = "A"
        var listToBeNotIn:[String] = []
        var listToBeIn:[String] = []
        
        if operationsLabel.text! != ""{
            if listIsInPartString(operationsLabel.text![operationsLabel.text!.length-1], list: operationsList) == false{
                operationsLabel.text! += "="
            
    
                operationsLine = operationsLabel.text!
                //replacements in the string
                operationsLine = operationsLine.stringByReplacingOccurrencesOfString("ANS", withString: String(finalAnswer))
                operationsLine = operationsLine.stringByReplacingOccurrencesOfString("e+", withString: String("e"))
                operationsLine = operationsLine.stringByReplacingOccurrencesOfString("--", withString: String(""))

                //loop to read the string of operations
                while(onlyEqualsLeft(operationsLine)==false){
                    
                    //eCase = false
                    startPosition = 0
                
                    //Cases with expoentals
                    if listIsInWholeString(operationsLine, list:["^"]){
                        listToBeNotIn = operationsListWithoutEquals
                        listToBeIn = ["^"]
    
                    }
                    //Cases with higher precedence
                    else if listIsInWholeString(operationsLine, list: higherPrecOperationsList){
                        listToBeNotIn = lowerPrecOperationsList
                        listToBeIn = higherPrecOperationsList
                    }
                        
                    else{
                        listToBeNotIn = [""]
                        listToBeIn = lowerPrecOperationsList
                    }
                    
                    //Main 2 loops that determine inputs
                    for i in 0..<operationsLine.length{
                        if listIsInPartString(operationsLine[i], list: listToBeNotIn){
                            startPosition = i + 1
                        }
                        if listIsInPartString(operationsLine[i], list: listToBeIn){
                            input1 = Float(operationsLine[startPosition..<i])
                            //print(input1)
                            operation = operationsLine[i]
                            //print(operation)
                    
                                operatorPosition = i + 1
                            
                            break
                        }
                        
                    }
                    
                    for j in operatorPosition..<operationsLine.length{
                        if listIsInPartString(operationsLine[j], list: operationsList){
                            input2 = Float(operationsLine[operatorPosition..<j])
                            //print(input2)
                            endPosition = j
                            break
                        }
                    }
                    
                    switch operation{
                        
                        case "+":
                        answer = input1 + input2
                        
                        case "⁃":
                        answer = input1 - input2
                        
                        case "x":
                        answer = input1 * input2
                        
                        case "/":
                        answer = input1 / input2
                        
                        case "^":
                        answer = pow(input1,input2)
                        
                        default:
                        answer = nil
                        
                    }
                    //print(answer)
                    operationsLine = operationsLine.stringByReplacingOccurrencesOfString(operationsLine[startPosition..<endPosition], withString: String(answer))
                    operationsLine = operationsLine.stringByReplacingOccurrencesOfString("e+", withString: String("e"))
                    //print(operationsLine)
                    
                }
                
                    finalAnswer = Float(operationsLine[0..<operationsLine.length-1])
                    //print(answer)
                    answerLabel.text = String(finalAnswer)
                }


            }

        }

    override func viewDidLoad() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        self.view.addGestureRecognizer(longPressRecognizer)

    }
}

