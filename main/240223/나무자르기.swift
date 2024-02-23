// https://www.acmicpc.net/problem/2805

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = NM[0], m = NM[1]

var values = readLine()!.split(separator: " ").map { Int(String($0))! }

values.sort()

var result: Int = .zero

func find() {
  var st = 0, en = values.last!
  
  while st < en {
    let mid = (st + en) / 2
    var sum = Int.zero
    
    for v in values {
      if v - mid < 0 { continue }
      sum += (v - mid)
    }
    
    if sum < m {
      en = mid
    } else {
      result = mid
      st = mid + 1
    }
  }
}

find()
print(result)

