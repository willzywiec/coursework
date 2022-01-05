// Will Zywiec
// 7815188984

// QuadEq_Test.java calls QuadEq.java to calculate and display solutions of the quadratic equation, from user-input values of A, B, and C

// The imaginary number (i = Math.sqrt(-1);) is factored out from imaginary results

import java.util.*;

public class QuadEq_Test {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		System.out.println("This program will provide solutions for an equation of the form");
		System.out.println("\t\t     A*x^2 + B*x + C = 0");
		System.out.println("where A, B, and C are integers");
		System.out.print("Enter A, B, and C: ");
		double a = input.nextInt();
		double b = input.nextInt();
		double c = input.nextInt();
		input.close();
		
		QuadEq quad = new QuadEq(a, b, c);
		
		double sol0 = quad.calcLead0();
		double sol1 = quad.calcRoot1();
		double sol2 = quad.calcRoot2();
		double sol3 = quad.calcImag0();
		double sol4 = quad.calcImag1();
		
		if (a == 0)
			System.out.println("With a leading coefficient of 0, the one real solution is x = " + sol0);
		else if (quad.hasRealRoots() == false) {
			if (b != 0) {
				System.out.println("No real solutions!");
				System.out.println("The two imaginary solutions are: ");
				System.out.println("x = " + sol3 + " + " + sol4 + "*i    and    x = " + sol3 + " - " + sol4 + "*i");
			}
			else {
				System.out.println("No real solutions!");
				System.out.println("The two imaginary solutions are: ");
				System.out.println("x = 0.0 + " + sol4 + "*i    and    x = 0.0 - " + sol4 + "*i");
			}
		}
		else {
			if (sol1 == sol2)
				System.out.println("The one real solution is x = " + sol1);
			else {
				System.out.println("The two real solutions are: ");
				System.out.println("x = " + sol1 + "    and    x = " + sol2);
			}
		}
		
	}

}

