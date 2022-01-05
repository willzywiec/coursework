
// Will Zywiec
// 7815188984
// Java Build Path jre8, Java Compiler JDK 1.5+

// See testClass.java for additional notes.

import java.util.*;

public class Course {

	private String name;
	private int maxSize, size;
	
	public Course() { // default constructor
		maxSize = 100; // default maximum number of students
	}
	
	public Course(int inputMaxSize) {
		maxSize = inputMaxSize; // input-limited number of students
	}
	
	public String getName() {
		return name;
	}
	
	public int getMax() {
		return maxSize;
	}
	
	public int getSize() {
		return size;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setMax(int maxSize) {
		this.maxSize = maxSize;
	}
	
	public void setSize(int size) {
		this.size = size;
	}
	
	public double calcAve(ArrayList<Double> arrGrade) { // calculates and prints average GPA
		Double sum = 0.0;
		if(!arrGrade.isEmpty()) {
			for(Double i : arrGrade)
				sum += i;
			double average = sum.doubleValue() / arrGrade.size();
			System.out.println("---");
			System.out.printf("Average GPA: %.2f %n", average);
			System.out.println("Number of Students: " + arrGrade.size() + "/" + getMax());
			return average;
		}
		return sum;
	}
	
	public ArrayList<Double> checkGrade(ArrayList<Double> arrGrade) { // reduces all GPAs > 4.0 to 4.0
		for(int i = 0; i < arrGrade.size(); i++)
			if(arrGrade.get(i) > 4.0)
				arrGrade.set(i, 4.0);
		return arrGrade;
	}
	
}
