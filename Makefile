SHELL = /bin/bash

XELATEX ?= xelatex
VIEW_PDF ?= open
tex_files ?= $(wildcard include/*tex)
bib_files ?= $(wildcard include/main.bib)

main.pdf: main.tex $(tex_files) $(bib_files)
	@mkdir -p build/include
	$(XELATEX) -output-dir=build main.tex
	$(XELATEX) -output-dir=build main.tex
	@mv build/main.pdf main.pdf

view: main.pdf
	$(VIEW_PDF)	"`pwd`"/main.pdf

.PHONY: clean
clean:
	rm -rf build
	rm -rf main.pdf
