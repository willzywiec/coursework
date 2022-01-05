/**
   Test Names class with hard-coded data.
*/
public class NamesTester {


    private static void printLookup(Names names, String target) {
	System.out.print("Looking up " + target + " . . . ");
	if (names.lookup(target)) {
	    System.out.println("found");
	}
	else {
	    System.out.println("not found");
	}
    }

    public static void testLookup() {
	Names names = new Names();

	names.loadNames();
	System.out.println("Names in list: ");
	names.printNames();
	System.out.println("Number of names in list: [exp: 5] " +
			   names.numNames());	

	// SHOW thorough test cases
	printLookup(names, "Dave");
	printLookup(names, "Abby");
	printLookup(names, "Matt");
	printLookup(names, "Anne");
	printLookup(names, "Don");
	printLookup(names, "Ed");
	
	Names empty = new Names();

	System.out.println("Do lookup in an empty list: ");
	printLookup(empty, "Sam");
	printLookup(empty, "Anne");
	
	System.out.println();
    }

    public static void testRemove() {
	Names names = new Names();
	names.loadNames();       // uses the hardcoded names

	System.out.println("Original list: ");
	names.printNames();
	
	doRemove(names, "Scotty", "Anne Bob Carol Don Ed", 5);
	doRemove(names, "Anne", "Bob Carol Don Ed", 4);
	doRemove(names, "Ed", "Bob Carol Don", 3);
	doRemove(names, "Carol", "Bob Don", 2);
	doRemove(names, "Bob", "Don", 1);
	doRemove(names, "Don", "", 0);

	System.out.println();

    }

    public static void doRemove(Names names, String goner, 
				String expectedResult,
				int expectedSize) {
	System.out.println("Attempt remove: " + goner);

	boolean removed = names.remove(goner);

	if (!removed) {
	    System.out.println(goner + " was not present");
	}

	System.out.println("Names in list[exp: " + expectedResult + "]: ");
	names.printNames();
	System.out.println("Number of names in list: [exp: "
			   + expectedSize + "] " +
			   names.numNames());	
    }

    public static void doInsert(Names names,
				String newName, 
				String expectedResult, 
				int expectedSize) {

	names.insert(newName);
	System.out.println("Names in list[exp: "
			   + expectedResult + "]: ");
	names.printNames();
	System.out.println("Number of names in list: [exp: "
			   + expectedSize + "] " +
			   names.numNames());	

    }

    public static void testInsert() {
	Names names = new Names();

	System.out.println("Names in list[exp: <empty>]: ");
	names.printNames();
	System.out.println("Number of names in list: [exp: 0] " +
			   names.numNames());	

	doInsert(names, "Sam", "Sam", 1);
	doInsert(names, "Joe", "Joe Sam", 2);
	doInsert(names, "Rosy", "Joe Rosy Sam", 3);
	doInsert(names, "Ralph", "Joe Ralph Rosy Sam", 4);
	doInsert(names, "Suzy", "Joe Ralph Rosy Sam Suzy", 5);
	doInsert(names, "Henry", "Henry Joe Ralph Rosy Sam Suzy", 6);

	System.out.println();

    }

    public static void main(String[] args) {
	testLookup();
	testInsert();
	testRemove();
    }

}
