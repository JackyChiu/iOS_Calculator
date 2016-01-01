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
    var operationsList = ["=","+","⁃","x","/"]
    var operationsListWithoutEquals = ["+","⁃","x","/"]
    var higherPrecOperationsList = ["x","/"]
    var lowerPrecOperationsList = ["+","⁃","="]
    
    func isInList(varible:String,list:[String])->Bool{
        for i in list{
            if varible == i{
                return true
            }
        }
        return false
    }
    
    func higherPrecOccurance(varible:String, list:[String])->Bool{
        for i in 0..<varible.length{
            for j in list{
                if varible[i] == j{
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
            if isInList(String(operationsLine[i]), list: operationsListWithoutEquals){
                return false
            }
        }
        return true
    }
    
    func getAnswer(operationsLine:String)->Float!{
        return Float(operationsLine[0..<operationsLine.length])
    }
    
    func endOfOperationLine(operationsLine:String)->Bool{
        if operationsLine[operationsLine.length-1] == "="{
         return true
        }
        return false
    }
    
    func replaceSquare(operationsLine:String)->String{
        var input:String!
        var startPosition:Int! = 0
        var newString:String! = operationsLine
        
        for i in 0..<operationsLine.length{
            if isInList(String(operationsLine[i]), list: operationsListWithoutEquals){
                startPosition = i+1
            }
            if operationsLine[i] == "^"{
                input = operationsLine[startPosition..<i]
                //print(input)
                newString.replaceRange(newString.startIndex.advancedBy(i)..<newString.startIndex.advancedBy(i+2), with: "x"+input)
                //print(newString)
            }
        }
        return newString
    }
    
    //Equations labels
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
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
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPressed:")
        self.view.addGestureRecognizer(longPressRecognizer)

    }
    
    @IBAction func negativeButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "-"
    }
    
    @IBAction func answerButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if endOfOperationLine(operationsLabel.text!) == true{
                clearLabel()
            }
        }
        operationsLabel.text! += "ANS"
    }

    @IBAction func plusButton(sender: UIButton) {
        if operationsLabel.text! == ""{
            operationsLabel.text! += "+"
        }
        else if isInList(operationsLabel.text![operationsLabel.text!.length-1], list: operationsList) == false{
            operationsLabel.text! += "+"
        }

    }
    
    @IBAction func minusButton(sender: UIButton) {
        if operationsLabel.text! == ""{
            operationsLabel.text! += "⁃"
        }
        else if isInList(operationsLabel.text![operationsLabel.text!.length-1], list: operationsList) == false{
            operationsLabel.text! += "⁃"
        }
    }
    
    @IBAction func mutipleButton(sender: UIButton) {
        if operationsLabel.text! == ""{
            operationsLabel.text! += "x"
        }
        else if isInList(operationsLabel.text![operationsLabel.text!.length-1], list: operationsList) == false{
            operationsLabel.text! += "x"
        }    }
    
    @IBAction func divisonButton(sender: UIButton) {
        if operationsLabel.text! == ""{
            operationsLabel.text! += "/"
        }
        else if isInList(operationsLabel.text![operationsLabel.text!.length-1], list: operationsList) == false{
            operationsLabel.text! += "/"
        }
    }
    
    @IBAction func squareButton(sender: UIButton) {
        if operationsLabel.text! != ""{
            if isInList(operationsLabel.text![operationsLabel.text!.length-1], list: operationsList) == false{
                operationsLabel.text! += "^2"
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
        
        operationsLabel.text! += "="
        operationsLine = operationsLabel.text!
        
        //replacements in the string
        operationsLine = replaceSquare(operationsLine)
        operationsLine = operationsLine.stringByReplacingOccurrencesOfString("ANS", withString: String(finalAnswer))
        
        //loop to read the string of operations
        while(onlyEqualsLeft(operationsLine)==false){
            
            startPosition = 0
            
            //For cases where a operation with higher precedence occures as a later operation
            if higherPrecOccurance(operationsLine, list: higherPrecOperationsList){
                
                for i in 0..<operationsLine.length{
                    
                    if isInList(operationsLine[i], list: lowerPrecOperationsList){
                        startPosition = i + 1
                    }
                    if isInList(operationsLine[i], list: higherPrecOperationsList){
                        input1 = Float(operationsLine[startPosition..<i])
                        operation = operationsLine[i]
                        operatorPosition = i + 1
                        //print(operatorPosition)
                        //print(operation)
                        //print(input1)
                        break
                    }
                    
                }
                
                for j in operatorPosition..<operationsLine.length{
                    
                    if isInList(operationsLine[j], list: operationsList){
                        input2 = Float(operationsLine[operatorPosition..<j])
                        endPosition = j
                        //print(input2)
                        break
                    }
                }


            }
            
            // Regular case, does math left to right
            else{
        
                for i in 0..<operationsLine.length{
                    
                    if isInList(operationsLine[i], list: operationsList){
                        input1 = Float(operationsLine[0..<i])
                        operation = operationsLine[i]
                        operatorPosition = i + 1
                        //print(operatorPosition)
                        //print(operation)
                        //print(input1)
                        break
                    }
                }
                
                for j in operatorPosition..<operationsLine.length{
                    
                    if isInList(operationsLine[j], list: operationsList){
                        input2 = Float(operationsLine[operatorPosition..<j])
                        endPosition = j
                        //print(input2)
                        //print(endPosition)
                        //print(operation)
                        break
                    }
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
                
                default:
                answer = nil
                
            }
            
            operationsLine = operationsLine.stringByReplacingOccurrencesOfString(operationsLine[startPosition..<endPosition], withString: String(answer))
            
            //print(operationsLine)
                
        }
        
        finalAnswer = Float(operationsLine[0..<operationsLine.length-1])
        //print(answer)
        
        answerLabel.text = String(finalAnswer)
        
    }
}

