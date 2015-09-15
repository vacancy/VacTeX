XELATEX ?= xelatex

main.pdf: main.tex

	$(XELATEX) -output-dir=build main.tex
	$(XELATEX) -output-dir=build main.tex
	@move build/main.pdf main.pdf

.PHONY: clean

clean:
	rm -rf build
	rm -rf main.pdf