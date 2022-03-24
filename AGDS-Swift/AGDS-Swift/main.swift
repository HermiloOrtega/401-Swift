//
//  main.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-23.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

/* --------------------------------------------------- */
// ASSIGNMENTS
/*print("= Assignment 1 =")
    evaluate("7")
    evaluate("(2+2)")
    evaluate("(1+(2*4))")
    evaluate("((1+3)+((1+2)*5))")*/

// MINI PROJECTS
/*print("= File system Crawler =")
    var nFiles = 0, nFolders = 0, numbers = [Int]()
    numbers = fileSystemCrawler(at: URL(fileURLWithPath: FileManager.default.currentDirectoryPath), 0, "\t├─", &nFiles, &nFolders)
    print("\n\(numbers[0] - 1) directories, \(numbers[1]) files\n")*/

/*print("= Find Smallest or Largest =")
    findElements(numberOfItems: 10, numberOfElements: 3)*/

print("= Find Substring =")
    let index = findSubstring("NEEDLE", "INAHAYSTACKNEEDLEINA", 0)
    if(index>=0) { print("The pattern was founded at index \(index)") }
    else         { print("The pattern wasn't found") }
    
/* --------------------------------------------------- */
/*  RECURSION  */

    /* == Recursion == */
        /*print("= Power =")
            print(power(3, 4))
            print("")*/
        /*print("= isPalindrome =")
            print(isPalindrome("banasanab"))
            print(isPalindrome("banassnab"))
            print("")*/
        /*print("= Print Binary =")
            showBinary(5, "")
            print("")
            print("")
            showBinary(523, "")
            print("")
            print("")*/
        /*print("= reverseLines =")
            reverseLines(0)*/

    /* == Executive Search == */
        /*print("= printBinaryExhaustive =")
            printBinaryExhaustive(3)
            print("")
        print("= printDecimal =")
            printDecimal(4)
            print("")
        print("= permutation =")
            permutation("aaa")
            print("")
        print("= permutationUnique =")
            var uniqueSetOfPermutations = Set<String>()
            permutationUnique("aabbcc", "", &uniqueSetOfPermutations)
            print(uniqueSetOfPermutations)
            print("")*/

    /* == Backtracking == */
        /*print("= RollDice =")
            rollDice(2)
            print("")
        print("= RollDiceSumNaive =")
            rollDiceSumNaive(2, 5)
            print("")
        print("= rollDiceSum =")
            rollDiceSumNaive(2, 5)
            print("")*/

/*  Searching Shorting */
    /* == Searching == */
        /*print("= Searching =")
            var array = [2,4,6,8,0,1,3,5,7,9]
            print(linearSearch(array, 5) ?? "Not found")
            print(binarySearch(array, 5) ?? "Not found")
            print("")
        print("= Sorting =")
            //printDecimal(4)
            print("")*/

    /* == Sorting == */
        /*print("= Bubble Sort =")
            print(bubbleSort([7, 4, 1, 2, 8, 0, 3, 5, 1], <))
            print("")
        
        print("= Selection Sort =")
            print(selectionSort([7, 4, 1, 2, 8, 0, 3, 5, 1], <))
            print("")

        print("= Insertion Sort =")
            print(insertionSort([7, 4, 1, 2, 8, 0, 3, 5, 1], <))
            print("")

        print("= Merge Sort =")
            print(mergeSort([7, 4, 1, 2, 8, 0, 3, 5, 1], <))
            print("")

        print("= Quick Sort Slow =")
            print(quickSortSlow([7, 4, 1, 2, 8, 0, 3, 5, 1]))
            print("")

        print("= Quick Sort =")
            var arr = [7, 2, 1, 6, 8, 5, 3, 4]
            quickSort(&arr, 0, arr.count - 1)
            print(arr)
            print("")*/

/* == Data Structures 1 == */
    /*print("= Bag =")
        var bag = Bag<String>()
        bag.add(item: "Martin")
        bag.add(item: "Leandro")
        bag.add(item: "Melisa")
        bag.add(item: "Tomona")
        bag.add(item: "Hermilo")

        print(bag.isEmpty())
        print(bag.count)

        for item in bag{
            print(item)
        }

        print(bag)
        print("")*/
