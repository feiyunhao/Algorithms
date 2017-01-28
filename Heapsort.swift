//
//  Heapsort.swift
//  Heapsort
//
//  Created by admin on 2017/1/28.
//  Copyright © 2017年 shenyang. All rights reserved.
//


extension Array where Element: Comparable {
    mutating func merge(low: Int, middle: Int, high: Int) {
        var temp: [Element]  = []
        temp.reserveCapacity(high - low)
        var i = low, j = middle
        while i != middle && j != high {
            if self[i] < self[j] {
                temp.append(self[i])
                i += 1
            } else {
                temp.append(self[j])
                j += 1
            }
        }
        temp.append(contentsOf: self[i..<middle])
        temp.append(contentsOf: self[j..<high])
        replaceSubrange(low..<high, with: temp)
    }
    
    mutating func mergeSortInPlaceInefficient() {
        let n = count
        var size = 1
        while size < n {
            for low in stride(from: 0, to: n, by: size*2) {
                merge(low: low, middle: low+size, high: Swift.min(low+size*2,n))
            }
            size *= 2
        }
    }
}


extension Array where Element: Comparable {
    mutating func mergeSortInPlace() {
        // 定义所有 merge 操作所使用的临时存储
        var tmp: [Element] = []
        // 并且确保它的大小足够
        tmp.reserveCapacity(count)
        
        func merge(lo: Int, mi: Int, hi: Int) {
            // 清空存储，但是保留容量不变
            tmp.removeAll(keepingCapacity: true)
            // 和上面的代码一样
            var i = lo, j = mi
            while i != mi && j != hi {
                if self[j] < self[i] {
                    tmp.append(self[j])
                    j += 1
                } else {
                    tmp.append(self[i])
                    i += 1
                }
            }
            tmp.append(contentsOf: self[i..<mi])
            tmp.append(contentsOf: self[j..<hi])
            replaceSubrange(lo..<hi, with: tmp)
        }
        let n = count
        var size = 1
        while size < n {
            for lo in stride(from: 0, to: n-size, by: size*2) {
                merge(lo: lo, mi: (lo+size), hi: Swift.min(lo+size*2,n))
            }
            size *= 2
        }
    }
}

