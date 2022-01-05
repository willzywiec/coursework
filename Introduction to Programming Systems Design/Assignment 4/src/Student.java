// Will Zywiec
// 7815188984

import java.io.*;
import java.text.DecimalFormat;
import java.util.*;

public class Student extends Course{

	private ArrayList<String> grades;
	private ArrayList<Double> averages;
	
	public Student() {
		grades = new ArrayList<String>();
		averages = new ArrayList<Double>();
	}
	
	public ArrayList<String> getGrades() {
		return grades;
	}
	
	public ArrayList<Double> getAverages() {
		return averages;
	}
	
	public void setGrades(ArrayList<String> grades) {
		this.grades = grades;
	}
	
	public void setAverages(ArrayList<Double> averages) {
		this.averages = averages;
	}
	
	// Methods

	public boolean calcAverage() {
		ArrayList<String> lastName = getLastName();
		int zeroCheckLocal = 0;
		int[][]scores = getScores();
		for(int i = 0; i < scores.length; i++) {
			double minLocal = Integer.MAX_VALUE;
			double minLocal2 = Integer.MAX_VALUE;
			double studentAverage = 0;
			for(int j = 0; j < scores[i].length; j++) {
				if(scores[i][j] < minLocal) {
					minLocal2 = minLocal;
					minLocal = scores[i][j];
				}
				studentAverage += scores[i][j];
			}
			averages.add((studentAverage - minLocal - minLocal2)/6); // 6 scores
		}
		for(int i = 0; i < averages.size(); i++) {
			if(averages.get(i) < 0)
				averages.set(i, 0.00);
		}
		
		return true;
	}
	
	public boolean calcGrade() {
		ArrayList<String> lastName = getLastName();
		for(int i = 0; i < lastName.size(); i++) { // stub 5
			if(averages.get(i) >= 90)
				grades.add("A");
			else if(averages.get(i) >= 80)
				grades.add("B");
			else if(averages.get(i) >= 70)
				grades.add("C");
			else if(averages.get(i) >= 60)
				grades.add("D");
			else if(averages.get(i) > 0.001)
				grades.add("F");
			else
				grades.add("I");
		}
		return true;
	}
	
	public boolean sortByName() {
		String courseName = getCourseName();
		String courseID = getCourseID();
		String location = getLocation();
		ArrayList<String> firstName = getFirstName();
		ArrayList<String> lastName = getLastName();
		ArrayList<Integer> studentID = getStudentID();
		Map<String, String> unsortedName = new HashMap<String, String>();
		Map<String, Integer> unsortedStudentID = new HashMap<String, Integer>();
		Map<String, Double> unsortedAverages = new HashMap<String, Double>();
		Map<String, String> unsortedGrades = new HashMap<String, String>();
		for(int i = 0; i < lastName.size(); i++) {
			unsortedName.put(lastName.get(i), firstName.get(i));
			unsortedStudentID.put(lastName.get(i), studentID.get(i));
			unsortedAverages.put(lastName.get(i), averages.get(i));
			unsortedGrades.put(lastName.get(i), grades.get(i));
		}
		Map<String, String> sortedName = new TreeMap<String, String>(unsortedName);
		Map<String, Integer> sortedStudentID = new TreeMap<String, Integer>(unsortedStudentID);
		Map<String, Double> sortedAverages = new TreeMap<String, Double>(unsortedAverages);
		Map<String, String> sortedGrades = new TreeMap<String, String>(unsortedGrades);
		for(int i = 0; i < lastName.size(); i++) {
			firstName = new ArrayList<String>(sortedName.values());
			lastName = new ArrayList<String>(sortedName.keySet());
			studentID = new ArrayList<Integer>(sortedStudentID.values());
			averages = new ArrayList<Double>(sortedAverages.values());
			grades = new ArrayList<String>(sortedGrades.values());
		}
		printStudent(courseName, courseID, location, firstName, lastName, studentID);
		return true;
	}
	
	public boolean sortByAverage() {
		String courseName = getCourseName();
		String courseID = getCourseID();
		String location = getLocation();
		ArrayList<String> firstName = getFirstName();
		ArrayList<String> lastName = getLastName();
		ArrayList<Integer> studentID = getStudentID();
		Map<Double, String> unsortedFirstName = new HashMap<Double, String>();
		Map<Double, String> unsortedLastName = new HashMap<Double, String>();
		Map<Double, Integer> unsortedStudentID = new HashMap<Double, Integer>();
		Map<Double, String> unsortedGrades = new HashMap<Double, String>();
		for(int i = 0; i < averages.size(); i++) {
			unsortedFirstName.put(averages.get(i), firstName.get(i));
			unsortedLastName.put(averages.get(i), lastName.get(i));
			unsortedStudentID.put(averages.get(i), studentID.get(i));
			unsortedGrades.put(averages.get(i), grades.get(i));
		}
		Map<Double, String> sortedFirstName = new TreeMap<Double, String>(unsortedFirstName);
		Map<Double, String> sortedLastName = new TreeMap<Double, String>(unsortedLastName);
		Map<Double, Integer> sortedStudentID = new TreeMap<Double, Integer>(unsortedStudentID);
		Map<Double, String> sortedGrades = new TreeMap<Double, String>(unsortedGrades);
		for(int i = 0; i < averages.size(); i++) {
			firstName = new ArrayList<String>(sortedFirstName.values());
			lastName = new ArrayList<String>(sortedLastName.values());
			studentID = new ArrayList<Integer>(sortedStudentID.values());
			averages = new ArrayList<Double>(sortedFirstName.keySet());
			grades = new ArrayList<String>(sortedGrades.values());
		}
		Collections.reverse(firstName);
		Collections.reverse(lastName);
		Collections.reverse(studentID);
		Collections.reverse(averages);
		Collections.reverse(grades);
		printStudent(courseName, courseID, location, firstName, lastName, studentID);
		return true;
	}
	
	public boolean searchStudent() {
		ArrayList<String> firstName = getFirstName();
		ArrayList<String> lastName = getLastName();
		ArrayList<Integer> studentID = getStudentID();
		ArrayList<Integer> partialStudentID = new ArrayList<Integer>();
		Scanner input = new Scanner(System.in);
		System.out.print("\nEnter name (first and last) of student to search: ");
		String scanFirstName = input.next();
		String scanLastName = input.next();
		for(int i = 0; i < lastName.size(); i++) {
			if(scanFirstName.equals(firstName.get(i))) {
				if(scanLastName.equals(lastName.get(i))) {
					int oneLocal = studentID.get(i) % 10;
					int tenLocal = studentID.get(i) / 10 % 10 * 10;
					int hundredLocal = studentID.get(i) / 100 % 10 * 100;
					int thousandLocal = studentID.get(i) / 1000 % 10 * 1000;
					partialStudentID.add(oneLocal + tenLocal + hundredLocal + thousandLocal);
					System.out.println("\nName\t\tStudent ID\tAverage\t  Grade");
					DecimalFormat dec = new DecimalFormat("#.##");
					System.out.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(0) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
				}
			}
		}
		return true;
	}
	
	public boolean addStudent() {
		ArrayList<String> firstName = getFirstName();
		ArrayList<String> lastName = getLastName();
		ArrayList<Integer> studentID = getStudentID();
		double[] scoresLocal = new double[8];
		Scanner input = new Scanner(System.in);
		System.out.print("\nEnter name (first and last) of student to add: ");
		String scanFirstName = input.next();
		String scanLastName = input.next();
		System.out.print("\nEnter Student ID: ");
		int scanStudentID = input.nextInt();
		while(scanStudentID < 100000000) {
			System.out.print("\nInvalid Student ID. Re-enter Student ID: ");
			scanStudentID = input.nextInt();
		}
		System.out.print("\nEnter number of scores: ");
		double scoresLocalTotal = input.nextInt();
		System.out.print("\nEnter scores (e.g. 90 80 70..): ");
		double scoresLocalAverage = 0;
		for(int i = 0; i < scoresLocalTotal; i++) {
			scoresLocal[i] = input.nextInt();
			scoresLocalAverage += scoresLocal[i];
			if(i == 7) {
				scoresLocalAverage = scoresLocalAverage / scoresLocalTotal;
				averages.add(scoresLocalAverage);
			}
		}
		firstName.add(scanFirstName);
		lastName.add(scanLastName);
		studentID.add(scanStudentID);
		if(averages.get(averages.size() - 1) >= 90)
			grades.add("A");
		else if(averages.get(averages.size() - 1) >= 80)
			grades.add("B");
		else if(averages.get(averages.size() - 1) >= 70)
			grades.add("C");
		else if(averages.get(averages.size() - 1) >= 60)
			grades.add("D");
		else if(averages.get(averages.size() - 1) > 0.001)
			grades.add("F");
		else
			grades.add("I");
		calcClassAverage();
		return true;
	}
	
	public boolean removeStudent() {
		printStudent(getCourseName(), getCourseID(), getLocation(), getFirstName(), getLastName(), getStudentID());
		ArrayList<String> firstName = getFirstName();
		ArrayList<String> lastName = getLastName();
		ArrayList<Integer> studentID = getStudentID();
		Scanner input = new Scanner(System.in);
		System.out.print("\nEnter name (first and last) of student to remove: ");
		String scanFirstName = input.next();
		String scanLastName = input.next();
		for(int i = 0; i < lastName.size(); i++) {
			if(scanFirstName.equals(firstName.get(i)))
				if(scanLastName.equals(lastName.get(i))) {
					firstName.remove(i);
					lastName.remove(i);
					studentID.remove(i);
					averages.remove(i);
					grades.remove(i);
					calcClassAverage();
				}
		}
		return true;
	}
	
	public boolean editStudent() {
		ArrayList<String> firstName = getFirstName();
		ArrayList<String> lastName = getLastName();
		ArrayList<Integer> studentID = getStudentID();
		ArrayList<Integer> partialStudentID = new ArrayList<Integer>();
		int[][] scores = getScores();
		int[] scoresLocal = new int[8];
		Scanner input = new Scanner(System.in);
		System.out.print("\nEnter name (first and last) of student to edit: ");
		String scanFirstName = input.next();
		String scanLastName = input.next();
		for(int i = 0; i < lastName.size(); i++) {
			if(scanFirstName.equals(firstName.get(i))) {
				if(scanLastName.equals(lastName.get(i))) {
					int oneLocal = studentID.get(i) % 10;
					int tenLocal = studentID.get(i) / 10 % 10 * 10;
					int hundredLocal = studentID.get(i) / 100 % 10 * 100;
					int thousandLocal = studentID.get(i) / 1000 % 10 * 1000;
					partialStudentID.add(oneLocal + tenLocal + hundredLocal + thousandLocal);
					System.out.println("\nName\t\tStudent ID\tAverage\t  Grade");
					DecimalFormat dec = new DecimalFormat("#.##");
					System.out.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(0) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
					System.out.print("\nEdit name? (y/n): ");
					String scanYesNo = input.next();
					if(scanYesNo.equals("y")) {
						System.out.print("\nEnter new name (first and last): ");
						String editFirstName = input.next();
						String editLastName = input.next();
						firstName.set(i, editFirstName);
						lastName.set(i, editLastName);
						System.out.println("\nName\t\tStudent ID\tAverage\t  Grade");
						System.out.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(0) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
						System.out.print("\nEdit scores? (y/n): ");
						scanYesNo = input.next();
						if(scanYesNo.equals("y")) {
							System.out.print("\nEnter scores (e.g. 90 80 70..): ");
							double scoresLocalAverage = 0;
							for(int j = 0; j < scores.length; j++) { // 8
								scoresLocal[j] = input.nextInt();
								scoresLocalAverage += scoresLocal[j];
								if(j == 7) {
									scoresLocalAverage = scoresLocalAverage / 6; // 6
									averages.set(i, scoresLocalAverage);
									calcClassAverage();
									if(averages.get(i) >= 90)
										grades.set(i, "A");
									else if(averages.get(i) >= 80)
										grades.set(i, "B");
									else if(averages.get(i) >= 70)
										grades.set(i, "C");
									else if(averages.get(i) >= 60)
										grades.set(i, "D");
									else if(averages.get(i) > 0.001)
										grades.set(i, "F");
									else
										grades.set(i, "I");
									System.out.println("\nName\t\tStudent ID\tAverage\t  Grade");
									System.out.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(0) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
								}
							}
						}
					}
					else {
						System.out.print("\nEdit scores? (y/n): ");
						scanYesNo = input.next();
						if(scanYesNo.equals("y")) {
							System.out.print("\nEnter scores (e.g. 90 80 70..): ");
							double scoresLocalAverage = 0;
							for(int j = 0; j < scores.length; j++) { // 8
								scoresLocal[j] = input.nextInt();
								scoresLocalAverage += scoresLocal[j];
								if(j == 7) {
									scoresLocalAverage = scoresLocalAverage / 6; // 6
									averages.set(i, scoresLocalAverage);
									calcClassAverage();
									if(averages.get(i) >= 90)
										grades.set(i, "A");
									else if(averages.get(i) >= 80)
										grades.set(i, "B");
									else if(averages.get(i) >= 70)
										grades.set(i, "C");
									else if(averages.get(i) >= 60)
										grades.set(i, "D");
									else if(averages.get(i) > 0.001)
										grades.set(i, "F");
									else
										grades.set(i, "I");
									System.out.println("\nName\t\tStudent ID\tAverage\t  Grade");
									System.out.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(0) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
								}
							}
						}
					}
				}
			}
		}
		return true;
	}
	
	public boolean menu() {
		int i = 0;
		while(i == 0) {
			System.out.println("\nMENU");
			System.out.println("(pf)--Print Course Data to File");
			System.out.println("(sl)--Sort Students by Last Name");
			System.out.println("(sa)--Sort Students by Average");
			System.out.println("(pm)--Print Student Data to Monitor");
			System.out.println("(ss)--Search for Student");
			System.out.println("(a)---Add Student");
			System.out.println("(r)---Remove Student");
			System.out.println("(e)---Edit Student Information");
			System.out.println("(x)---EXIT");
			Scanner input = new Scanner(System.in);
			System.out.print("\nEnter Selection: ");
			String scanInput = input.next();
			if(scanInput.equals("pf")) {
				printStudentToFile(getCourseName(), getCourseID(), getLocation(), getFirstName(), getLastName(), getStudentID());
			}
			else if(scanInput.equals("sl")) {
				sortByName();
			}
			else if(scanInput.equals("sa"))
				sortByAverage();
			else if(scanInput.equals("pm")) {
				printStudent(getCourseName(), getCourseID(), getLocation(), getFirstName(), getLastName(), getStudentID());
			}
			else if(scanInput.equals("ss")) {
				searchStudent();
			}
			else if(scanInput.equals("a"))
				addStudent();
			else if(scanInput.equals("r"))
				removeStudent();
			else if(scanInput.equals("e"))
				editStudent();
			else if(scanInput.equals("x"))
				i = 1;
		}
		return true;
	}
	
	public void printStudent(String courseName, String courseID, String location, ArrayList<String> firstName, ArrayList<String> lastName, ArrayList<Integer> studentID) {
		ArrayList<Integer> partialStudentID = new ArrayList<Integer>();
		System.out.println("\n" + courseName);
		System.out.println(courseID);
		System.out.println(location + "\n---");
		for(int i = 0; i < studentID.size(); i++) {
			int oneLocal = studentID.get(i) % 10;
			int tenLocal = studentID.get(i) / 10 % 10 * 10;
			int hundredLocal = studentID.get(i) / 100 % 10 * 100;
			int thousandLocal = studentID.get(i) / 1000 % 10 * 1000;
			partialStudentID.add(oneLocal + tenLocal + hundredLocal + thousandLocal);
		}
		System.out.println("Name\t\tStudent ID\tAverage\t  Grade");
		DecimalFormat dec = new DecimalFormat("#.##");
		for(int i = 0; i < lastName.size(); i++) {
			System.out.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(i) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
		}
		double averageLocal = 0;
		int j = 0;
		for(int i = 0; i < averages.size(); i++) {
			if(averages.get(i) > 0.001)
				averageLocal += averages.get(i);
			else if(averages.get(i) <= 0.001)
				j += 1;
			if(i == averages.size() - 1) {
				averageLocal = averageLocal / (lastName.size() - j);
				System.out.println("---\nClass Average: " + dec.format(averageLocal));
			}
		}
	}
	
	public void printStudentToFile(String courseName, String courseID, String location, ArrayList<String> firstName, ArrayList<String> lastName, ArrayList<Integer> studentID) {
		ArrayList<Integer> partialStudentID = new ArrayList<Integer>();
		Scanner input = new Scanner(System.in);
		System.out.print("\nEnter output file name (e.g. output.txt): ");
		String scanOutputFile = input.next();
		try {
			PrintStream outputFile = new PrintStream(new FileOutputStream(scanOutputFile));
			outputFile.println("\n" + courseName);
			outputFile.println(courseID);
			outputFile.println(location);
			outputFile.println("---");
			for(int i = 0; i < studentID.size(); i++) {
				int oneLocal = studentID.get(i) % 10;
				int tenLocal = studentID.get(i) / 10 % 10 * 10;
				int hundredLocal = studentID.get(i) / 100 % 10 * 100;
				int thousandLocal = studentID.get(i) / 1000 % 10 * 1000;
				partialStudentID.add(oneLocal + tenLocal + hundredLocal + thousandLocal);
			}
			outputFile.println("Name\t\tStudent ID\tAverage\t  Grade");
			DecimalFormat dec = new DecimalFormat("#.##");
			for(int i = 0; i < lastName.size(); i++) {
				outputFile.println(lastName.get(i) + ", " + firstName.get(i) + "\t***-**-" + partialStudentID.get(i) + "\t" + dec.format(averages.get(i)) + "\t  " + grades.get(i));
			}
			double averageLocal = 0;
			int j = 0;
			for(int i = 0; i < averages.size(); i++) {
				if(averages.get(i) > 0.001)
					averageLocal += averages.get(i);
				else if(averages.get(i) <= 0.001)
					j += 1;
				if(i == averages.size() - 1) {
					averageLocal = averageLocal / (lastName.size() - j);
					outputFile.println("---");
					outputFile.println("Class Average: " + dec.format(averageLocal));
				}
			}
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
}
