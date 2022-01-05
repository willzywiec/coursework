// Will Zywiec
// 7815188984

import java.util.*;

public class Birthday {

	public static void main(String[] args) {

		Scanner userInputScanner = new Scanner(System.in);
		
		System.out.print("Enter your birth month [1..12]: ");
		int birthmonth = userInputScanner.nextInt() - 1;
		System.out.print("Enter your birth day of month: ");
		int birthday = userInputScanner.nextInt();
		
		userInputScanner.close();
		
		GregorianCalendar Date = new GregorianCalendar();
		if (birthmonth == Date.get(GregorianCalendar.MONTH)) {
			if (birthday > Date.get(GregorianCalendar.DAY_OF_MONTH)) {
				int birthyear = Date.get(GregorianCalendar.YEAR);
				GregorianCalendar BDate = new GregorianCalendar(birthyear, birthmonth, birthday);
				long a = BDate.getTimeInMillis();
				long b = Date.getTimeInMillis();
				long c = (a - b) / 24 / 60 / 60 / 1000 + 1;
				System.out.println("Your birthday is only " + c + " day(s) away!");
			} else if (birthday == Date.get(GregorianCalendar.DAY_OF_MONTH)) {
				System.out.println("Your birthday is today!");
			} else if (birthday == Date.get(GregorianCalendar.DAY_OF_MONTH) - 1) {
				System.out.println("Your birthday is only 364 days away!");
			} else {
				int birthyear = Date.get(GregorianCalendar.YEAR) + 1;
				GregorianCalendar BDate = new GregorianCalendar(birthyear, birthmonth, birthday);
				long a = BDate.getTimeInMillis();
				long b = Date.getTimeInMillis();
				long c = (a - b) / 24 / 60 / 60 / 1000 + 1;
				System.out.println("Your birthday is only " + c + " days away!");
			}
		} else if (birthmonth > Date.get(GregorianCalendar.MONTH)) {
			int birthyear = Date.get(GregorianCalendar.YEAR);
			GregorianCalendar BDate = new GregorianCalendar(birthyear, birthmonth, birthday);
			long a = BDate.getTimeInMillis();
			long b = Date.getTimeInMillis();
			long c = (a - b) / 24 / 60 / 60 / 1000 + 1;
			System.out.println("Your birthday is only " + c + " days away!");
		} else {
			int birthyear = Date.get(GregorianCalendar.YEAR) + 1;
			GregorianCalendar BDate = new GregorianCalendar(birthyear, birthmonth, birthday);
			long a = BDate.getTimeInMillis();
			long b = Date.getTimeInMillis();
			long c = (a - b) / 24 / 60 / 60 / 1000 + 1;
			System.out.println("Your birthday is only " + c + " days away!");
			
		}
			
	}

}