

// Will Zywiec
// 7815188984

import java.util.GregorianCalendar;

public class Date {

	public static void main(String[] args) {
		
		GregorianCalendar Date = new GregorianCalendar(1995, 0, 20);
		int month = 1 + Date.get(GregorianCalendar.MONTH);
		int day = Date.get(GregorianCalendar.DAY_OF_MONTH);
		int year = Date.get(GregorianCalendar.YEAR);
		
		Date.add(GregorianCalendar.DAY_OF_MONTH, 20);
		int month2 = 1 + Date.get(GregorianCalendar.MONTH);
		int day2 = Date.get(GregorianCalendar.DAY_OF_MONTH);
		int year2 = Date.get(GregorianCalendar.YEAR);
		
		System.out.println(+month + "/" +day + "/" +year);
		System.out.println(+month2 + "/" +day2 + "/" +year2);
		
	}

}
