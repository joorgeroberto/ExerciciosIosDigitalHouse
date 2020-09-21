//
//  Calculator.swift
//  Exercicio2
//
//  Created by Jorge on 18/09/20.
//  Copyright © 2020 Jorge. All rights reserved.
//

import Foundation

class Calculator {
    var total: Double
    
    init() {
        self.total = 0
    }
    func operation(firstNumber: Double, operation: String, secondNumber: Double?) -> Double {
        if let value = secondNumber {
            switch operation {
            case "+":
                return firstNumber + value
            case "-":
                return firstNumber - value
            case "*":
                return firstNumber * value
            case "/":
                return firstNumber / value
            default:
                return firstNumber + value
            }
        }
        else {
            return firstNumber
        }
    }
}
