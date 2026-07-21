class Solution:
    def missingNumber(self, nums: List[int]) -> int:

        n = len(nums)
        targetSum =0
        actualSum = (n*(n+1))//2
        
        for i in nums:
            targetSum += i

        return actualSum -  targetSum
        