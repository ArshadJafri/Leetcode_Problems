class Solution:
    def letterCasePermutation(self, s: str) -> List[str]:

        res =[]

        def dfs(index, path):

            if index == len(s):
                res.append(path)
                return 
            
            if s[index].isalpha():
                dfs(index+1, path+s[index].lower())
                dfs(index+1, path+s[index].upper())

            else:
                dfs(index+1, path+s[index])


        

        dfs(0,"")
        return res