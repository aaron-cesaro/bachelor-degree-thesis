#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})/src"
latexmk -halt-on-error -pdf -output-directory=../build feasibility.tex
