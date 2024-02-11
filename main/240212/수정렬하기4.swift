// https://www.acmicpc.net/problem/11931

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
            var sum = 0
            var now = read()
            var isPositive = true

            while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
            if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
            while now >= 48, now <= 57 {
                sum = sum * 10 + Int(now-48)
                now = read()
            }

            return sum * (isPositive ? 1:-1)
        }
}

let file = FileIO()

let cnt = file.readInt()

var array = [Int]()

for _ in 0..<cnt {
  let number = file.readInt()
  array.append(number)
}

array.sorted(by: >).forEach {
  print($0)
}

//func mergeSort(_ array: [Int]) -> [Int] {
//  if array.count <= 1 { return array }
//
//  let c = array.count / 2
//  let l = Array(array[0..<c])
//  let r = Array(array[c..<array.count])
//
//  func merge(_ left: [Int], _ right: [Int]) -> [Int] {
//    var left = left, right = right
//
//    var result: [Int] = []
//
//    while (left.isEmpty == false) && (right.isEmpty == false) {
//      let l = left.first!
//      let r = right.first!
//
//      if l > r {
//        result.append(left.removeFirst())
//      } else {
//        result.append(right.removeFirst())
//      }
//    }
//
//    if left.isEmpty == false {
//      result.append(contentsOf: left)
//    }
//
//    if right.isEmpty == false {
//      result.append(contentsOf: right)
//    }
//
//    return result
//  }
//
//  return merge(mergeSort(l), mergeSort(r))
//}
//
//mergeSort(array).forEach { print($0) }

//
//func quickSort(_ array: [Int]) -> [Int] {
//  if array.isEmpty { return array }
//
//  let pivot = array.first!
//
//  let left = array.filter { $0 > pivot }
//  let right = array.filter { $0 < pivot }
//
//  return quickSort(left) + [pivot] + quickSort(right)
//}
//
//quickSort(array).forEach { print($0) }
