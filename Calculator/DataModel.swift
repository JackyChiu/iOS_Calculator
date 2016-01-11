//
//  DataModel.swift
//  Calculator
//
//  Created by Jacky Chiu on 2016-01-07.
//  Copyright © 2016 Jacky Chiu.
//

import Foundation
import UIKit

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
    var colorRoation:Int = 0
