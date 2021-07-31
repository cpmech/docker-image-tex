TEX_COMMAND=pdflatex -interaction=batchmode -halt-on-error
BIB_COMMAND=bibtex

all: article

article:
	$(TEX_COMMAND) article

clean:
	rm -f *.aux *.log *.bbl *.blg *.out *.toc *.tit *.spl *.ps *.dvi *.out *.fls *.fdb_latexmk *.synctex.gz
