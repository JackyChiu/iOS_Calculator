//
//  Calculator.swift
//  Calculator
//
//  Created by Jacky Chiu on 2016-04-30.
//  Copyright © 2016 Jacky Chiu. 
//

import Foundation

// Supporting varibles
var finalAnswer: Float! = 0.0
var answer: Float! = 0.0
let numbersList = [".","0","1","2","3","4","5","6","7","8","9","S"]
let numbersListWithNegative = ["-",".","0","1","2","3","4","5","6","7","8","9","S"]
let operationsList = ["=","+","⁃","x","/","^"]
let operationsListWithNegative = ["=","+","⁃","x","/","^","-"]
let operationsListWithoutEquals = ["+","⁃","x","/"]
let operationsListWithoutEqualsWithExponent = ["+","⁃","x","/","^"]
let higherPrecOperationsList = ["x","/"]
let lowerPrecOperationsList = ["+","⁃","="]

// Supporting functions
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

func onlyEqualsLeft(operationsLine:String)->Bool{
    for i in 0..<operationsLine.characters.count{
        if listIsInPartString(String(operationsLine[i]), list: operationsListWithoutEqualsWithExponent){
            return false
        }
    }
    return true
}

func endOfOperationLine(operationsLine:String)->Bool{
    if operationsLine[operationsLine.characters.count-1] == "="{
        return true
    }
    return false
}

class Calculator{
    var operationsLine:String?
    
    init(line:String){
        operationsLine = line
    }
    
    func calculate()->Float{
        var input1:Float!
        var input2:Float!
        var operatorPosition:Int!
        var startPosition:Int!
        var endPosition:Int!
        var operation:Character = "A"
        var listToBeNotIn:[String] = []
        var listToBeIn:[String] = []
        
        if operationsLine != ""{
            if listIsInPartString(operationsLine![operationsLine!.characters.count-1], list: operationsList) == false{
                operationsLine! += "="
                
                //replacements in the string
                operationsLine = operationsLine!.stringByReplacingOccurrencesOfString("ANS", withString: String(finalAnswer))
                operationsLine = operationsLine!.stringByReplacingOccurrencesOfString("e+", withString: String("e"))
                operationsLine = operationsLine!.stringByReplacingOccurrencesOfString("--", withString: String(""))
                
                //loop to read the string of operations
                while(onlyEqualsLeft(operationsLine!)==false){
                    
                    //eCase = false
                    startPosition = 0
                    
                    //Cases with expoentals
                    if listIsInWholeString(operationsLine!, list:["^"]){
                        listToBeNotIn = operationsListWithoutEquals
                        listToBeIn = ["^"]
                        
                    }
                        //Cases with higher precedence
                    else if listIsInWholeString(operationsLine!, list: higherPrecOperationsList){
                        listToBeNotIn = lowerPrecOperationsList
                        listToBeIn = higherPrecOperationsList
                    }
                        
                    else{
                        listToBeNotIn = [""]
                        listToBeIn = lowerPrecOperationsList
                    }
                    
                    //Main 2 loops that determine inputs
                    for i in 0..<operationsLine!.characters.count{
                        if listIsInPartString(operationsLine![i], list: listToBeNotIn){
                            startPosition = i + 1
                        }
                        if listIsInPartString(operationsLine![i], list: listToBeIn){
                            input1 = Float(operationsLine![startPosition..<i])!
                            //print(input1)
                            operation = operationsLine![i]
                            //print(operation)
                            
                            operatorPosition = i + 1
                            
                            break
                        }
                        
                    }
                    
                    for j in operatorPosition..<operationsLine!.characters.count{
                        if listIsInPartString(operationsLine![j], list: operationsList){
                            input2 = Float(operationsLine![operatorPosition..<j])!
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
                    operationsLine! = operationsLine!.stringByReplacingOccurrencesOfString(operationsLine![startPosition..<endPosition], withString: String(answer))
                    operationsLine! = operationsLine!.stringByReplacingOccurrencesOfString("e+", withString: String("e"))
                    print(operationsLine!)
                    
                }
                
                finalAnswer = Float(operationsLine![0..<operationsLine!.characters.count-1])
                print(answer)
            }
        }
        return finalAnswer
    }
}



