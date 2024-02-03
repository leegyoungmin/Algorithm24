// https://www.acmicpc.net/problem/2583

//func 영역구하기() {
//  let MNK = readLine()!.split(separator: " ").map { Int($0)! }
//
//  let m = MNK[0]
//  let n = MNK[1]
//  let k = MNK[2]
//
//  var map = Array(repeating: Array(repeating: false, count: n), count: m)
//
//  for _ in 0..<k {
//    let values = readLine()!.split(separator: " ").map { Int($0)! }
//    
//    let x1 = values[0], y1 = values[1]
//    let x2 = values[2], y2 = values[3]
//    
//    for x in x1..<x2 {
//      for y in y1..<y2 {
//        map[m - y - 1][x] = true
//      }
//    }
//  }
//
//  func bfs(x: Int, y: Int, map: inout [[Bool]]) -> Int {
//    let xAxis = [0, 0, -1, 1]
//    let yAxis = [1, -1, 0, 0]
//    
//    var queue = [(x, y)]
//    var front: Int = 0
//    
//    while queue.count != front {
//      let cur = queue[front]
//      
//      for idx in 0..<xAxis.count {
//        let lx = xAxis[idx], ly = yAxis[idx]
//        let dx = cur.0 + lx, dy = cur.1 + ly
//        
//        if dx >= m || dx < 0 || dy >= n || dy < 0 { continue }
//        
//        if map[dx][dy] == false {
//          map[dx][dy] = true
//          queue.append((dx, dy))
//        }
//      }
//      
//      front += 1
//    }
//    
//    return queue.count
//  }
//
//  var cnt = 0
//  var answer = [Int]()
//
//  for row in 0..<m {
//    for col in 0..<n {
//      if map[row][col] == false {
//        cnt += 1
//        map[row][col] = true
//        
//        let result = bfs(x: row, y: col, map: &map)
//        answer.append(result)
//      }
//    }
//  }
//
//  print(cnt)
//  answer.sorted().forEach { print($0, terminator: " ") }
//}
