XELATEX ?= xelatex
tex_files ?= $(wildcard include/*tex)
bib_files ?= $(wildcard include/main.bib)

main.pdf: main.tex $(tex_files) $(bib_files)

	$(XELATEX) -output-dir=build main.tex
	$(XELATEX) -output-dir=build main.tex
	@move build/main.pdf main.pdf

.PHONY: clean

clean:
	rm -rf build
	rm -rf main.pdf
