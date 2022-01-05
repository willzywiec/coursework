// Will Zywiec

// 7815188984
// Java Build Path jre8, Java Compiler JDK 1.5+

// See testClass.java for additional notes.

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

public class Student {
	
	private String[][] arrInfo;
	private int[][] arrQuizScores;
	private int[] arrQuizCounter, arrQuizTotals;
	
	public Student(int classSize) {
		arrInfo = new String[classSize][3]; // input-limited class size
		arrQuizScores = new int[classSize][5]; // "" ""
		arrQuizCounter = new int[classSize]; // "" ""
		arrQuizTotals = new int[classSize]; // "" ""
	}
	
	public String[][] getInfo() {
		return arrInfo;
	}
	
	public int[][] getQuizScores() {
		return arrQuizScores;
	}
	
	public int[] getQuizCounter() {
		return arrQuizCounter;
	}
	
	public int[] getQuizTotals() {
		return arrQuizTotals;
	}
	
	public void setInfo(String[][] arrInfo) {
		this.arrInfo = arrInfo;
	}
	
	public void setQuizScores(int[][] arrQuizScores) {
		this.arrQuizScores = arrQuizScores;
	}
	
	public void setQuizCounter(int[] arrQuizCounter) {
		this.arrQuizCounter = arrQuizCounter;
	}
	
	public void setQuizTotals(int[] arrQuizTotals) {
		this.arrQuizTotals = arrQuizTotals;
	}
	
	public boolean arrays() { // builds arrays from input file
		File file = new File("test.txt");
		try {
			Scanner input = new Scanner(file);
			int i = 0;
			do {
				String scanFirstName = input.next();
				String scanLastName = input.next();
				String scanStudentID = input.next();
				arrInfo[i][0] = scanFirstName;
				arrInfo[i][1] = scanLastName;
				arrInfo[i][2] = scanStudentID;
				for(int j = 0; j < 5; j++) {
					if(input.hasNextInt()) {
						int scanQuizScore = input.nextInt();
						arrQuizScores[i][j] = scanQuizScore;
					}
				}
				i++;
				if(input.hasNextLine())
					input.nextLine();
			} while(input.hasNextLine());
			input.close();
		}
		catch(FileNotFoundException e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	public void print() { // prints course roster and course report
		for(int i = 0; i < arrQuizScores.length; i++) {
			arrQuizTotals[i] = arrQuizScores[i][0] + arrQuizScores[i][1] + arrQuizScores[i][2] + arrQuizScores[i][3] + arrQuizScores[i][4];
		}
		for(int i = 0; i < arrQuizScores.length; i++) {
			int counter = 0;
			for(int j = 0; j < 5; j++) {
				if(arrQuizScores[i][j] > 0) {
					counter += 1;
					arrQuizCounter[i] = counter;
				}
			}
		}
		for(int i = 0; i < arrInfo.length; i++) {
			if(arrInfo[i][0] != null && arrQuizCounter[i] > 0) {
				System.out.println(arrInfo[i][0] + " " + arrInfo[i][1]);
				System.out.println("\tStudent ID: " + arrInfo[i][2] + "");
				System.out.println("\tCourse Grade: " + arrQuizTotals[i] / arrQuizCounter[i]);
			}
		}
		System.out.println("---");
		int sum = 0;
		for(int i = 0; i < arrQuizScores.length; i++) {
			for(int j = 0; j < 4; j++) {
				sum += arrQuizScores[i][j];
			}
		}
		int sumCounter = 0;
		for(int i = 0; i < arrQuizCounter.length; i++) {
			sumCounter += arrQuizCounter[i];
			if(i == arrQuizCounter.length - 1)
				System.out.println("Average Course Grade: " + sum / sumCounter); // prints average course grade
		}
		int maximum = 0;
		for(int i = 0; i < arrQuizTotals.length; i++) {
			int localMaximum = arrQuizTotals[i];
			if(arrQuizCounter[i] > 0 && (localMaximum / arrQuizCounter[i]) > (arrQuizTotals[maximum] / arrQuizCounter[i])) {
				maximum = i;
			}
		}
		System.out.println("Student w/Highest Average Grade: " + arrInfo[maximum][0] + " " + arrInfo[maximum][1]); // prints student w/highest average grade
		int minimum = 0;
		for(int i = 0; i < arrQuizTotals.length; i++) {
			if(arrQuizTotals[i] != 0) {
				int localMinimum = arrQuizTotals[i];
				if((localMinimum / arrQuizCounter[i]) < arrQuizTotals[minimum] / arrQuizCounter[i]) {
					minimum = i;
				}
			}
		}
		System.out.println("Student w/Lowest Average Grade: " + arrInfo[minimum][0] + " " + arrInfo[minimum][1]); // prints student w/lowest average grade
		
	}
	
}
