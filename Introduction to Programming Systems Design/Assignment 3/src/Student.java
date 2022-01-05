
// Will Zywiec
// 7815188984
// Java Build Path jre8, Java Compiler JDK 1.5+

// See testClass.java for additional notes.

import java.util.*;

public class Student {
	
	Course course = new Course(10); // input-limited to 10 students
	
	private ArrayList<String> arrFirstName, arrLastName;
	private ArrayList<Integer> arrAge;
	private ArrayList<Double> arrGrade;
	private String courseName, courseName2;
	
	public Student() {
		arrFirstName = new ArrayList<String>(100);
		arrLastName = new ArrayList<String>(100);
		arrAge = new ArrayList<Integer>(100);
		arrGrade = new ArrayList<Double>(100);
	}
	
	public ArrayList<String> getFirstName() {
		return arrFirstName;
	}
	
	public ArrayList<String> getLastName() {
		return arrLastName;
	}
	
	public ArrayList<Integer> getAge() {
		return arrAge;
	}
	
	public ArrayList<Double> getGrade() {
		return arrGrade;
	}
	
	public void setFirstName(ArrayList<String> arrFirstName) {
		this.arrFirstName = arrFirstName;
	}
	
	public void setLastName(ArrayList<String> arrLastName) {
		this.arrLastName = arrLastName;
	}
	
	public void setAge(ArrayList<Integer> arrAge) {
		this.arrAge = arrAge;
	}
	
	public void setGrade(ArrayList<Double> arrGrade) {
		this.arrGrade = arrGrade;
	}
	
	public boolean arrays() { // populates array lists
		Scanner input = new Scanner(System.in); // (input closes in remove method)
		System.out.print("Enter course name (e.g. CSCI 455): ");
		courseName = input.next();
		courseName2 = input.next();
		loop:
		for(int i = 0; i < course.getMax(); i++) {
			System.out.print("Do you want to enter the next student? y = yes, n = no: ");
			String YesNo = input.next();
			if(YesNo.equals("n"))
				break;
			else if(YesNo.equals("y")) {
				while(i < course.getMax()) {
					System.out.print("Enter name (first and last): ");
					String scanFirstName = input.next();
					String scanLastName = input.next();
					System.out.print("Enter age: ");
					int scanAge = -1;
					do { // Checks age
						if(input.hasNextInt()) {
							scanAge = input.nextInt();
							if(scanAge < 0) {
								System.out.println("Invalid entry!");
								System.out.print("Enter age: ");
							}
							else
								break;
						}
						else {
							System.out.println("Invalid entry!");
							System.out.print("Enter age: ");
							input.next();
						}
					} while(!input.hasNextInt() || scanAge < 0);
					System.out.print("Enter GPA: ");
					double scanGrade = -1;
					do { // Checks GPA
						if(input.hasNextDouble()) {
							scanGrade = input.nextDouble();
							if(scanGrade < 0) {
								System.out.println("Invalid entry!");
								System.out.print("Enter GPA: ");
							}
							else
								break;
						}
						else {
							System.out.println("Invalid entry!");
							System.out.print("Enter GPA: ");
							input.next();
						}
					} while(!input.hasNextDouble() || scanGrade < 0);
					arrFirstName.add(scanFirstName);
					arrLastName.add(scanLastName);
					arrAge.add(scanAge);
					arrGrade.add(scanGrade);
					if(i < course.getMax()) {
						System.out.print("Do you want to enter the next student? y = yes, n = no: ");
						String YesNo2 = input.next();
						if(YesNo2.equals("n"))
							break loop;
					}
					i++;
					if(i == course.getMax()) {
						System.out.println("");
						System.out.println("The maximum number of students has been reached.");
					}
				}
			}
			else {
				System.out.println("Invalid entry!");
				i--;
			}
		}
		return true;
	}
	
	public void print() { // prints class roster (without GPA)
		System.out.println("");
		System.out.println(courseName + " " + courseName2 + " Course Summary");
		System.out.println("");
		System.out.println("--- Class Roster ---");
		for(int i = 0; i < arrFirstName.size(); i++) {
			if(arrFirstName.get(i).length() > 8)
				System.out.printf("Name: %s %-16s Age: %-8s GPA: %s %n", arrFirstName.get(i), arrLastName.get(i), arrAge.get(i), arrGrade.get(i));
			else
				System.out.printf("Name: %s %-16s\t Age: %-8s GPA: %s %n", arrFirstName.get(i), arrLastName.get(i), arrAge.get(i), arrGrade.get(i));
		}
	}
	
	public boolean remove() { // depopulates array lists
		Scanner input = new Scanner(System.in);
		loop:
		for(int i = 0; i < arrFirstName.size(); i++) {
			System.out.println("");
			System.out.print("Do you want to remove a student? y = yes, n = no: ");
			String YesNo = input.next();
			if(YesNo.equals("n"))
				break;
			else if(YesNo.equals("y")) {
				while(i < arrFirstName.size()) {
					System.out.print("Enter name (first and last): ");
					String scanFirstName = input.next();
					String scanLastName = input.next();
					int k = 1;
					for(int j = 0; j < arrFirstName.size(); j++) {
						if(scanFirstName.equals(arrFirstName.get(j)))
							if(scanLastName.equals(arrLastName.get(j))) {
								arrFirstName.remove(j);
								arrLastName.remove(j);
								arrAge.remove(j);
								arrGrade.remove(j);
								print();
								course.calcAve(arrGrade);
								k = 0;
							}
					}
					if(k == 1) {
						System.out.println("Invalid entry!");
						print();
						course.calcAve(arrGrade);
					}
					if(i < arrFirstName.size()) {
						System.out.println("");
						System.out.print("Do you want to remove a student? y = yes, n = no: ");
						String YesNo2 = input.next();
						if(YesNo2.equals("n"))
							break loop;
					}
				}
			}
			else {
				System.out.println("Invalid entry!");
				i--;
			}
		}
		input.close();
		return true;
	}
}
