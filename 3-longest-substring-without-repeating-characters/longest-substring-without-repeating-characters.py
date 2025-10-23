class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        

        seen_set = set()
        maxLen =0
        l = 0

        for r in range(len(s)):
            while s[r] in seen_set:
                seen_set.remove(s[l])
                l+=1
            seen_set.add(s[r])
            maxLen = max(maxLen, r-l+1)


        return maxLen