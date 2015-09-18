SHELL = /bin/bash

ifeq ($(shell uname),Darwin)
	OS ?= mac
endif
OS ?= win

XELATEX		?=		xelatex
VIEW_PDF	?=		open
tex_files 	?= 		$(wildcard data/*tex)
bib_files 	?= 		$(wildcard data/main.bib)


main.pdf: main.tex $(tex_files) $(bib_files)
	@mkdir -p build/include
	$(XELATEX) -output-dir=build main.tex
	@mv build/main.pdf main.pdf

view:
	$(VIEW_PDF)	"`pwd`"/main.pdf

.PHONY: clean
clean:
	rm -rf build
	rm -rf main.pdf
