class Solution:
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]:
        result = defaultdict(list)

        for i in strs:
            sortedste = ''.join(sorted(i))
            result[sortedste].append(i)

        return list(result.values())