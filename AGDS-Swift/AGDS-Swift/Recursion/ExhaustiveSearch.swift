//
//  ExhaustiveSearch.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-24.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

/// Print all binary number representation with n digits
/// - Parameter n: the number of digits
    func printBinaryExhaustive(_ n: Int) {
      printBinaryExhaustiveHelper(n)
    }
    func printBinaryExhaustiveHelper(_ n: Int, _ soFar: String = "", _ indent: String = "") {
      print("\(indent)\("printBinaryExhaustive")(n=\(n), soFar=\(soFar))")
      if n == 0 {
        // we have no more digits left to choose
        print(soFar)
        
      } else {
        // we have more decisions to make
        // for each available choices (0 or 1)
        // choose one & search
        printBinaryExhaustiveHelper(n - 1, soFar + "0", indent + "  ")
        printBinaryExhaustiveHelper(n - 1, soFar + "1", indent + "  ")
      }
    }

/// Print all decimal number representation with n digits
/// - Parameter n: the number digits
    func printDecimal(_ n: Int, _ soFar: String = "") {
      if n == 0 {
        print(soFar)
      } else {
        for i in 0...3 {
          printDecimal(n - 1, soFar + "\(i)")
        }
      }
    }

/// Write a recursive function permutation that accepts a string as a parameter
/// and outputs all possible rearrangements of the letters in the string.
/// - Parameter word: the string
    func permutation(_ word: String) {
      permutationHelper(word)
    }
    func permutationHelper(_ word: String, _ soFar: String = "") {
      if word.count == 0 {
        print(soFar)
      } else {
        for i in 0..<word.count {
          let c = word[i] // chosen character
          permutationHelper(word[0, i] + word[i+1, word.count], soFar + c)
        }
      }
    }
    func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
      if word.count == 0 {
        set.insert(soFar)
      } else {
        for i in 0..<word.count {
          let c = word[i] // chosen character
          permutationUnique(word[0, i] + word[i+1, word.count], soFar + c, &set)
        }
      }
    }
