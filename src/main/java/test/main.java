package test;

import java.util.ArrayList;
import java.util.List;

public class main {
    public static void main(String[] args) {
        int a[] = {2, 4, 3};
        int b[] = {5, 6, 4};
        ListNode curr=new ListNode(0);
        ListNode l1=curr.getList(a);
//        curr.showList(l1);
        ListNode l2=curr.getList(b);
//        curr.showList(l2);
        ListNode l3=curr.addTwoNumbers(l1,l2);
        curr.showList(l3);
    }


}
