scanner:
	flex -i --outfile=scanner.c scanner.l
	gcc scanner.c -o scanner -lfl

parser:
	bison parser.y
	gcc parser.tab.c -o parser

compiler:
	bison -d -v parser.y
	flex -i --outfile=scanner.c scanner.l
	gcc parser.tab.c scanner.c SymTable.c -lfl -o compiler

test-scanner: scanner
	./scanner scanner.input

test-parser: parser
	./parser

test1: compiler
	./compiler program1.alg

test2: compiler
	./compiler program2.alg

test3: compiler
	./compiler program3.alg

clean:
	rm -rf scanner scanner.c scanner.o parser parser.tab.c parser.tab.h compiler

all: scanner parser

test-all: test
