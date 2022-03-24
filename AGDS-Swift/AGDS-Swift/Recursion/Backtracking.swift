//
//  Backtracking.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-26.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

/// Exhaustive search (review)
    func rollDice(_ n: Int) {
      var choices = [Int]()
      rollDiceHelper(n, choices: &choices)
    }
    func rollDiceHelper(_ n: Int, choices: inout [Int]) {
      if n == 0 {
        print(choices)
      } else {
        for i in 1...6 {
          // choose
          choices.append(i)
          // explore
          rollDiceHelper(n - 1, choices: &choices)
          // un-choose
          choices.removeLast()
        }
      }
    }

/// Backtracking Problem
/// Output all combinations of die values that add up to the desired sum.
/// - Parameters:
///   - n: the number of dice
///   - sum: a desired sum
    func rollDiceSumNaive(_ n: Int, _ sum: Int) {
      var choices = [Int]()
      rollDiceSumHelperNaive(n, sum, &choices)
    }
    var counter = 0
    func rollDiceSumHelperNaive(_ n: Int, _ desiredSum: Int, _ choices: inout [Int]) {
      if n == 0 {
        if desiredSum == 0 {
          print(choices)
        }
      } else {
        for i in 1...6 {
          choices.append(i)
          rollDiceSumHelperNaive(n - 1, desiredSum - i, &choices)
          choices.removeLast()
        }
      }
    }

/// Optimized
    func rollDiceSum(_ n: Int, _ sum: Int) {
      var choices = [Int]()
      rollDiceSumHelper(n, sum, 0, &choices)
    }
    func rollDiceSumHelper(_ n: Int, _ desiredSum: Int, _ soFar: Int, _ choices: inout [Int]) {
      counter += 1
      if n == 0 {
        if soFar == desiredSum {
          print(choices)
        }
      } else {
        for i in 1...6 {
          if (soFar + i + 1 * (n - 1) <= desiredSum) && (soFar + i + 6 * (n - 1) >= desiredSum) { // prune the tree
            choices.append(i)
            rollDiceSumHelper(n - 1, desiredSum, soFar + i, &choices)
            choices.removeLast()
          }
        }
      }
    }
