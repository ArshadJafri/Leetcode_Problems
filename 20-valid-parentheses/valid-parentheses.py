class Solution:
    def isValid(self, s: str) -> bool:
        
        result =[]
        hashmap ={')':'(','}':'{',']':'['}


        for ch in s:
            if ch in hashmap.values():
                result.append(ch)
            elif ch in hashmap:
                if not result or result[-1] != hashmap[ch]:
                    return False   
                else:
                    result.pop() 
            else:
                return False

        return not result
