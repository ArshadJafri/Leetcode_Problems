class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        
        hashmap ={}

        for c in s:
            hashmap[c] = hashmap.get(c, 0) +1
        
        for c in t:
            if c not in hashmap:
                return False
            hashmap[c]-=1
            if hashmap[c]<0:
                return False

        for val in hashmap.values():
            if val != 0:
                return False

        return True
                