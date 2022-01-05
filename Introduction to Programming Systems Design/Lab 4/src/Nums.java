
//Will Zywiec
//7815188984

/**
   Stores a sequence of integer data values and supports some computations
   with it.

   CS 455 Lab 4.
*/

import java.util.*;

public class Nums {
	
    /**
       Create an empty sequence of nums.
     */
	
	ArrayList numarray;
	
    public Nums() {
    	this.numarray = new ArrayList();
    }

    /**
       Add a value to the end of the sequence.
     */

    public void add(int value) {
    	Integer intobj = new Integer(value);
    	numarray.add(intobj);
    }


    /**
       Return the minimum value in the sequence.
       If the sequence is empty, returns Integer.MAX_VALUE
     */
    
    public int minVal() {
    	if(numarray.isEmpty()) {
    		return 0;
    	}
    	else {
    		return Collections.min(numarray).hashCode();
    	}
    }	

    /**
       Prints out the sequence of values as a space-separated list 
       on one line surrounded by parentheses.
       Does not print a newline.
       E.g., "(3 7 4 10 2 7)", for empty sequence: "()"
    */
    
    public void printVals() {
    	if(numarray.isEmpty()) {
    		System.out.print("");
    	}
    	else {
    		System.out.print(numarray.toString().replaceAll("\\[", "(").replaceAll("\\]",")").replaceAll(",", ""));
    	}
    }

    /**
       Returns a new Nums object with all the values from this Nums
       object that are above the given threshold.  The values in the
       new object are in the same order as in this one.
       E.g.: call to myNums.valuesGT(10) where myNums = (3 7 19 4 21 19 10)
             returns      (19 21 19)
             myNums after call:  (3 7 19 4 21 19 10)
       This method does not modify the object the method is called on.
     */
    
    public Nums valuesGT(int threshold) {
    	ArrayList gt = new ArrayList();
    	for (int i = 0; i < numarray.size(); i++) {
    		if(numarray.get(i).hashCode() > threshold) {
    			Object j = numarray.get(i);
    			gt.add(j);	
    		}
    	}
    	System.out.print(gt.toString().replaceAll("\\[", "(").replaceAll("\\]",")").replaceAll(",", ""));
    	return new Nums();
    }

    
}