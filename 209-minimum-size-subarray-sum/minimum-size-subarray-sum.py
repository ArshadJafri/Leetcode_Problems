class Solution:
    def minSubArrayLen(self, target: int, nums: List[int]) -> int:

        l = 0
        min_len = float('inf')
        sum_ = 0

        for r in range(len(nums)):
            sum_ += nums[r]


            while target <= sum_:
                min_len = min(min_len, r-l+1)
                sum_ -=nums[l]
                l +=1

        return 0 if min_len == float('inf') else min_len
                

        