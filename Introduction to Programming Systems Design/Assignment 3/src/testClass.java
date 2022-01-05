
// Will Zywiec
// 7815188984
// Java Build Path jre8, Java Compiler JDK 1.5+

/*
 * Some modifications were made to the UML prior to creating the classes.
 * 
 * The arrays, print, and removal methods are in the Student class, because it 
 * seemed more appropriate to create, modify, and store all array lists in one
 * class, while performing comparative analysis of array lists in another.
 * 
 * All functions of the original UML are implemented, as well as the appropriate
 * testClass design criteria.
 * 
 * All input is robustly checked for errors.
 * 
 * Input is currently limited to 10 student entries.
 * 
 * Thanks,
 * Will
 */

public class testClass {

	public static void main(String[] args) {
		
		Student student = new Student();
		Course course = new Course(10); // input-limited to 10 students
		
		student.arrays();
		course.checkGrade(student.getGrade());
		student.print();
		course.calcAve(student.getGrade());
		student.remove();
		if(!student.getGrade().isEmpty()) {
			student.print();
			course.calcAve(student.getGrade());
		}
		else
			System.out.println("(Empty)");
		
	}

}
