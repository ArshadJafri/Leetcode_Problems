class Solution {
    public int longestConsecutive(int[] nums) {

        Set<Integer> set = new HashSet<>();

        // Step 1: add all numbers to set
        for (int num : nums) {
            set.add(num);
        }

        int maxLength = 0;

        // Step 2: check each number as potential start
        for (int num : set) {

            // only start if it's the beginning of sequence
            if (!set.contains(num - 1)) {

                int current = num;
                int length = 1;

                // expand sequence
                while (set.contains(current + 1)) {
                    current++;
                    length++;
                }

                maxLength = Math.max(maxLength, length);
            }
        }

        return maxLength;
    }
}