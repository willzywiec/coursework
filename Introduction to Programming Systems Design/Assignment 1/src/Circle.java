// Will Zywiec
// 7815188984

/* 
 * --------------Circle---------------
 * -radius : double
 * -diameter : double
 * -area : double
 * -circumference : double
 * -----------------------------------
 * +Circle()
 * +Circle(double)
 * +Get_Radius() : double
 * +Get_Diameter() : double
 * +Get_Area() : double
 * +Get_Circumference() : double
 * +Set_Radius(double) : void
 * +Calc_Diameter() : void
 * +Calc_Area() : void
 * +Calc_Circumference() : void
 * -Calc_Diameter() : void
 * -Calc_Area() : void
 * -Calc_Circumference() : void
 */

public class Circle {
	
    private double radius, diameter, area, circumference;
    
    public Circle () {
    	radius = 0;
        diameter = 0;
        area = 0;
        circumference = 0;
    }
    public Circle (double r) {
        radius = r;
        Calc_Diameter();		// Statement is unnecessary for implementation of Client.java
        Calc_Area();			// ""	""
        Calc_Circumference();	// ""	""
    }
    public double Get_Radius() {		
        return radius;  
    }
    public double Get_Diameter() {
    	return diameter;
    }
    public double Get_Area() {		
        return area;  
    }
    public double Get_Circumference() {		
        return circumference ;  
    }
    public void Set_Radius (double Rad) {    
        radius = Rad;
        Calc_Diameter();
        Calc_Area();
        Calc_Circumference(); 
    }
    private void Calc_Diameter() {
    	diameter = radius * 2;
    }
    private void Calc_Area ( ) {    
        area = Math.PI * Math.pow(radius , 2); 
    }
    private void Calc_Circumference() {    
        circumference = 2 * Math.PI * radius;   
    }
}