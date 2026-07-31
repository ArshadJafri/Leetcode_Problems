class TrieNode {

    TrieNode[] children;
    boolean isWord;

    public TrieNode() {
        children = new TrieNode[26];
        isWord = false;
    }
}

class WordDictionary {

    TrieNode root;

    public WordDictionary() {
        root = new TrieNode();
    }

    // Same as LeetCode 208
    public void addWord(String word) {

        TrieNode curr = root;

        for(char c : word.toCharArray()){

            int idx = c - 'a';

            if(curr.children[idx] == null){
                curr.children[idx] = new TrieNode();
            }

            curr = curr.children[idx];
        }

        curr.isWord = true;
    }

    // Start DFS from the root
    public boolean search(String word) {
        return dfs(word, 0, root);
    }

    // Recursive helper
    private boolean dfs(String word, int index, TrieNode node){

        // Path doesn't exist
        if(node == null){
            return false;
        }

        // Reached the end of the word
        if(index == word.length()){
            return node.isWord;
        }

        char c = word.charAt(index);

        // Normal character
        if(c != '.'){

            int idx = c - 'a';

            return dfs(word, index + 1, node.children[idx]);
        }

        // Wildcard '.'
        else{

            // Try every possible child
            for(int i = 0; i < 26; i++){

                if(node.children[i] != null){

                    if(dfs(word, index + 1, node.children[i])){
                        return true;
                    }

                }

            }

            return false;
        }
    }
}