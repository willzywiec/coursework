/*--------------------------------------------------------------------------|																		|
|   PROGRAM DESCRIPTION :  This program reads in a series of charaters from |
|	a file and counts the characters X,Y,Z in either lower or upper     |
|	case and prints the number of time each character appeared.   The   |
|	program is terminated when EOF character is encountered.	    |
|	The output is printed to the screen and an output file.             |
|	File names (input and output) are provided by the user.		    |												|
|--------------------------------------------------------------------------*/
#include <iostream>
#include <iomanip>
#include <fstream>	// Header file to provide file handeling functions
#include <string>
using namespace std;

int main()
{
	
	int 		numXs,numYs,numZs,badChar;
    char 		ch;
	string 		File_name;   // File name for input

	string		outputFile;

	ifstream	fin ;		// Input file handler to provide access to the input file

	numXs = 0;  numYs = 0;  numZs = 0; badChar = 0;  /* initialize counters */
	cout << "Enter input file name : ";	// Prompt user for input file name
	cin >> File_name;					// Read file name

	cout << "Enter output file name : ";
	cin >> outputFile;

	fin.open(File_name.c_str()) ;		// Open input file to read the data
	if ( fin.fail())		// Check to see if file failed to open, if yes stop the program.
		cout <<"\nBad input file name, program terminated.\nHave a nice day.\n\n\n";
	else
	{
		fin >> ch ;		// Initialize the loop control by reading the first charater in the file.
		while(	!fin.eof() )
		{
			switch(ch)  // Check to see which character was entered.
			{
				case 'X':
				case 'x' :		// Count Xs
					numXs++;
					break;
					
				case 'Y':
				case 'y' :		//Count Ys
					numYs++;
					break;
					
				case 'Z':
				case 'z' : 
					numZs++;	// Count Zs
					break;
				default:
					badChar++;
					break;
					
        	}; /* case */
			fin >> ch;			// Reset condition by reading the next character in the file.
		} /* while */
		cout << left ;
		cout << "===================================================" << endl;
		cout << setw(25)<<"The number of Xs was               " << setw(10)<< numXs << endl;
		cout << setw(25)<<"The number of Ys was               " << setw(10)<< numYs << endl;
		cout << setw(25) <<"The number of Zs was               " << setw(10)<< numZs << endl;
		cout << setw(25)<<"The number of bad characters was   " << setw(10)<< badChar << endl;
		cout << "---------------------------------------------------" << endl;
		cout << "PROGRAM TERMINATED after reaching the EOF." << endl;

		  ofstream fout;

		  fout.open(outputFile.c_str());

		  if(!fout) {
		    cout << "Cannot open file.\n";
		    return 1;
		  }

			fout << left ;
			fout << "Character                Count" << endl;
			fout << "===================================================" << endl;
			fout << setw(25)<<"X           " << setw(10)<< numXs << endl;
			fout << setw(25)<<"Y           " << setw(10)<< numYs << endl;
			fout << setw(25) <<"Z           " << setw(10)<< numZs << endl;
			fout << setw(25)<<"Bad Characters  " << setw(10)<< badChar << endl;
			fout << "---------------------------------------------------" << endl;
			fout << "PROGRAM TERMINATED after reaching the EOF." << endl;

		  fout.close();

		  if(!fout.good()) {
		    cout << "A file error occurred.";
		    return 1;
		  }
	}
}

