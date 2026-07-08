class Solution {
    public int lastStoneWeight(int[] stones) {

        PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());

        for(int num : stones){
            maxHeap.offer(num);
        }

        while(maxHeap.size() >1){
            int largest = maxHeap.poll();
            int secondLargest = maxHeap.poll();

            if(largest > secondLargest){
                maxHeap.offer(largest-secondLargest);
            }
        }

        if(maxHeap.isEmpty()){
            return 0;
        }
        
        return maxHeap.peek();
    }
}