# COBOL Exercises :computer:

This repository contains a collection of [COBOL](https://en.wikipedia.org/wiki/COBOL) exercises that I'm working on as part of my programming learning journey.

## About COBOL :bar_chart:

COBOL (Common Business Oriented Language) is a high-level programming language specifically created for business applications. It is one of the oldest languages still in use today, having been created in 1959. COBOL is still widely used in legacy systems in financial institutions, insurance companies, and other organizations that process large amounts of business data.

## Repository Structure :file_folder

This repository is structured as follows:

EMXX/\
├── EXYY/\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;├── exYY.pdf\
│&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└── other files (input, output, cbl files, logs, etc...)

Each "EMXX" folder corresponds to an Exercise of Machine, and contains between 3 and 8 "EXYY" folders, each corresponding to a different exercise. The "YY" number ranges from 1 to 8.

Each "EXYY" folder contains a "exYY.pdf" file, which describes the exercise in Portuguese, and a "exercise.cbl" file, which contains the COBOL source code for the exercise. Some exercises also include a corresponding "exercise.out" file that shows the program output when executed.

## Running the Programs :running:

To run the COBOL programs in this repository, you will need to have a COBOL compiler installed on your machine. 

The programs have been tested using the software provided by FATEC, but you can use. [GnuCOBOL](https://sourceforge.net/projects/open-cobol/) (formerly known as OpenCOBOL) compiler, which is a free and open-source COBOL compiler. 

To compile and run a COBOL program, I used the following commands:

a) Navigate to the folder where the CBL file is, i.e.: EM02 and EX04
```
cd em02/ex04
```
b) Compile CBL file, for example ex04.cbl:
```
cobol ex04
```
C) After this compiler will start, so type 3 times the following:
```
ex04 <press enter>
ex04 <press enter>
ex04 <press enter>
```
D) For linkedition, just type this:
```
link ex04;
```
E) This will generate an EXE file, so you can run the program. From here you can use the existing programs with different inputs (with same layout!) OR customize as per your needs. 

## Contributions :raised_hands:

If you would like to contribute to this repository, feel free to send a [pull request](https://docs.github.com/en/github/collaborating-with-pull-requests). I'll be happy to review any contribution that can help improve the exercises or make them more useful for other COBOL students.

## License :scroll:

This repository is licensed under the [GPL-3.0](./LICENSE.md). 

See the [LICENSE.md](./LICENSE.md) file for more information or [https://www.gnu.org/licenses/gpl-3.0.en.html](https://www.gnu.org/licenses/gpl-3.0.en.html).