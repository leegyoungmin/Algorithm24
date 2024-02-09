// https://www.acmicpc.net/problem/11559
// FAIL

var map = Array(repeating: [Character](), count: 12)

for idx in 0..<12 {
  readLine()!.forEach {
    map[idx].append($0)
  }
}

func bfs(row: Int, col: Int) -> Bool {
  let target = map[row][col]
  let xAxis = [1, -1, 0, 0], yAxis = [0, 0, 1, -1]
  var queue: [(row: Int, col: Int)] = [(row: row, col: col)]
  var front = 0
  
  while queue.count != front {
    let cur = queue[front]
    
    for idx in 0..<xAxis.count {
      let dx = cur.row + xAxis[idx], dy = cur.col + yAxis[idx]
      
      if dx < 0 || dx >= 12 || dy < 0 || dy >= map[row].count { continue }
      if queue.contains(where: { $0.row == dx && $0.col == dy }) { continue }
      if map[dx][dy] != target { continue }
      
      queue.append((row: dx, col: dy))
      
      if queue.count == 4 {
        changeMap(queue: queue)
        return true
      }
    }
    front += 1
  }
  
  return false
}

func changeMap(queue: [(row: Int, col: Int)]) {
  for point in queue {
    map[point.row][point.col] = "."
    
    var k = point.row
    
    while k >= 0 {
      print(k)
      for col in stride(from: map[k].count - 1, to: 0, by: -1) {
        if k <= 0 { break }
        if map[k][col] == "." { k -= 1; break }
        
        print(map[k][col])
      }
    }
  }
  
  print(map)
}

for row in 0..<12 {
  for col in 0..<map[row].count {
    if map[row][col] == "." { continue }
    
    let r = bfs(row: row, col: col)
    print(r)
  }
}
