// https://www.acmicpc.net/problem/1253

let n = Int(readLine()!)!

var values = readLine()!.split(separator: " ").map { Int(String($0))! }

values.sort()

func find(to idx: Int) -> Int {
  var st = 0, en = n - 1
  let target = values[idx]
  
  while st < en {
    let sum = values[st] + values[en]
    
    if sum > target {
      en -= 1
    } else if sum < target {
      st += 1
    } else if sum == target {
      if idx != st && idx != en {
        return 1
      } else if idx == en {
        en -= 1
      } else {
        st += 1
      }
    }
  }
  
  return 0
}

var ans = Int.zero

for idx in 0..<n {
  ans += find(to: idx)
}
print(ans)

