package test;

public class findMedianSortedArrays {


    public static void main(String[] args) {
        int[] A={3,4,5,6};
        int[] B={3,4,5,6};
        findMedianSortedArrays a=new findMedianSortedArrays();
        System.out.println(a.findMedianSortedArrays(A,B));
    }

    /**
     * 时间复杂度:O(log(min(m,n)))
     * 首先，查找的区间是[0,m]。而该区间的长度在每次循环之后都会减少为原来的一半。
     * 所以，我们只需要执行log(m)次循环，由于我们在每次循环中进行常量次数的操作，
     * 所以时间复杂度为O(log(m))。由于m<=n,所以时间复杂度是O(log(min(m,n)))。
     *
     * 空间复杂度:O(1),我们只需要恒定的内存来存储9个局部变量，所以空间复杂度为O(1)。
     * @param A
     * @param B
     * @return
     */
    public double findMedianSortedArrays(int[] A, int[] B) {
        int m = A.length;
        int n = B.length;
        if (m > n) {//to ensure m<n
            int[] temp = A;
            A = B;
            B = temp;
            int tmp = m;
            m = n;
            n = tmp;
        }
        int iMin = 0, iMax = m, halfLen = (m + n + 1) / 2;
        while (iMin <= iMax) {
            int i = (iMin + iMax) / 2;
            int j = halfLen - i;
            if (i < iMax && B[j - 1] > A[i]) {
                iMin = i + 1;//i is too small
            } else if (i > iMin && A[i - 1] > B[j]) {
                iMax = i - 1;
            } else {//i is perfect
                int maxLeft = 0;
                if (i == 0) {
                    maxLeft = B[j - 1];
                } else if (j == 0) {
                    maxLeft = A[i - 1];
                } else {
                    maxLeft = Math.max(A[i - 1], B[j - 1]);
                }
                if((m+n)%2==1){return maxLeft;}

                int minRight = 0;
                if (i == m) {
                    minRight = B[j];
                } else if (j == n) {
                    minRight = A[i];
                } else {
                    minRight = Math.min(B[j], A[i]);
                }

                return (maxLeft + minRight) / 2.0;
            }
        }
        return 0.0;
    }
}
