// Will Zywiec
// 7815188984
// Adding k++ eliminates the error and allows the program to run.
// I added two additional 'corrections' to eliminate undesired output and close Scanner input.

import java.util.Scanner;

/**
   class contains static method to find all factors of n
   plus a test driver for the function
*/

public class Factors {


    /**
       finds all of n's factors
       not including 1 and itself
       pre: n >= 1
    */
	
    public static void factors (int n) {
	int k = 2; // Changed to k = 2 to eliminate factors 0 and 1 from output

	while (k < n) {
	    if (n % k == 0) {
		System.out.print(k + " ");
	    }
	    k++; // Added k++ to increment k after each if statement
	}
  
    }


    public static void main(String[] args) {

	Scanner in = new Scanner(System.in);

	System.out.print("Find factors of what number? ");
	int n = in.nextInt();
	System.out.println("Factors of n are: ");

	factors (n);

	System.out.println();
	
	in.close(); // Closed Scanner input
	
    }

}
