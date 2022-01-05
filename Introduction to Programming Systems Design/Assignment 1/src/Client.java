// Will Zywiec
// 7815188984

/* 
 * ------------Client-------------
 * +main: static void (static is normally underlined)
 * -------------------------------
 * +C1()
 * +C1.Get_Diameter : int
 * +C1.Get_Area : int
 * +C1.Get_Circumference : int
 * +Scanner(Readable)
 * +Scanner(String)
 * +C2(Rad) : double
 * +C2.Set_Radius() : double
 * +C2.Get_Diameter : double
 * +C2.Get_Area : double
 * +C2.Get_Circumference : double
 */

import java.util.Scanner;

public class Client {
	
	public static void main(String[] args) {
		
		Circle C1 = new Circle();
		C1.Get_Diameter();
		C1.Get_Area();
		C1.Get_Circumference();
		System.out.println("Radius of Circle 1: " + C1.Get_Radius());
		System.out.println("Diameter of Circle 1: " + C1.Get_Diameter());
		System.out.println("Area of Circle 1: " + C1.Get_Area());
		System.out.println("Circumference of Circle 1: " + C1.Get_Circumference());
		System.out.println("---");
		
		Scanner in = new Scanner(System.in);
		System.out.print("Enter the radius of Circle 2: ");
		double Rad = in.nextInt();
		in.close();
		
		Circle C2 = new Circle();
			C2 = new Circle(Rad);
			
		C2.Set_Radius(Rad);
		C2.Get_Diameter();
		C2.Get_Area();
		C2.Get_Circumference();
		System.out.println("Radius of Circle 2: " + C2.Get_Radius());
		System.out.println("Diameter of Circle 2: " + C2.Get_Diameter());
		System.out.println("Area of Circle 2: " + C2.Get_Area());
		System.out.println("Circumference of Circle 2: " + C2.Get_Circumference());
	}
}
