#!/bin/bash

echo "============================================"
echo "SWUFE Thesis LaTeX Compilation Script"
echo "============================================"
echo

# Check if file exists
if [ ! -f "example-thesis.tex" ]; then
    echo "Error: example-thesis.tex not found!"
    echo "Please ensure you are in the correct directory."
    exit 1
fi

echo "Step 1: First XeLaTeX pass..."
echo
xelatex -interaction=nonstopmode example-thesis.tex
if [ $? -ne 0 ]; then
    echo "Error in first XeLaTeX pass!"
    exit 1
fi

echo
echo "Step 2: BibTeX for bibliography..."
echo
bibtex example-thesis
if [ $? -ne 0 ]; then
    echo "Error in BibTeX pass!"
    echo "Note: This may be normal if no citations exist yet."
fi

echo
echo "Step 3: Second XeLaTeX pass..."
echo
xelatex -interaction=nonstopmode example-thesis.tex
if [ $? -ne 0 ]; then
    echo "Error in second XeLaTeX pass!"
    exit 1
fi

echo
echo "Step 4: Third XeLaTeX pass (final)..."
echo
xelatex -interaction=nonstopmode example-thesis.tex
if [ $? -ne 0 ]; then
    echo "Error in third XeLaTeX pass!"
    exit 1
fi

echo
echo "============================================"
echo "Compilation completed successfully!"
echo "============================================"
echo
echo "Generated files:"
echo "- example-thesis.pdf (main document)"
echo "- example-thesis.aux (auxiliary file)"
echo "- example-thesis.bbl (bibliography)"
echo "- example-thesis.blg (BibTeX log)"
echo "- example-thesis.log (compilation log)"
echo "- example-thesis.out (output)"
echo "- example-thesis.toc (table of contents)"
echo
echo "To clean auxiliary files, run: ./clean.sh"
echo