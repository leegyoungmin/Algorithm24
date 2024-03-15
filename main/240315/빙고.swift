// https://www.acmicpc.net/problem/2578

var map = Array(repeating: [Int](), count: 5)
var calls = [Int]()

for idx in 0..<5 {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  map[idx] = input
}

for _ in 0..<5 {
  let input = readLine()!.split(separator: " ").map { Int(String($0))! }
  input.forEach { calls.append($0) }
}

var visit = Array(repeating: Array(repeating: false, count: 5), count: 5)

func find(target: Int, row: Int) {
  let values = map[row]
  
  for col in 0..<values.count {
    let v = values[col]
    
    if v != target { continue }
    
    visit[row][col] = true
    return
  }
  
  find(target: target, row: row + 1)
}

func checkBingo() -> Int {
  var cnt: Int = .zero
  var isCross1: Bool = true
  var isCross2: Bool = true
  
  for row in 0..<5 {
    cnt += (visit[row].filter { $0 }.count == 5) ? 1 : 0
    
    var isColumn = true
    for col in 0..<5 {
      if visit[col][row] == false {
        isColumn = false
        break
      }
    }
    
    cnt += (isColumn ? 1 : 0)
    
    
    if visit[row][row] == false {
      isCross1 = false
    }
    
    if visit[row][4 - row] == false {
      isCross2 = false
    }
  }
  
  cnt += (isCross1 ? 1 : 0)
  cnt += (isCross2 ? 1 : 0)
  return cnt
}

func main() {
  for idx in 0..<calls.count {
    let call = calls[idx]
    find(target: call, row: 0)
    
    if checkBingo() >= 3 {
      print(idx + 1)
      return
    }
  }
}

main()
