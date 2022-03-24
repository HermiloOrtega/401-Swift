//
//  Sorting.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-25.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

// Bubble Sort
// Time Complexity: O(n^2)
// Space Complexity: O(n)
func bubbleSort<T: Comparable>(_ arr: [T], _ comparator: (T,T) -> Bool) -> [T]{
    guard arr.count > 1 else { return arr }
    var elements = arr
    for i in 0..<elements.count - 1 {
        for j in 1..<elements.count - i {
            if comparator(elements[j], elements[j-1]) {
                //swap
                //print("switch : \(elements[j]) by \(elements[j-1])")
                //print(elements)
                //print("")
                let temp = elements[j-1]
                elements[j-1] = elements[j]
                elements[j]   = temp
            }
        }
    }
    return elements
}

// Selection Sort
// Time Complexity: O(n^2)
// Space Complexity: O(n)
func selectionSort<T: Comparable>(_ arr: [T], _ comparator: (T,T) -> Bool) -> [T]{
    guard arr.count > 1 else { return arr }
    var elements = arr
    for i in 0..<elements.count - 1 {
        var indexMin = i
        for j in i+1..<elements.count {
            if comparator(elements[j], elements[indexMin]) {
                indexMin = j
            }
        }
        if i != indexMin {
            //print("Current position and element: [\(i)] \(elements[i])\nMin number is: [\(indexMin)] \(elements[indexMin])\nSwitch : \(elements[i]) by \(elements[indexMin])")
            //print(elements)
            //print("")
            elements.swapAt(indexMin, i)
        }
    }
    return elements
}

// Insertion Sort
// Time Complexity: O(n^2)
// Space Complexity: O(n)
func insertionSort<T: Comparable>(_ arr: [T], _ comparator: (T,T) -> Bool) -> [T]{
    guard arr.count > 1 else { return arr }
    var elements = arr
    for i in 1..<elements.count {
        var j = i
        let toInsert = elements[j]
        while j > 0 && comparator(toInsert, elements[j-1]) {
            //shift
            //print("Shift : \(elements[i]) by \(elements[j-1])")
            //print(elements)
            //print("")
            elements[j] = elements[j-1]
            j -= 1
        }
        elements[j] = toInsert
    }
    return elements
}

// Merge Sort
// Time Complexity: O(N lgN)
// Space Complexity: O(N)
func mergeSort<T: Comparable>(_ arr: [T], _ comparator: (T,T) -> Bool) -> [T]{
    guard arr.count > 1 else { return arr }
    
    // O(log N)
    let mid = arr.count / 2
    let sortedLeft = mergeSort(Array(arr[..<mid]), comparator)
    let sortedRight = mergeSort(Array(arr[mid...]), comparator)
    // O(N)
    return merge(sortedLeft, sortedRight, comparator)
}

// Time Complexity: O(N)
func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T]{
    var i = 0
    var j = 0
    var merged: [T] = []
    while true{
        guard i < left.count else{
            merged.append(contentsOf: right[j...])
            break
        }
        guard j < right.count else{
            merged.append(contentsOf: left[i...])
            break
        }
        if comparator(left[i], right[j]) {
            merged.append(left[i])
            i += 1
        } else{
            merged.append(right[j])
            j += 1
        }
    }
    return merged
}

// * Quick Sort (sorts in-place)
// Space Complexity: O(n) -> should be 0(1)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T]{
    if arr.count <= 1 { return arr }
    var elements = arr
    let pivot = elements.removeLast()
    let lessOrEqual = elements.filter { $0 <= pivot }
    let greater = elements.filter { $0 > pivot }
    return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}


// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    if start < end {
        let point = partition(&arr, start, end) // Call partition
        quickSort(&arr, start, point - 1)
        quickSort(&arr, point + 1, end)
    }
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    let pivot = arr[end]
    var pIndex = start                  // Set partition index as start initially
    let index = start
    for index in index..<end {
        if arr[index] <= pivot {
            arr.swapAt(index, pIndex)   // Swap if element is leasser than pivot
            pIndex = pIndex + 1
        }
    }
    arr.swapAt(pIndex, end)             // Swap pivot with element at partition index
    return pIndex
}
