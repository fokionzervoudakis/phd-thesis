#!/bin/bash

set -e

function new_line {
    printf "%.0s=" {1..79}
    printf '\n'
}

pdflatex fz-thesis.tex
new_line

bibtex fz-thesis
new_line

pdflatex fz-thesis.tex
new_line

pdflatex fz-thesis.tex

rm fz-thesis.aux fz-thesis.blg fz-thesis.lof fz-thesis.log fz-thesis.lol fz-thesis.lot fz-thesis.out fz-thesis.toc

