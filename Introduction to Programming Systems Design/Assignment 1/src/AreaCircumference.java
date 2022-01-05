// Will Zywiec
// 7815188984

import java.util.Scanner;

public class AreaCircumference {

	public static void main(String[] args) {

		Scanner userInputScanner = new Scanner(System.in);
		
		System.out.print("Enter the radius of the circle: ");
		double radius = userInputScanner.nextInt();
		
		userInputScanner.close();
		
		double area = Math.PI * Math.pow(radius, 2);
		
		double circumference = Math.PI * 2 * radius;
		
		System.out.println("The area of the circle is " + area + ".");
		
		System.out.println("The circumference of the circle is " + circumference + ".");
		
	}

}
