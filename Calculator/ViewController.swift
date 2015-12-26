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
    
    var answer: Int! = 0
    var operationsList = ["=","+","-","x","/"]
    
    func isIn(varible:String,list: [String])->Bool{
        for i in list{
            if varible == i{
                return true
            }
        }
        return false
    }
    
    //Equations labels
    @IBOutlet weak var operationsLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //Number buttons
    @IBAction func clearButton(sender: UIButton) {
        operationsLabel.text! = ""
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
        var input1:Int!
        var input2:Int!
        var position:Int!
        var operation:Character = "A"
        
        operationsLabel.text! += "="
        operationsLine = operationsLabel.text!
        
        for i in 0..<operationsLine.length{
            
            if isIn(String(operationsLine[i]), list: operationsList){
                input1 = Int(operationsLine[0..<i])
                operation = operationsLine[i]
                position = i + 1
                //print(position)
                //print(operation)
                //print(input1)
                break
            }
        }
        
        for j in position..<operationsLine.length{
            
            if isIn(String(operationsLine[j]), list: operationsList){
                input2 = Int(operationsLine[position..<j])
                //print(input2)
                //print(position)
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
        
        answerLabel.text = String(answer)
        

        /*
        
        for i in operationsLine.characters.indices{
        
        if isIn(String(operationsLine[i]), list: operationsList){
        input1 = Int(operationsLine.substringToIndex(i))
        operation = operationsLine[i]
        position = i
        print(position)
        //print(operation)
        //print(input1)
        break
        }
        }
            }
        }
*/
                

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

