package test;

import java.util.ArrayList;
import java.util.List;

public class ListNode {//定义节点类
    int val;
    ListNode next;

    ListNode(int x) {
        val = x;
    }

    //将数组的值赋给链表
    public ListNode getList(int[] sums) {
        ListNode dummyHead = new ListNode(0);
        ListNode curr = dummyHead;
        for (int i = 0; i < sums.length; i++) {
            curr.next = new ListNode(sums[i]);
            curr = curr.next;
        }
        return dummyHead.next;
    }

    //将链表的值赋给list并打印
    public void showList(ListNode listNode) {
        List list = new ArrayList();
        while (listNode != null) {
            list.add(listNode.val);
            listNode = listNode.next;
        }
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }
    }

    /**
     * leetcode第二题
     *
     * 给出两个非空的链表用来表示两个非负的整数，
     * 其中，它们各自的位数是按照逆序的方式存储的，
     * 并且它们的每一个节点只能存储一位数组。
     * @param l1
     * @param l2
     * @return
     */
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(0);
        ListNode p = l1, q = l2, curr = dummyHead;
        int carry = 0;
        while (p != null || q != null) {
            int x = (p != null) ? p.val : 0;
            int y = (q != null) ? q.val : 0;
            int sum = carry + x + y;
            carry = sum / 10;
            curr.next = new ListNode(sum % 10);
            curr = curr.next;
            if (p != null) p = p.next;
            if (q != null) q = q.next;
        }
        if (carry > 0) {
            curr.next = new ListNode(carry);
        }
        return dummyHead.next;
    }
}
