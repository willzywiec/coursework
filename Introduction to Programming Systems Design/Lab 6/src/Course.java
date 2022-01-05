import java.util.Scanner;

// Will Zywiec

// 7815188984
// Java Build Path jre8, Java Compiler JDK 1.5+

// See testClass.java for additional notes.

/* It seemed appropriate to extend the Course class from the Student class,
 * because each student's information, i.e. attendance, test scores, etc. is 
 * what comprises each course (0 students --> no course, 1 to infinity students --> course).
 * I understand it's not the most intuitive subclass type, but it seemed like
 * the most efficient way to add a second class with unique variables and methods,
 * exclusive to that class.
 */

public class Course extends Student{
	
	private String courseName, courseName2;
	
	public Course(int classSize) {
		super(classSize);
		courseName = "";
		courseName2 = "";
	}

	public String getCourseName() {
		return courseName;
	}
	
	public String getCourseName2() {
		return courseName2;
	}
	
	public boolean courseInfo() {
		Scanner inputCourse = new Scanner(System.in);
		System.out.print("Enter course name (e.g. CSCI 455): ");
		courseName = inputCourse.next(); // input as string to prevent errors and accommodate abnormal titles
		courseName2 = inputCourse.next(); // "" ""
		inputCourse.close();
		return true;
	}
	
	public void printInfo() {
		System.out.println("");
		System.out.println(courseName + " " + courseName2 + " Course Roster");
		System.out.println("---");
	}
	
}
