// Will Zywiec
// 7815188984

#include <algorithm>
#include <iomanip>
#include <iostream>
#include <iterator>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>

using namespace std;

class MovieMenu {

public:

	void print(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[], string outputFile) {

		cout << "\n";
		cout << "--------------------------------------------------------------------------------" << endl;
		for(int i = 0; i < 50; i++) {
			if(movieTitle[i] != " ") {
				cout << "Title		" << movieTitle[i] << endl;
				cout << "Year		" << year[i] << endl;
				cout << "Studio		" << studio[i] << endl;
				cout << "Actors		" << actor[i] << endl;
				cout << "Gross Income	$" << grossIncome[i] << ".00" << endl;
				cout << "--------------------------------------------------------------------------------" << endl;
			}
		}

		ofstream fout;
		fout.open(outputFile.c_str());

		fout << "\n";
		fout << "--------------------------------------------------------------------------------" << endl;
		for(int i = 0; i < 50; i++) {
			if(movieTitle[i] != " ") {
				fout << "Title		" << movieTitle[i] << endl;
				fout << "Year		" << year[i] << endl;
				fout << "Studio		" << studio[i] << endl;
				fout << "Actors		" << actor[i] << endl;
				fout << "Gross Income	$" << grossIncome[i] << ".00" << endl;
				fout << "--------------------------------------------------------------------------------" << endl;
			}
		}

		fout.close();

	}

	void printMovie(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[], string outputFile) {

		cout << "\n";
		cout << left;
		cout << setw(30) << "Title" << setw(10) << "Year" << setw(15) << "Studio" << "Gross Income" << endl;
		cout << "--------------------------------------------------------------------------------" << endl;
		for(int i = 0; i < 50; i++) {
			if(movieTitle[i] != " ") {
				cout << setw(30) << movieTitle[i] << setw(10) << year[i] << setw(15) << studio[i] << "$" << grossIncome[i] << ".00"<< setw(10) << endl;
			}
		}
		cout << "--------------------------------------------------------------------------------" << endl;

		ofstream fout;
		fout.open(outputFile.c_str());

		fout << "\n";
		fout << left;
		fout << setw(30) << "Title" << setw(10) << "Year" << setw(15) << "Studio" << "Gross Income" << endl;
		fout << "--------------------------------------------------------------------------------" << endl;
		for(int i = 0; i < 50; i++) {
			if(movieTitle[i] != " ") {
				fout << setw(30) << movieTitle[i] << setw(10) << year[i] << setw(15) << studio[i] << "$" << grossIncome[i] << ".00"<< setw(10) << endl;
			}
		}
		fout << "--------------------------------------------------------------------------------" << endl;

		fout.close();

	}

	void addMovie(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[]) {

		string localMovieTitle;
		int localYear;
		int localGrossIncome;
		string localStudio;
		string localActor;
		string localStub;

		cout << "\nEnter movie title: ";
		getline(cin, localStub);
		getline(cin, localMovieTitle);
		cout << "\nEnter year: ";
		cin >> localYear;
		cout << "\nEnter gross income (without $ sign): ";
		cin >> localGrossIncome;
		cout << "\nEnter studio: ";
		cin >> localStudio;
		cout << "\nEnter actors in a comma-separated list (e.g. Harrison Ford, Darryl Hannah, Rutger Hauer, ...): ";
		getline(cin, localStub);
		getline(cin, localActor);

		for(int i = 0; i < 50; i++) {
			if(movieTitle[i] == " ") {
				movieTitle[i] = localMovieTitle;
				year[i] = localYear;
				grossIncome[i] = localGrossIncome;
				studio[i] = localStudio;
				actor[i] = localActor;
				break;
			}
		}

	}

	void removeMovie(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[]) {

		string localMovieTitle;
		string localStub;

		cout << "\nEnter movie title: ";
		getline(cin, localStub);
		getline(cin, localMovieTitle);

		for(int i = 0; i < 50; i++) {
			if(localMovieTitle == movieTitle[i]) {
				movieTitle[i] = " ";
				year[i] = 0;
				grossIncome[i] = 0;
				studio[i] = " ";
				actor[i] = " ";
			}
		}

	}

	void searchMovie(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[]) {

		string localMovieTitle;
		string localStub;

		cout << "\nEnter movie title: ";
		getline(cin, localStub);
		getline(cin, localMovieTitle);

		for(int i = 0; i < 50; i++) {
			if(localMovieTitle == movieTitle[i]) {
				cout << "\n";
				cout << "--------------------------------------------------------------------------------" << endl;
				cout << "Title		" << movieTitle[i] << endl;
				cout << "Year		" << year[i] << endl;
				cout << "Studio		" << studio[i] << endl;
				cout << "Actors		" << actor[i] << endl;
				cout << "Gross Income	$" << grossIncome[i] << ".00" << endl;
				cout << "--------------------------------------------------------------------------------" << endl;
			}

		}

	}

	void searchStudio(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[]) {

		int grossIncomeTotaler = 0;
		string localStudio;

		cout << "\nEnter studio: ";
		cin >> localStudio;

		cout << "\n";
		cout << "--------------------------------------------------------------------------------" << endl;
		cout << localStudio << endl;
		cout << "--------------------------------------------------------------------------------" << endl;

		for(int i = 0; i < 50; i++) {
			if(localStudio == studio[i]) {

				grossIncomeTotaler += grossIncome[i];

				cout << "Title		" << movieTitle[i] << endl;
				cout << "Year		" << year[i] << endl;
				cout << "Actors		" << actor[i] << endl;
				cout << "Gross Income	$" << grossIncome[i] << ".00" << endl;
				cout << "--------------------------------------------------------------------------------" << endl;

			}

			if(i == 49) {
				cout << "Total Gross Income	" << "$" << grossIncomeTotaler << ".00" << endl;
				cout << "--------------------------------------------------------------------------------" << endl;
			}

		}

	}

	void searchActor(string movieTitle[], int year[], int grossIncome[], string studio[], string actor[]) {

		string localActor;
		string localStub;

		cout << "\nEnter actor: ";
		getline(cin, localStub);
		getline(cin, localActor);

		cout << "\n";
		cout << "--------------------------------------------------------------------------------" << endl;
		cout << localActor << endl;
		cout << "--------------------------------------------------------------------------------" << endl;

		for(int i = 0; i < 50; i++) {

			size_t localActorToken = actor[i].find(localActor);

			if(localActorToken != std::string::npos) {
				cout << "Title		" << movieTitle[i] << endl;
				cout << "Year		" << year[i] << endl;
				cout << "Studio		" << studio[i] << endl;
				cout << "Gross Income	$" << grossIncome[i] << ".00" << endl;
				cout << "--------------------------------------------------------------------------------" << endl;
			}

		}

	}

};

int main() {

	int grossIncome[50], year[50];
	string actor[50], movieTitle[50], stub[50], studio[50];
	string inputFile, outputFile;
	ifstream fin;

	for(int i = 0; i < 50; i++) {
		movieTitle[i] = " ";
		year[i] = 0;
		grossIncome[i] = 0;
		studio[i] = " ";
		actor[i] = " ";
	}

	cout << "Enter input file name: ";
	cin >> inputFile;
	fin.open(inputFile.c_str());
	if(fin.fail())
		cout << "\nInvalid entry.";
	else {
		for(int i = 0; i < 50; i++) {
			getline(fin, movieTitle[i]);
			fin >> year[i];
			fin >> grossIncome[i];
			fin >> studio[i];
			getline(fin, stub[i]);
			getline(fin, actor[i]);
		}
	}

	cout << "\nEnter output file name: ";
	cin >> outputFile;

	MovieMenu menu;

	int x = 0;
	int y = 0;

	while(x == 0) {
		cout << "\nMENU";
		cout << "\n----";
		cout << "\n(a)	Add Movie";
		cout << "\n(r)	Remove Movie";
		cout << "\n(m)	Print Reports";
		cout << "\n(o)	Search for Movie";
		cout << "\n(t)	Search by Studio";
		cout << "\n(c)	Search by Actor";
		cout << "\n(x)	EXIT";
		char menuSelection;
		cout << "\n\nEnter Selection: ";
		cin >> menuSelection;
		switch(menuSelection) {
		case 'a':
			menu.addMovie(movieTitle, year, grossIncome, studio, actor);
			break;
		case 'r':
			menu.removeMovie(movieTitle, year, grossIncome, studio, actor);
			break;
		case 'm':
			y = 0;
			while(y == 0) {
				cout << "\nPRINT MENU";
				cout << "\n----------";
				cout << "\n(a)	All Movie Information";
				cout << "\n(s)	Movie Summary";
				cout << "\n(x)	EXIT";
				char subMenuSelection;
				cout << "\n\nEnter Selection: ";
				cin >> subMenuSelection;
				switch(subMenuSelection) {
				case 'a':
					menu.print(movieTitle, year, grossIncome, studio, actor, outputFile);
					break;
				case 's':
					menu.printMovie(movieTitle, year, grossIncome, studio, actor, outputFile);
					break;
				case 'x':
					y = 1;
					break;
				}
			}
			break;
		case 'o':
			menu.searchMovie(movieTitle, year, grossIncome, studio, actor);
			break;
		case 't':
			menu.searchStudio(movieTitle, year, grossIncome, studio, actor);
			break;
		case 'c':
			menu.searchActor(movieTitle, year, grossIncome, studio, actor);
			break;
		case 'x':
			char localInput;
			cout << "\nAre you sure? (y/n): ";
			cin >> localInput;
			if(localInput == 'y')
				x = 1;
			break;
		};
	}

}
