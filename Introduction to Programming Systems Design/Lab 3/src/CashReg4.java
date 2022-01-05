// Will Zywiec
// 7815188984

public class CashReg4
{
   private static final int DOLLAR_VALUE = 100;
   private static final int QUARTER_VALUE = 25;
   private static final int DIME_VALUE = 10;
   private static final int NICKEL_VALUE = 5;
   private static final int PENNY_VALUE = 1;

   private double purchase;
   private int payment;
   
   public CashReg4()
   {
      purchase = 0;
      payment = 0;
   }

   public void recordPurchase(double amount)
   {
      purchase = purchase + amount * 100;
      purchase = Math.round(purchase);
   }
  
   public double getTotal() {
       return purchase / 100;
    }; 
    
   public void enterPayment(Change money)
   {
       payment = money.totalValue();
   }
   
   public Change giveChange()
   {
	   int chg = payment - (int)purchase;
	   int dollars = chg / DOLLAR_VALUE;
	   int chg2 = chg - dollars * DOLLAR_VALUE;
	   int quarters = chg2 / QUARTER_VALUE;
	   int chg3 = chg2 - quarters * QUARTER_VALUE;
	   int dimes = chg3 / DIME_VALUE;
	   int chg4 = chg3 - dimes * DIME_VALUE;
	   int nickels = chg4 / NICKEL_VALUE;
	   int chg5 = chg4 - nickels * NICKEL_VALUE;
	   int pennies = chg5 / PENNY_VALUE;
	   Change change = new Change(dollars, quarters, dimes, nickels, pennies);
	   purchase = 0;
	   payment = 0;
	   return change;
   }
}
