public class ReverseArray {
	  
    static Node head;
  
    static class Node {
  
        int data;
        Node next;
  
        Node(int d)
        {
            data = d;
            next = null;
        }
    }
  
    // A simple recursive function to reverse
    // a linked list.  prev is passed as NULL initially.
    Node reverseUtil(Node curr, Node prev)
    {
        /*If head is initially null OR list is empty*/
        if (head == null)
            return head;
        /* If last node mark it head*/
        if (curr.next == null) {
            head = curr;
  
            /* Update next to prev node */
            curr.next = prev;
  
            return head;
        }
  
        /* Save curr->next node for recursive call */
        Node next1 = curr.next;
  
        /* and update next ..*/
        curr.next = prev;
  
        reverseUtil(next1, curr);
        return head;
    }
  
    // prints content of double linked list
    void printList(Node node)
    {
        while (node != null) {
            System.out.print(node.data + " ");
            node = node.next;
        }
    }
  
    // Driver Code
    public static void main(String[] args)
    {
    	ReverseArray arr = new ReverseArray();
        arr.head = new Node(1);
        arr.head.next = new Node(2);
        arr.head.next.next = new Node(3);
        arr.head.next.next.next = new Node(4);
        arr.head.next.next.next.next = new Node(5);
  
        System.out.println("Original Linked list ");
        arr.printList(head);
        Node res = arr.reverseUtil(head, null);
        System.out.println("");
        System.out.println("");
        System.out.println("Reversed linked list ");
        arr.printList(res);
    }
}