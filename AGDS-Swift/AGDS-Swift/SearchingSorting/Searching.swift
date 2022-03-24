//
//  Searching.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-25.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation
// DocString: option + command + /

/// Linear Search Algorithm - O(N)
/// Returns the index of the given target value from the collection. Otherwise, nil.
/// - Parameters:
///   - collection: an array of equatable objects
///   - target: search target
/// - Returns: the index of the given target value from the collection. Otherwise, nil.
    func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
        var steps = 0
        //for (index, element) in collection.enumerated() where element == target {
        for (index, element) in collection.enumerated() {
            steps = steps + 1
            print("Step: \(steps)")
            if element == target {
                return index
            }
        }
        return nil
    }

/// Binary Search Algorithm (for sorted collections) - O(lg N)
/// the index of the given target value from the collection. Otherwise, nil.
/// - Parameters:
///   - collection: an array of comparable objects
///   - target: search target
/// - Returns: the index of the given target value from the collection. Otherwise, nil.
    func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
        var steps = 0
        var lower = 0
        var upper = collection.count - 1
        
        while lower <= upper {
            steps = steps + 1
            print("Step: \(steps)")
            let mid = (lower + upper) / 2
            if collection[mid] == target {
                return mid
            } else if collection[mid] < target {
                lower = mid + 1
            } else {
                upper = mid - 1
            }
        }
        return nil
    }
