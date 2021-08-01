#!/bin/bash

SOURCE=article

codebraid pandoc \
    --lua-filter ../zmacros/commands.lua \
    --lua-filter ../zmacros/box-code.lua \
    --lua-filter ../zmacros/include-code.lua \
    --number-sections \
    --metadata autoEqnLabels=true \
    --filter pandoc-crossref \
    --citeproc \
    --csl=springer-basic-brackets.csl \
    --bibliography=references.bib \
    $SOURCE.md -o $SOURCE.pdf \
    --overwrite
