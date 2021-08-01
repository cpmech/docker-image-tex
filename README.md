# Docker image to convert Markdown containing Julia code

This image installs [texlive](https://en.wikipedia.org/wiki/TeX_Live) (with xelatex), [pandoc](https://pandoc.org/), and [julia](https://julialang.org/) so we can generate PDF files containing Julia code from Markdown files.

We use [codebraid](https://github.com/gpoore/codebraid) to automatically run Julia code and update the PDF file.

We also install [pandoc-crossref](https://github.com/lierdakil/pandoc-crossref) to enable referencing.

## Build docker image

```bash
bash ./zscripts/dk-build-image.bash
```
