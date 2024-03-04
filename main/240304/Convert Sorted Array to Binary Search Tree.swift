// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/

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
  func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    if nums.count == 1 {
      return TreeNode(nums.first!)
    }
    
    if nums.count == 2 {
      let node = TreeNode(nums[1], TreeNode(nums.first!), nil)
      return node
    }
    
    let mid = nums.count / 2
    let left = nums[..<mid]
    let right = nums[(mid + 1)...]
    
    if left.count == 1 && right.count == 1 {
      
    }
    
    var current = TreeNode(nums[mid])
    current.left = sortedArrayToBST(Array(left))
    current.right = sortedArrayToBST(Array(right))
    return current
  }
}

let sol = Solution()
let numbers = [0]
dump(sol.sortedArrayToBST(numbers))
