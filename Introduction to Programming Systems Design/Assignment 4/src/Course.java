// Will Zywiec
// 7815188984

import java.io.*;
import java.util.*;

public class Course {

	private String courseName, courseID, location;
	private ArrayList<String> firstName, lastName;
	private ArrayList<Integer> studentID, partialStudentID;
	private int[][] scores;
	private int classAverage;
	
	public Course() {
		courseName = "";
		courseID = "";
		location = "";
		firstName = new ArrayList<String>();
		lastName = new ArrayList<String>();
		studentID = new ArrayList<Integer>();
		partialStudentID = new ArrayList<Integer>();
		scores = new int[5][8]; // 2-D array is re-defined for additional values
		classAverage = 0;
	}
	
	public String getCourseName() {
		return courseName;
	}
	
	public String getCourseID() {
		return courseID;
	}
	
	public String getLocation() {
		return location;
	}
	
	public ArrayList<String> getFirstName() {
		return firstName;
	}
	
	public ArrayList<String> getLastName() {
		return lastName;
	}
	
	public ArrayList<Integer> getStudentID() {
		return studentID;
	}
	
	public ArrayList<Integer> getPartialStudentID() {
		return partialStudentID;
	}
	
	public int[][] getScores() {
		return scores;
	}
	
	public int getClassAverage() {
		return classAverage;
	}
	
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public void setFirstName(ArrayList<String> firstName) {
		this.firstName = firstName;
	}
	
	public void setLastName(ArrayList<String> lastName) {
		this.lastName = lastName;
	}
	
	public void setStudentID(ArrayList<Integer> studentID) {
		this.studentID = studentID;
	}
	
	public void setPartialStudentID(ArrayList<Integer> partialStudentID) {
		this.partialStudentID = partialStudentID;
	}
	
	public void setScores(int[][] scores) {
		this.scores = scores;
	}
	
	public void setClassAverage(int classAverage) {
		this.classAverage = classAverage;
	}
	
	// Methods
	
	public boolean arrays() {
		try {
			Scanner input = new Scanner(System.in);
			System.out.print("Enter input file name (e.g. test.txt): ");
			String inputFileName = input.next();
			File file = new File(inputFileName);
			Scanner fileInput = new Scanner(file);
			courseName = fileInput.nextLine();
			courseID = fileInput.nextLine();
			location = fileInput.nextLine();
			int i = 0;
			do {
				firstName.add(fileInput.next());
				lastName.add(fileInput.next());
				studentID.add(fileInput.nextInt());
				int j = 0;
				do {
					scores[i][j] = fileInput.nextInt();
					j++;
				} while(fileInput.hasNextInt());
				i++;
			} while(fileInput.hasNextLine());
		} catch(FileNotFoundException e) {
			System.out.println("\nInvalid entry.\n");
			arrays();
		}
		return true;
	}
	
	public boolean calcClassAverage() {
		for(int i = 0; i < scores.length; i++) {
			for(int j = 0; j < scores[0].length; j++) {
				classAverage += scores[i][j];
			}
		}
		classAverage = classAverage / (scores.length * scores[0].length);
		return true;
	}
	
}
