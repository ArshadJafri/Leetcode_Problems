class Solution:
    def missingNumber(self, nums: List[int]) -> int:

        n = len(nums)
        sum_num = sum(nums)
        n_sum = n*(n+1)//2

        return n_sum-sum_num