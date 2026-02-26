class Solution:
    def maxSubArray(self, nums: List[int]) -> int:

        currSum = nums[0]

        for i in range(1, len(nums)):

            nums[i] = max(nums[i], nums[i]+nums[i-1])
            currSum = max(nums[i], currSum)


        return currSum
        