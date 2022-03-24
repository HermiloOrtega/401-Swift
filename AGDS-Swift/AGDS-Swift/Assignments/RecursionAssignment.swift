//
//  Recursion.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-23.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

/*
     Evaluate
     Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
     - The expression will be "fully parenthesized" and will consist
        of + and * on single-digit integers only.
     - You can use a helper function. (Do not change the original function header)
     - Recursion
     
    evaluate("7")                   -> 7
    evaluate("(2+2)")               -> 4
    evaluate("(1+(2*4))")           -> 9
    evaluate("((1+3)+((1+2)*5))")   -> 19
 **/
    func evaluate(_ exp: String){
        print(evaluateHelper(exp, 0, ""))
    }
    func evaluateHelper(_ exp: String, _ index: Int, _ substring: String ) -> String{
        // Base Case
        if exp[0] != "(" { return exp }
        // Recusive Case
        var concat = exp
        var newIndex = index
        var newSub = substring + String(exp[index])
        if exp[index] == ")" {
            let firstParentesis = evaluateHelperTwo(exp, index)
            newSub = String(substring.prefix(firstParentesis)) + String(NSExpression(format:String(exp[exp.index(exp.startIndex, offsetBy: firstParentesis)..<exp.index(exp.endIndex, offsetBy: (index + 1) - exp.count)])).expressionValue(with: nil, context: nil) as! Int)
            concat = newSub + exp.suffix((exp.count-1) - index)
            newIndex = index - 4
        }
        return evaluateHelper(concat, newIndex + 1, newSub)
    }
    func evaluateHelperTwo(_ exp: String, _ index: Int)-> Int{
        if exp[index] == "(" { return index }
        return evaluateHelperTwo(exp, index - 1)
    }
