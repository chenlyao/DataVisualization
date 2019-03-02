package test;

import java.util.HashMap;
import java.util.Map;

public class twoSum {

    static int nums[] = {2, 7, 11, 15};
    static int target = 9;

    public static void main(String[] args) {
        twoSum a = new twoSum();
        a.twoSum(nums, target);

    }

    /**
     * 暴力解法，遍历
     * 时间复杂度:O(n2),对于每个元素，
     * 我们试图通过遍历数组的其余部分来寻找它所有对应的目标元素，
     * 这将耗费O(n)的时间。因此时间复杂度为O(n2)。
     * 空间复杂度:O(1)。
     *
     * @param nums
     * @param target
     * @return
     */

//    public int[] twoSum(int[] nums, int target) {
//        for (int i = 0; i < nums.length; i++) {
//            for (int j = i + 1; j < nums.length; j++) {
//                if (nums[j] == target - nums[i]) {
//                    int a[] = new int[2];
//                    a[0] = i;
//                    a[1] = j;
//                    for (int k = 0; k < a.length; k++) {
//                        System.out.println(a[k]);
//                    }
//                    return a;
//                }
//            }
//        }
//        throw new IllegalArgumentException("No two sum solution");
//    }


    /**
     * 两遍哈希表
     * 一个简单的实现使用了两次迭代。在第一次迭代中，我们将每个元素的值和它的索引添加到表中。
     * 然后，在第二次迭代中，我们将检查每个元素所对应的目标元素(target-nums[i])是否存在于表中。
     * 注意，该目标元素不能是nums[i]本身!
     * 时间复杂度：O(n)，我们把包含有n个元素的列表遍历两次，由于哈希表将查找时间缩短O(1)，所以时间复杂度为O(n)。(一遍for循环)
     * 空间复杂度:O(n),所需的额外空间取决与哈希表中存储的元素数量，该表中存储了n个元素。(内存占用了两倍)
     * @param nums
     * @param target
     * @return
     */
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (int i = 0; i < nums.length; i++) {
            map.put(nums[i], i);
        }
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];
            if (map.containsKey(complement) && map.get(complement) != i) {
                int a[] = new int[2];
                a[0] = i;
                a[1] = map.get(complement);
                for (int k = 0; k < a.length; k++) {
                    System.out.println(a[k]);
                }
                return a;
            }
        }
        throw new IllegalArgumentException("No two sum solution");
    }
}
