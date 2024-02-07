// https://www.acmicpc.net/problem/15683
// FAIL

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0], m = NM[1]

var map = [[Int]]()

for _ in 0..<n {
  let values = readLine()!.split(separator: " ").map { Int($0)! }
  map.append(values)
}

let xAxis = [-1, 1, 0, 0], yAxis = [0, 0, -1, 1]

func checkMap(directions: [Direction], position: (x: Int, y: Int), map: inout [[Int]]) {
  var direction = directions
  var cnt: Int = .zero
  var mapValues = [[Int]]()
  
  var rotationCnt: Int = 0
  
  while rotationCnt != 4 {
    var count: Int = 1
    var map = map
    
    print(direction)
    for d in direction {
      let x = xAxis[d.rawValue]
      let y = yAxis[d.rawValue]
      
      var position = (position.x + x, position.y + y)
      
      while position.0 < n && position.0 > -1 && position.1 < m && position.1 > -1 && map[position.0][position.1] != 6 {
        if map[position.0][position.1] == 0 {
          map[position.0][position.1] = -1
          count += 1
        }
        
        position.0 += x
        position.1 += y
      }
    }
    direction = direction.map { $0.rotation() }
    print(count)
    if count > cnt {
      cnt = count
      mapValues = map
    }
    
    rotationCnt += 1
  }
  print(mapValues)
  map = mapValues
}

enum Direction: Int, CaseIterable {
  case top = 0
  case right = 3
  case down = 1
  case left = 2
  
  func rotation() -> Self {
    switch self {
      case .top:
        return .right
      case .right:
        return .down
      case .down:
        return .left
      case .left:
        return .top
    }
  }
}

func generateMap(x: Int, y: Int, target: Int, map: inout [[Int]]) {
  switch map[x][y] {
    case 1:
      checkMap(directions: [.right], position: (x, y), map: &map)
      
    case 2:
      checkMap(directions: [.left, .right], position: (x, y), map: &map)
      
    case 3:
      checkMap(directions: [.top, .right], position: (x, y), map: &map)
      
    case 4:
      checkMap(directions: [.top, .left, .right], position: (x, y), map: &map)

    case 5:
      checkMap(directions: Direction.allCases, position: (x, y), map: &map)
      
    default:
      return
  }
}

for r in 0..<n {
  for c in 0..<m {
    if map[r][c] <= .zero || map[r][c] == 6 { continue }
    generateMap(x: r, y: c, target: map[r][c], map: &map)
  }
}

var answer = map.map { $0.filter { $0 == .zero }.count }.reduce(0, +)

print("[")
for m in map {
  print(m)
}
print("]")

print(answer)
