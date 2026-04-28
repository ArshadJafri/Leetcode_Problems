class Solution {

    List<List<Integer>> result = new ArrayList<>();

    public List<List<Integer>> combinationSum(int[] candidates, int target) {

        helper(candidates, 0, new ArrayList<>(), target);
        return result;    
    }

    public void  helper(int[] candidates, int start, List<Integer> path, int remaining){

        if(remaining == 0){
            result.add(new ArrayList<>(path));
            return;
        }

        if(remaining < 0){
            return;
        }

        for(int i = start; i<candidates.length;i++){
            path.add(candidates[i]);
            helper(candidates, i, path, remaining-candidates[i]);
            path.remove(path.size()-1);
        }
    }
}
