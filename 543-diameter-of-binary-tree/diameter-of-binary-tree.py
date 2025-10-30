# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def diameterOfBinaryTree(self, root: Optional[TreeNode]) -> int:
        self.diameter = 0

        def helper(node):
            if node is None:
                return 0 

            leftHelp = helper(node.left)
            rightHelp = helper(node.right)
            self.diameter = max(self.diameter, leftHelp+rightHelp)

            return 1 + max(leftHelp, rightHelp)

        helper(root)
        return self.diameter