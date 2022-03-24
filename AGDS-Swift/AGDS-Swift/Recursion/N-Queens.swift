//
//  Recursion2.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-23.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

func solve8Queens(board: inout Board, col: Int) -> Bool {
  if col >= board.size {
    print(board)
    return true
  } else {
    for row in 0..<board.size {
      if board.isSafe(row: row, col: col) {
        board.place(row: row, col: col)
        if solve8Queens(board: &board, col: col + 1) {
          return true
        }
        board.remove(row: row, col: col)
      }
    }
    return false
  }
}

struct Board: CustomStringConvertible {
  private var board: [[String]]
  let size: Int
  
  init(size: Int) {
    self.size = size
    self.board = [[String]](repeating: [String](repeating: "-", count: size), count: size)
  }
  
  private func isOnBoard(row: Int, col: Int) -> Bool {
    return row >= 0 && row < self.size && col >= 0 && col < self.size
  }
  
  func isSafe(row: Int, col: Int) -> Bool {
    if !isOnBoard(row: row, col: col) {
      return false
    }
    if self.board[row][col] != "-" {
      return false
    }
    let rows = self.board[row].filter({ $0 == "Q" }).count
    let cols = self.board.filter({ $0[col] == "Q" }).count
    if rows != 0 || cols != 0 {
      return false
    }
    // check diagonals
    for d in 0..<self.size {
      if   (isOnBoard(row: row - d, col: col - d) && self.board[row-d][col-d] == "Q")
        || (isOnBoard(row: row + d, col: col + d) && self.board[row+d][col+d] == "Q")
        || (isOnBoard(row: row + d, col: col - d) && self.board[row+d][col-d] == "Q")
        || (isOnBoard(row: row - d, col: col + d) && self.board[row-d][col+d] == "Q") {
        return false
      }
    }
    return true
  }
  
  mutating func place(row: Int, col: Int) {
    if isOnBoard(row: row, col: col) {
      self.board[row][col] = "Q"
    }
  }
  
  mutating func remove(row: Int, col: Int) {
    if isOnBoard(row: row, col: col) {
      self.board[row][col] = "-"
    }
  }
  
  var description: String {
    return self.board.reduce("", { (acc, next) in
      let regex = try! NSRegularExpression(pattern: "[\",]", options: .caseInsensitive)
      let pretty = regex.stringByReplacingMatches(in: next.description, options: [], range: NSMakeRange(0, next.description.count), withTemplate: "")
      return acc + pretty + "\n"
    })
  }
}
