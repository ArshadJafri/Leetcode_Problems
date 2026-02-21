class Solution:
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:

        nums_sorted = sorted(nums)
        my_hash ={}

        for i, num in enumerate(nums_sorted):
            if num not in my_hash:
                my_hash[num] = i

        res =[]

        for i in nums:
            res.append(my_hash[i])

        return res

        