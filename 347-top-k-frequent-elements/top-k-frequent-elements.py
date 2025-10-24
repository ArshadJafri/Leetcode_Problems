class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:

        count = {}

        for n in nums:
            count[n] = 1 + count.get(n,0)

        sorted_items = sorted(count.items(), key = lambda x :x[1], reverse =True)

        result = [item[0] for item in sorted_items[:k]]

        return result