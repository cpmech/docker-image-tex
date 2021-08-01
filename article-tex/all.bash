#!/bin/bash

# compile
pdflatex article.tex

# clean
rm -f *.aux *.log *.bbl *.blg *.out *.toc *.tit *.spl *.ps *.dvi *.out *.fls *.fdb_latexmk *.synctex.gz
