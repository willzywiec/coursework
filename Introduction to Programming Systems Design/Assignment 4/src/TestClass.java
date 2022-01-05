// Will Zywiec
// 7815188984

import java.io.*;
import java.text.DecimalFormat;
import java.util.*;

public class TestClass {

	public static void main(String[] args) {
		
		Student student = new Student();
		
		try {
			student.arrays();
		} catch(Exception e) {
			System.out.println("Invalid entry.");
			student.arrays();
		}
		
		try {
			student.calcAverage();
			student.calcGrade();
			student.menu();
		} catch(Exception e) {
			System.out.println("\nInvalid entry.");
			student.menu(); }

	}

}
