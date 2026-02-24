class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        n = len(nums)
        left = 0
        right = len(nums)-1
        pos = len(nums)-1
        res =[0]*n


        while left <=right:

            if abs(nums[left]) < abs(nums[right]):
                res[pos] = nums[right]**2
                right -=1

            else:
                res[pos] = nums[left]**2
                left+=1

            pos -=1

        return res