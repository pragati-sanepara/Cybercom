public class tree {
      int val;
      tree left;
      tree right;
//      tree() {}
      tree(int val) { this.val = val; }
      tree(int val, tree left, tree right) {
          this.val = val;
          this.left = left;
          this.right = right;
      }
      private static int sumrl(tree root, int sum) {
    	  if(root == null)
    		 return 0;
    	  sum = (sum<<1)+ root.val;
    	  if(root.left == null && root.right == null) 
    		  return sum;
    	  return sumrl(root.left, sum) + sumrl(root.right, sum);
    	}
//      public static int sumrl(tree root) {
//    	  return sumrl(root, 0);
//      }
      public static void main(String args[]) { 
  		//construct binary tree 
  		tree root = new tree(0); 
  		root.left = new tree(0); 
  		root.left.left = new tree(1); 
  		root.left.right = new tree(0); 
  		root.right = new tree(0); 
  		root.right.right = new tree(0); 
  		root.right.left = new tree(0); 
//  	root.right.left.right = new tree(8); 
  		
  		int sum = 0;
  		System.out.println(sumrl(root, sum)); 
  		
  		} 
 }
 