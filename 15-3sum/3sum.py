class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:

        nums.sort()
        res =[]

        for i in range(len(nums)):
            if i >0 and nums[i] == nums[i-1]:
                continue

            l, r = i+1, len(nums)-1

            while l<r:
                sum_zero = nums[i]+nums[l]+nums[r]

                if sum_zero ==0:
                    res.append([nums[i], nums[l],nums[r]])
                    while l <r and nums[l] ==nums[l+1]:
                        l+=1

                    while r > l and nums[r] == nums[r-1]:
                        r -=1

                    l +=1
                    r -=1

                elif sum_zero > 0:
                    r -=1
                else:
                    l+=1
        return res

        