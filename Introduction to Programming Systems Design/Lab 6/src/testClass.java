
// Will Zywiec
// 7815188984
// Java Build Path jre8, Java Compiler JDK 1.5+

/*
 * I decided not to include commas in test.txt to limit unnecessary complexity.
 * If I were to include commas, I would scan input from each line as a string, 
 * remove all commas with a replaceAll command, and then parse each string 
 * into separate arrays. I wanted to maintain the integrity of the 
 * array lists for data manipulation, so I limited the use of variables.
 * 
 * Thanks,
 * Will
 */

import java.util.*;

public class testClass {
	
	public static void main(String[] args) {
		
		int i = 0;
		
		while(i == 0) {
			try {
				
				Scanner input = new Scanner(System.in);
				System.out.print("Enter the number of students allowed in this course: ");
				
				int classSize = input.nextInt();
				
				System.out.println("");
				
				Course course = new Course(classSize);
				
				course.courseInfo();
				course.printInfo();
				
				course.arrays();
				course.print();
				
				input.close();
				i++;
			}
			catch(Exception e) {
				System.out.println("\nError! Try again.\n");
			}
		}
		
	}

}
