#!/bin/bash
echo "running..."
xelatex -no-pdf bjtu_template >/dev/null 2>&1
xelatex -no-pdf bjtu_template >/dev/null 2>&1
bibtex bjtu_template >/dev/null 2>&1
xelatex bjtu_template >/dev/null 2>&1
xelatex bjtu_template >/dev/null 2>&1
rm *.aux *.bbl *.blg *.lof *.log *.lot *.out *.toc *.xdv >/dev/null 2>&1
echo "OK"
