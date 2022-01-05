//Will Zywiec
//7815188984

public class QuadEq {

	private double A, B, C, disc;
	
	private void calcDisc() { // Calculates the discriminant
		disc = B * B - 4 * A * C;
	}
	
	public QuadEq(double a, double b, double c) { //Default constructor
		A = a;
		B = b;
		C = c;
		calcDisc();
	}

	public double calcLead0() { // Calculates the solution with a leading coefficient of 0
		return (-C / B);
	}
	
	public double calcRoot1() { // Calculates the first root
		return (-B + Math.sqrt(disc)) / (2 * A);
	}
	
	public double calcRoot2() { // Calculates the second root
		return (-B - Math.sqrt(disc)) / (2 * A);
	}
	
	public boolean hasRealRoots() {
		if (disc < 0) return false;
		else return true;
	}
	
	public double calcImag0() { // Calculates the first part of the imaginary root(s)
		return (-B / (2 * A));
	}
	
	public double calcImag1() { // Calculates the second part of the imaginary root(s)
		return (Math.sqrt(4 * A * C - Math.pow(B, 2)) / (2 * A));
	}
	
}

