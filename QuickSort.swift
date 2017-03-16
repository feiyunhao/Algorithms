
import Foundation

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { return a }
    
    let pivot = a[a.count/2]
    let less = a.filter { $0 < pivot }
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}



func quicksort<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    
    func partition<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
        let pivot = a[low]
        var i = low - 1
        var j = high + 1
        
        while true {
            repeat { j -= 1 } while a[j] > pivot
            repeat { i += 1 } while a[i] < pivot
            if i < j {
                (a[i], a[j]) = (a[j], a[i])
//                swap(&a[i], &a[j])
            } else {
                return j
            }
        }
    }
    
    if low < high {
        let p = partition(&a, low: low, high: high)
        quicksort(&a, low: low, high: p)
        quicksort(&a, low: p + 1, high: high)
    }
}
