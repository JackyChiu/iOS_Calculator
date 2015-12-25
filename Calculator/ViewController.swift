//
//  ViewController.swift
//  Calculator
//
//  Created by Jacky Chiu on 2015-12-24.
//  Copyright © 2015 Jacky Chiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Answer: Int = 0
    var operations = ["=","+","-","X","/"]
    
    func isIn(varible:String,list: [String])->Bool{
        for i in list{
            if varible == i{
                return true
            }
        }
        return false
    }
    
    @IBOutlet weak var operationsLabel: UILabel!
    
    @IBAction func clearButton(sender: UIButton) {
        operationsLabel.text = ""
    }
 
    @IBAction func oneButton(sender: UIButton) {
        operationsLabel.text! += "1"
    }

    @IBAction func twoButton(sender: UIButton) {
        operationsLabel.text! += "2"
    }

    @IBAction func plusButton(sender: UIButton) {
        operationsLabel.text! += "+"
    }
    
    @IBAction func equalButton(sender: UIButton) {
        
        var operationsLine:String
        //var input1:Int
        //var input2:Int
        //var operation:String
        
        operationsLabel.text! += "="
        operationsLine = operationsLabel.text!
        
        for i in operationsLine.characters{
            if isIn(String(i), list: operations){
                print(i)
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

