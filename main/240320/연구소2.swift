// https://www.acmicpc.net/problem/17141

typealias Pointer = (x: Int, y: Int)

let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = NM[0], m = NM[1]
var map = Array(repeating: [Int](), count: n)

var allCount: Int = .zero
var canPoints: [Pointer] = []

for row in 0..<n {
  var input = readLine()!.split(separator: " ").map { Int(String($0))! }
  
  for col in 0..<input.count {
    let v = input[col]
    
    if v == 2 {
      canPoints.append((row, col))
      input[col] = 0
    }
    if v == 1 { continue }
    
    allCount += 1
  }
  map[row] = input
}

func makePoints(depth: Int, max: Int, values: [Pointer], items: inout [[Pointer]], visit: [Bool]) {
  if depth == max {
    items.append(values)
    return
  }
  
  var values = values
  var visit = visit
  
  for idx in 0..<canPoints.count {
    if visit[idx] { continue }
    
    let point = canPoints[idx]
    values.append(point)
    visit[idx] = true
    makePoints(depth: depth + 1, max: max, values: values, items: &items, visit: visit)
    values.removeLast()
  }
}

func spread(startPoints: [Pointer], size: Int, allCount: Int, map: [[Int]]) -> Int {
  var map = map
  let xAxis = [1, -1, 0, 0], yAxis = [0, 0, 1, -1]
  var timeMap: [[Int]] = Array(repeating: Array(repeating: Int.max, count: size), count: size)
  
  var queue = startPoints.map { (pointer: $0, time: 0) }
  var front = 0
  var maxTime: Int = .min
  
  while queue.count != front {
    let temp = queue[front]
    maxTime = max(maxTime, temp.time)
    
    for idx in 0..<4 {
      let lx = xAxis[idx], ly = yAxis[idx]
      let dx = temp.pointer.x + lx
      let dy = temp.pointer.y + ly
      
      if dx < 0 || dx >= size || dy < 0 || dy >= size { continue }
      if map[dx][dy] == 1 || map[dx][dy] == 2 { continue }
      
      map[dx][dy] = 2
      timeMap[dx][dy] = temp.time
      queue.append((pointer: Pointer(x: dx, y: dy), time: temp.time + 1))
    }
    
    front += 1
  }
  return queue.count == allCount ? maxTime : -1
}

func main() {
  // x개의 바이러스 포인트를 N개로 조합하는 방법?
  var points = [[Pointer]]()
  let visit = Array(repeating: false, count: canPoints.count)
  makePoints(depth: .zero, max: m, values: [], items: &points, visit: visit)
  var minTime: Int = Int.max
  
  for point in points {
    var map = map
    point.forEach { map[$0][$1] = 2 }
    
    let time = spread(startPoints: point, size: n, allCount: allCount, map: map)
    
    if time < .zero { continue }
    minTime = min(minTime, time)
  }
  
  print(minTime == Int.max ? -1 : minTime)
}

main()
