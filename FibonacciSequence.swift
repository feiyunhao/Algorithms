//
//  Fibonacci Sequence.swift
//  SwiftProduct
//
//  Created by admin on 2017/1/28.
//  Copyright © 2017年 shenyang. All rights reserved.
//


struct FibsIterator: IteratorProtocol {
    var state = (0, 1)
    mutating func next() -> Int? {
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}

//FibsIterator().next()

struct FibsSequence: Sequence {
    func makeIterator() -> FibsIterator {
        return FibsIterator()
    }
}

//for item in FibsSequence() {
//    print(item)
//}
