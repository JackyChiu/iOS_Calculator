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
    
    var answer: Float! = 0.0
    var operationsList = ["=","+","-","x","/"]
    var operationsListWithoutEquals = ["+","-","x","/"]
    
    func isIn(varible:String,list: [String])->Bool{
        for i in list{
            if varible == i{
                return true
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
    
    func endOfOperationsLine(operationsLine:String)->Bool{
        for i in 0..<operationsLine.length{
            if isIn(String(operationsLine[i]), list: operationsListWithoutEquals){
                return false
            }
        }
        return true
    }
    
    func getAnswer(operationsLine:String)->Float!{
        return Float(operationsLine[0..<operationsLine.length])
    }
    
    //Equations labels
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //Number buttons
    @IBAction func clearButton(sender: UIButton) {
        clearLabel()
    }
 
    @IBAction func oneButton(sender: UIButton) {
        operationsLabel.text! += "1"
    }

    @IBAction func twoButton(sender: UIButton) {
        operationsLabel.text! += "2"
    }
    
    @IBAction func threeButton(sender: UIButton) {
        operationsLabel.text! += "3"
    }
    
    @IBAction func fourButton(sender: UIButton) {
        operationsLabel.text! += "4"
    }
    
    @IBAction func fiveButton(sender: UIButton) {
        operationsLabel.text! += "5"
    }

    @IBAction func sixButton(sender: UIButton) {
        operationsLabel.text! += "6"
    }
    
    @IBAction func sevenButton(sender: UIButton) {
        operationsLabel.text! += "7"
    }
    
    @IBAction func eightButton(sender: UIButton) {
        operationsLabel.text! += "8"
    }
    
    @IBAction func nineButton(sender: UIButton) {
        operationsLabel.text! += "9"
    }
    
    //Operations buttons
    @IBAction func plusButton(sender: UIButton) {
        operationsLabel.text! += "+"
    }
    
    @IBAction func minusButton(sender: UIButton) {
        operationsLabel.text! += "-"
    }
    
    @IBAction func mutipleButton(sender: UIButton) {
        operationsLabel.text! += "x"
    }
    
    @IBAction func divisonButton(sender: UIButton) {
        operationsLabel.text! += "/"
    }
    

    @IBAction func equalButton(sender: UIButton) {
        
        var operationsLine:String
        var input1:Float!
        var input2:Float!
        var operatorPosition:Int!
        var endPosition:Int!
        var operation:Character = "A"
        
        operationsLabel.text! += "="
        operationsLine = operationsLabel.text!
        
        while(endOfOperationsLine(operationsLine)==false){
        
            for i in 0..<operationsLine.length{
                
                if isIn(String(operationsLine[i]), list: operationsList){
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
                
                if isIn(String(operationsLine[j]), list: operationsList){
                    input2 = Float(operationsLine[operatorPosition..<j])
                    endPosition = j
                    //print(input2)
                    //print(endPosition)
                    //print(operation)
                    break
                }
            }
            
            switch operation{
                
                case "+":
                answer = input1 + input2
                
                case "-":
                answer = input1 - input2
                
                case "x":
                answer = input1 * input2
                
                case "/":
                answer = input1 / input2
                
                default:
                answer = nil
                
            }
            
            operationsLine = operationsLine.stringByReplacingOccurrencesOfString(operationsLine[0..<endPosition], withString: String(answer))
            
            //print(operationsLine)
                
        }
        
        answer = Float(operationsLine[0..<operationsLine.length-1])
        //print(answer)
        
        answerLabel.text = String(answer)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

