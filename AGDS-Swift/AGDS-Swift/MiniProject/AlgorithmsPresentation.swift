//
//  AlgorithmsPresentation.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-07-14.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

/*  Find the smallest/largest M elements in a stream of N items.

    Your algorithm should not exceed the following complexity.
        Time: O(N lg M)
        Space: O(M)
    You can think of a stream of items as stdin.
    You are allowed to use any data structures / algorithms of your choice.
 **/
func findElements(numberOfItems n: Int, numberOfElements m: Int) -> [Int] {
    var arrayOfElements = [Int]()
    for _ in 0...n-1 {
        let input = Int(readLine()!)!
        let indexOfE = arrayOfElements.count
        if arrayOfElements.count < m {
            arrayOfElements.append(input)
        }
        organizeAfterAddition(input, indexOfE, m, &arrayOfElements, <)
    }
    print(arrayOfElements)
    return arrayOfElements
}

func organizeAfterAddition(_ e: Int, _ indexOfE: Int, _ numberOfElements: Int, _ array: inout [Int], _ comparator: (Int, Int) -> Bool) {
    if indexOfE == 0 { return }
    var index = indexOfE / 2
    if !isLeftChild(indexOfE) {
        index -= 1
    }
    
    let temp = array[index]
    
    if indexOfE < numberOfElements {
        if (comparator(e, array[index])) { return }
        array[index] = e
        array[indexOfE] = temp
        organizeAfterAddition(e, index, numberOfElements, &array, comparator)
    }
    if comparator(e, array[0]) {
        array[0] = e
        organizeAfterDeletion(0, &array)
    }
}

func isLeftChild(_ i: Int) -> Bool {
    return i % 2 == 1
}

func organizeAfterDeletion(_ i: Int, _ array: inout [Int]){
    if 2 * i + 1 >= array.count {
        return
    }
    if 2 * i + 2 < array.count {
        if array[2 * i + 2] > array[2 * i + 1] && array[i] < array[2 * i + 2] {
            let temp = array[2 * i + 2]
            array[2 * i + 2] = array[i]
            array[i] = temp
            organizeAfterDeletion((2 * i + 2), &array)
        }
    }
    if array[i] < array[2 * i + 1] {
        let temp = array[2 * i + 1]
        array[2 * i + 1] = array[i]
        array[i] = temp
        organizeAfterDeletion((2 * i + 1), &array)
    }
}

/*
    Find the substring pattern of length M in a text of length N.
    Assume than N >= M
    Return the index of the starting index
        Pattern -> NEEDLE
        Text    -> INAHAYSTACKNEEDLEINA
        Match   ->            NEEDLE
    
    Your algorithm should no exceed the following complexity
        Time: Linear time O(N) or O(N+M)
            Can NOT be O(N * M)
        Space: O(M)
            Optional: You can try to get the starting index without backing up the current straing you're processing
    You are allowed to use any data structure / algorithms of your choice
 **/

/*
let text = "HELLO WORLD"
text.index(of: "ELLO") // returns 1
text.index(of: "LD") // returns 9

func findSubstringWorstCase(of pattern: String) -> Index? {
  for i in indices {
    var j = i
    var found = true
    for p in pattern.indices {
      guard j != endIndex && self[j] == pattern[p] else { found = false; break }
      j = index(after: j)
    }
    if found {
      return i
    }
  }
  return nil
}
*/

func findSubstring(_ pattern: String, _ text: String, _ index: Int) -> Int{
    if index+pattern.count>text.count              { return -1}
    if pattern == text[index, index+pattern.count] { return index }
    return findSubstring(pattern, text, index+1)
}
