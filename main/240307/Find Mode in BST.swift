// https://leetcode.com/problems/find-mode-in-binary-search-tree/description/

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
  
    public init() { self.val = 0; self.left = nil; self.right = nil; }
  
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
  
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
  var dict: [Int: Int] = [:]
  
  func findMode(_ root: TreeNode?) -> [Int] {
    appendValues(root)
    
    let maxValue = dict.values.max()!
    return Array(dict.filter { $0.value == maxValue }.map(\.key).sorted())
  }
  
  private func appendValues(_ node: TreeNode?) {
    guard let node = node else { return }
    
    dict[node.val, default: 0] += 1
    
    appendValues(node.left)
    appendValues(node.right)
  }
}

let sol = Solution()
let root = TreeNode(3, .init(1, .init(1), nil), .init(2, .init(2), nil))

print(sol.findMode(root))
