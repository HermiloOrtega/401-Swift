//
//  Recursion2.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-23.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

// 1.- power(base, exponent): base^exponent
    func power(_ base: Int,_ exponent: Int)->Int{
        assert(exponent >= 0)
        //base case
            if exponent == 0 { return 1 }
        // recursive case
            return base * power(base, exponent - 1)
    }

// 2.- isPalindrome(word): Checks if a word is a palindrome
    func isPalindrome(_ word: String) -> Bool{
        // base case
            if word.count <= 1 { return true }
        // recursive case
            if let first = word.first, let last = word.last, first == last{
                return isPalindrome(word[1, word.count - 1])
            }
            return false
    }

// 3.- printBinary(n): prints binary form of given int
    func showBinary(_ n:Int, _ padding:String){
            print(padding, #function, n, n%2)
            if(n<0){
                print("-", terminator: "")
                showBinary(-n, padding + "  ")
            }
        // base case
            if n < 2{
                print(n, terminator:"")
                return
            }
        // recursive case
            showBinary(n/2, padding + "  ")
        
            print(n%2, terminator:"")
    }

// 4.- ReverseLines
//      - Print all lines in reverse order (recursively) from a text file
//      - You can change the function header if you want
    func reverseLines(_ line: Int){
        let sentences = try! String(contentsOfFile: "/Users/hermilo/Dropbox/WMAD/401 - Swift Programming (Algorithms & Data Structures)/401-Swift/AGDS-Swift/AGDS-Swift/Recursion/story.txt").split(separator: "\n")
        if line < sentences.count{
            reverseLines(line + 1)
            print(sentences[line])
        }
    }

/// 5. evaluate
/// Write a recursive function evaluate that accepts a string representing a math expression and computes its value.
/// - The expression will be "fully parenthesized" and will consist of + and * on single-digit integers only.
/// - You can use a helper function. (Do not change the original function header)
/// - Use Recursion
/// evaluate("7")                 -> 7
/// evaluate("(2+2)")             -> 4
/// evaluate("(1+(2*4))")         -> 9
/// evaluate("((1+3)+((1+2)*5))") -> 19
    func evaluate(_ expr: String) -> Int {
      var i = 0
      return evaluateHelper(expr, &i)
    }

    func evaluateHelper(_ expr: String, _ i: inout Int) -> Int {
      if Character(expr[i]).isNumber {
        return Int(expr[i])!
      } else {
        i += 1                               // skip (
        let left = evaluateHelper(expr, &i)  // expr or num
        i += 1
        let op = expr[i]                     // operator (+, *)
        i += 1
        let right = evaluateHelper(expr, &i) // expr or num
        i += 1                               // skip )
        if op == "+" {
          return left + right
        } else {
          return left * right
        }
      }
    }
