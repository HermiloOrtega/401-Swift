//
//  Bag.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-07-09.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation


/// The **Bag** class represents a bag of generic items.
/// It supports insertion and iterating over the items in arbitrary order
/// This implementation users a singly liked list with an inner class Node.
/// The *add*, *isEmpty*, and *count* operations take constant time *O(1)*. Iteration takes linear time *O(n)*.
public final class Bag<E> : Sequence{
    /// beginning of bag
    private var first: Node<E>? = nil
    /// number of elements in bag
    private(set) var count: Int = 0
    
    /// helper linked list node class
    fileprivate class Node<E>{
        fileprivate var item: E
        fileprivate var next: Node<E>?
        fileprivate init(item: E, next: Node<E>? = nil){
            self.item = item
            self.next = next
        }
    }
    
    /// Initializes an empty bag
    public init(){}
    
    
    /// returns true if the bag is empty
    /// - Returns: true if this bag is empty, otherwise false.
    public func isEmpty() -> Bool{
        return first == nil
    }
    
    /// Adds the item to this bag (front)
    /// - Parameter item: the item to add to this bag
    public func add(item: E){
        let oldFirst = first
        first = Node<E>(item: item, next:oldFirst)
        count += 1
    }
    
    /// BagIterator that iterates over the items in this bag in arbitary order. (reverse order)
    public struct BagIterator<E> : IteratorProtocol{
        private var current: Node<E>?
        
        fileprivate init(_ first: Node<E>?){
            self.current = first
        }
        
        public mutating func next() -> E? {
            if let item = current?.item{
                current = current?.next
                return item
            }
            return nil
        }
        
        public typealias Element = E
    }
    
    /// Return an iterator that iterates over the items in this bag in reverse order
    public func makeIterator() -> BagIterator<E> {
        return BagIterator<E>(first)
    }
}

extension Bag: CustomStringConvertible{
    public var description: String{
        return self.reduce(into: "") { $0 += "\($1), "}
    }
}
