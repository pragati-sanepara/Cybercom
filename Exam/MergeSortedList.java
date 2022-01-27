	import java.util.*;

	class Node
	{
	    int data;
	    Node next;
	    Node(int d) {data = d;
	                 next = null;}
	}
	     
	public class MergeSortedList 
	{
	
	Node head;
	 
	/* Method to insert a node at
	   the end of the linked list */
	public void addToTheLast(Node node)
	{
	    if (head == null)
	    {
	        head = node;
	    }
	    else
	    {
	        Node temp = head;
	        while (temp.next != null)
	            temp = temp.next;
	        temp.next = node;
	    }
	}
	 
	/* Method to print linked list */
	void printList()
	{
	    Node temp = head;
	    while (temp != null)
	    {
	        System.out.print(temp.data + " ");
	        temp = temp.next;
	    }
	    System.out.println();
	}
	 
	 
	// Driver Code
	public static void main(String args[])
	{
	    
		MergeSortedList llist1 = new MergeSortedList();
		MergeSortedList llist2 = new MergeSortedList();
	     
	    llist1.addToTheLast(new Node(1));
	    llist1.addToTheLast(new Node(2));
	    llist1.addToTheLast(new Node(4));
	     
	    llist2.addToTheLast(new Node(1));
	    llist2.addToTheLast(new Node(3));
	    llist2.addToTheLast(new Node(4));
	     
	     
	    llist1.head = new GfG().sortedMerge(llist1.head,
	                                        llist2.head);
	    llist1.printList();    
	     
	}
	
	class GFG
	{
	    public Node SortedMerge(Node A, Node B)
	    {
	     
	        if(A == null) return B;
	        if(B == null) return A;
	         
	        if(A.data < B.data)
	        {
	            A.next = SortedMerge(A.next, B);
	            return A;
	        }
	        else
	        {
	            B.next = SortedMerge(A, B.next);
	            return B;
	        }
	         
	    }
	
	}
}