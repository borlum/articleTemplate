##################################################################
#Author: Nichlas Vanggaard - nvangg12@student.aau.dk
#Year: 2013
#Makefile for Latex.
#Compiler: pdflatex & bibtex8 (or biber)
#It's recomented to have the entire texlive-distribution installed
#You might combine the functions ex: make svn fullpdf clean.
#If you like it you can give me a beer sometime.
#Modified, and stripped down version - but I will not buy Nichlas
#a beer!
##################################################################

SHELL = /bin/bash

#Specify the name of the target:
TARGET=main

all:
	pdflatex -interaction=batchmode $(TARGET)
	biber $(TARGET)
	pdflatex -interaction=batchmode $(TARGET)
	pdflatex -interaction=batchmode $(TARGET)
	make clean

clean:
	@if [ -a $(TARGET).aux ]; then \
		 rm $(TARGET).aux*; \
	fi; 
	
	@if [ -a $(TARGET).bbl ]; then \
		 rm $(TARGET).bbl*; \
	fi;
	
	@if [ -a $(TARGET).bcf ]; then \
		 rm $(TARGET).bcf; \
	fi; 
	
	@if [ -a $(TARGET).blg ]; then \
		 rm $(TARGET).blg*; \
	fi;

	@if [ -a $(TARGET).dvi ]; then \
		rm $(TARGET).dvi*; \
	fi;

	@if [ -a $(TARGET).fdb ]; then \
		rm $(TARGET).fdb*; \
	fi;

	@if [ -a $(TARGET).fls ]; then \
		rm $(TARGET).fls*; \
	fi;

	@if [ -a $(TARGET).log ]; then \
		rm $(TARGET).log*; \
	fi;

	@if [ -a $(TARGET).run* ]; then \
		rm $(TARGET).run*; \
	fi;

	@if [ -a $(TARGET)-blx ]; then \
		rm $(TARGET)-blx*; \
	fi;	
	
	@if [ -a $(TARGET).out ]; then \
		rm $(TARGET).out*; \
	fi;

	@if [ -a $(TARGET).toc ]; then \
		rm $(TARGET).toc*; \
	fi;

	@if [ -a $(TARGET).synctex* ]; then \
		rm $(TARGET).synctex*; \
	fi;

	@if [ -a $(TARGET).fdb* ]; then \
		rm $(TARGET).fdb*; \
	fi;
	
	@if [ -a $(TARGET).lox ]; then \
            rm $(TARGET).lox*; \
    fi;

error:
	clear
	@echo "PDFLATEX errors:"
	@grep -A 2 --color=always Undefined\ control\ sequence $(TARGET).log && echo "" || echo "No Undefined control sequences"
	@grep -A 3 --color=always !\ Extra\ alignment\ tab\ has\ been\ changed\ to $(TARGET).log && echo "" || echo "No error to show from PDFLATEX"
	@grep --color=always Missing\ }\ inserted. $(TARGET).log && echo "" || echo "No errors to show from PDFLATEX"
	@grep --color=always Error: $(TARGET).log && echo "" || echo "No error to show from PDFLATEX"
	@echo ""
	@echo "BIBTEX errors:"
	@grep --color=always I\ was\ expecting\ a $(TARGET).blg && echo "" || echo "No errors to show from BIBTEX"