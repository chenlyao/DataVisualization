package test;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class lengthOfLongestSubstring {

    public static void main(String[] args) {
        String s = "abcabcbb";
        lengthOfLongestSubstring a = new lengthOfLongestSubstring();
        System.out.println(a.lengthOfLongestSubstring(s));
    }

//暴力解法
//    public int lengthOfLongestSubstring(String s) {
//        int n = s.length();
//        int ans = 0;
//        for (int i = 0; i < n; i++)
//            for (int j = i + 1; j <= n; j++)
//                if (allUnique(s,i,j)) ans=Math.max(ans,j-i);
//                return ans;
//    }
//
//    public boolean allUnique(String s, int start, int end) {
//        Set<Character> set = new HashSet<Character>();
//        for (int i = start; i < end; i++) {
//            Character ch = s.charAt(i);
//            if (set.contains(ch)) return false;
//            set.add(ch);
//        }
//        return true;
//    }

////    滑动窗口
//    public int lengthOfLongestSubstring(String s){
//        int n =s.length();
//        Set<Character> set=new HashSet<Character>();
//        int ans=0,i=0,j=0;
//        while (i<n&&j<n){
//            if(!set.contains(s.charAt(j))){
//                set.add(s.charAt(j++));
//                ans=Math.max(ans,j-i);
//            }
//            else {
//                set.remove(s.charAt(i++));
//            }
//        }
//        return ans;
//    }

//    优化的滑动窗口
    public int lengthOfLongestSubstring(String s) {
        int n = s.length(), ans = 0;
        Map<Character, Integer> map = new HashMap<Character, Integer>();
        for (int j = 0, i = 0; j < n; j++) {
            if (map.containsKey(s.charAt(j))) {
                i = Math.max(map.get(s.charAt(j)), i);
            }
            ans=Math.max(ans,j-i+1);
            map.put(s.charAt(j),j+1);
        }
        return ans;
    }

////    假设字符集为ASCII 128
//    public int lengthOfLongestSubstring(String s){
//        int n=s.length(),ans=0;
//        int [] index=new int[128];
//        for(int j=0,i=0;j<n;j++){
//            i=Math.max(index[s.charAt(j)],i);
//            ans=Math.max(ans,j-i+1);
//            index[s.charAt(j)]=j+1;
//        }
//        return ans;
//    }
}
