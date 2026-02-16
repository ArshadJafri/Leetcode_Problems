# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def isBalanced(self, root: Optional[TreeNode]) -> bool:

        def func(root):

            if root is None:
                return 0

            left = func(root.left)
            if left == -1:
                return -1

            right = func(root.right)
            if right == -1:
                return -1


            if abs(left-right) >1:
                return -1

            return max(left, right) +1


        return func(root)!= -1
        