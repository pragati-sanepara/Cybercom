
public class SumOFLeftLeave {

     int val;
     SumOFLeftLeave left;
     SumOFLeftLeave right;
     SumOFLeftLeave(int val) { this.val = val; }
     SumOFLeftLeave(int val, SumOFLeftLeave left, SumOFLeftLeave right) {
          this.val = val;
          this.left = left;
          this.right = right;
      }
      public static int sumOfLeftLeaves(SumOFLeftLeave root) {
          if(root == null) {
              return 0;
          }
          if(root.left != null && root.left.left == null && root.left.right == null) {
              return root.left.val + sumOfLeftLeaves(root.right);
          }
          return sumOfLeftLeaves(root.left)+sumOfLeftLeaves(root.right);
      }  

      public static void main(String args[]) { 
  		//construct binary tree 
    	SumOFLeftLeave root = new SumOFLeftLeave(3); 
  		root.left = new SumOFLeftLeave(9); 
  		root.right = new SumOFLeftLeave(20); 
  		root.right.right = new SumOFLeftLeave(7); 
  		root.right.left = new SumOFLeftLeave(15); 
  		
  		System.out.println(sumOfLeftLeaves(root)); 
  		
    	SumOFLeftLeave root1 = new SumOFLeftLeave(3); 
  		System.out.println(sumOfLeftLeaves(root1)); 
        
  		}
 }
 
