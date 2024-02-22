// https://www.acmicpc.net/problem/2156

let n = Int(readLine()!)!

var map: [Int] = [0]

for _ in 0..<n {
  let v = Int(readLine()!)!
  map.append(v)
}

func dp() {
  var dict = Array(repeating: 0, count: 10001)
  
  dict[1] = map[1]
  
  if n >= 2 {
    dict[2] = map[1] + map[2]
  }
  
  if n <= 2 {
    print(dict[n])
    return
  }

  for idx in 3...n {
    dict[idx] = max(dict[idx - 2] + map[idx], dict[idx - 3] + map[idx - 1] + map[idx], dict[idx - 1])
  }
  
  print(dict[n])
}

dp()
