# SWUFE Thesis LaTeX Template

A professional LaTeX template for bachelor, master, and doctoral theses at Southwestern University of Finance and Economics (SWUFE). This template is based on the original SWUFE thesis template with improvements for English writing and modern LaTeX practices.

## Features

- **Multi-level support**: Bachelor, Master, and Doctoral thesis formats
- **Bilingual support**: Chinese and English with proper font handling
- **AEA citation style**: Economics papers use American Economic Association format
- **Modular structure**: Separate chapters and components for easy management
- **Professional formatting**: Meets SWUFE academic standards

## File Structure

```
.
├── README.md                    # This file
├── example-multifile.tex        # Main compilation file
├── thesis-swufe.cls             # Main class file (modified from swufe-thesis)
├── econ-aea.bst                 # AEA bibliography style for economics
├── refs.bib                     # Bibliography database (example references)
├── clean_design.txt             # Project requirements and notes
├── chapter/                     # Thesis chapters
│   ├── 1.intro.tex             # Introduction chapter
│   ├── 2.LR.tex                # Literature review chapter
│   ├── 3.Theory.tex            # Theoretical framework chapter
│   ├── 4.Result.tex            # Results chapter
│   └── 5.Conclusion.tex        # Conclusion chapter
├── misc/                        # Miscellaneous components
│   ├── chinese_abstract.tex    # Chinese abstract
│   ├── english_abstract.tex    # English abstract
│   ├── acknowledgement.tex     # Acknowledgements
│   ├── appendix.tex            # Appendix
│   └── academic_declaration.tex # Academic declaration
├── fig/                         # Figures directory
├── pic/                         # Pictures directory
├── tab/                         # Tables directory
└── chapter/                     # Additional chapter files
```

## Prerequisites

- **TeX Live 2025** or later (recommended)
- **XeLaTeX** compiler (required for Chinese fonts)
- **Basic LaTeX knowledge**

## Installation

1. Install TeX Live 2025 or later from [tug.org/texlive](https://tug.org/texlive/)
2. Clone or download this template
3. Ensure all required LaTeX packages are installed

## Compilation

### Basic Compilation (4-step process)

```bash
cd /path/to/your/thesis
xelatex example-multifile.tex
bibtex example-multifile
xelatex example-multifile.tex
xelatex example-multifile.tex
```

### Using VSCode or TeX Live Prompt

1. Navigate to the directory:
   ```bash
   cd $FILEPATH
   ```

2. Run the compilation sequence:
   ```bash
   xelatex example-multifile.tex
   bibtex example-multifile
   xelatex example-multifile.tex
   xelatex example-multifile.tex
   ```

### Automated Script (for convenience)

Create a `compile.sh` (Linux/Mac) or `compile.bat` (Windows) file:

**compile.sh:**
```bash
#!/bin/bash
xelatex example-multifile.tex
bibtex example-multifile
xelatex example-multifile.tex
xelatex example-multifile.tex
```

**compile.bat:**
```batch
xelatex example-multifile.tex
bibtex example-multifile
xelatex example-multifile.tex
xelatex example-multifile.tex
```

## Usage

### 1. Basic Configuration

Edit `example-multifile.tex` to set your thesis information:

```latex
% For Bachelor thesis
\title{Your Thesis Title}
\college{Your College Name}
\major{Your Major}
\grade{Your Grade}
\studentnumber{Your Student Number}
\advisor{Your Advisor}
\author{Your Name}

% For Master/Doctoral thesis (uncomment and use)
% \title{Your Thesis Title}
% \author{Your Name}
% \advisor{Your Advisor}
% \school{Your School}
% \major{Your Major}
% \studentnumber{Your Student Number}
```

### 2. Chapter Organization

The template uses a modular structure:

- **Main file**: `example-multifile.tex` - Controls the overall structure
- **Chapters**: `chapter/*.tex` - Individual chapter files
- **Components**: `misc/*.tex` - Abstract, acknowledgements, etc.

To add a new chapter:
1. Create a `.tex` file in the `chapter/` directory
2. Add `\input{chapter/your-chapter.tex}` in the main file

### 3. Citation and Bibliography

#### Citation Styles

The template supports multiple citation styles. Choose based on your field:

1. **Economics**: AEA format (default)
   ```latex
   \usepackage{natbib}
   \setcitestyle{authoryear}
   \bibliographystyle{econ-aea}
   ```

2. **Management**: Nankai Business Review format
   ```latex
   \bibliographystyle{thesis-swufe}  % Or specify appropriate .bst
   ```

3. **Finance**: Consult your advisor for specific requirements

4. **Chinese students**: GBT-2015 format
   ```latex
   \bibliographystyle{gbt-2015}  % If available
   ```

#### Bibliography Management

1. **Using Zotero** (recommended):
   - Install Better BibTeX extension
   - Export bibliography as `.bib` file
   - Place in project directory as `refs.bib`

2. **Manual editing**:
   - Edit `refs.bib` directly
   - Follow BibTeX format

Example BibTeX entry:
```bibtex
@article{key,
  title   = {Article Title},
  author  = {Author, First and Author, Second},
  year    = {2023},
  journal = {Journal Name},
  volume  = {10},
  number  = {2},
  pages   = {100--120},
  doi     = {10.xxxx/xxxxxx}
}
```

### 4. Tables and Figures

#### Professional Tables

Use the `booktabs` package for professional tables:

```latex
\begin{table}[ht]
\centering
\caption{Descriptive Statistics}
\label{tab:descriptive}
\begin{tabular}{lcccc}
\toprule
Variable & Mean & SD & Min & Max \\
\midrule
GDP Growth & 3.2 & 1.5 & -2.1 & 8.7 \\
Inflation & 2.1 & 0.8 & 0.5 & 4.2 \\
Unemployment & 5.4 & 1.2 & 3.1 & 9.8 \\
\bottomrule
\end{tabular}
\end{table}
```

#### Figures

Place figures in `fig/` or `pic/` directory:

```latex
\begin{figure}[ht]
\centering
\includegraphics[width=0.8\textwidth]{fig/your-figure.pdf}
\caption{Figure Caption}
\label{fig:your-label}
\end{figure}
```

### 5. Mathematics and Theorems

The template includes `amsthm` for theorem environments:

```latex
\begin{theorem}[Name]
Theorem statement here.
\end{theorem}

\begin{proof}
Proof text here.
\end{proof}

\begin{definition}
Definition text here.
\end{definition}
```

## Customization

### Changing Citation Style

Edit the main file to change bibliography style:
you may find this repo useful：https://github.com/ShiroTakeda/econ-bst

```latex
% For AEA style (economics)
\bibliographystyle{econ-aea}

% For other styles
% \bibliographystyle{plainnat}
% \bibliographystyle{ieeetr}
% \bibliographystyle{acm}
```

### Adding Packages

Add required packages in the main file preamble:

```latex
\usepackage{newpackage}  % Add your packages here
\usepackage{anotherpackage}
```

### Modifying Class Options

The class supports several options:

```latex
\documentclass[bachelor,english]{thesis-swufe}  % Bachelor thesis in English
\documentclass[master,chinese]{thesis-swufe}    % Master thesis in Chinese
\documentclass[doctor]{thesis-swufe}            % Doctoral thesis
```

## Troubleshooting

### Common Issues

1. **Font errors**: Ensure you have Chinese fonts installed (SimSun, SimHei)
2. **Citation errors**: Run the full 4-step compilation process
3. **File not found**: Check file paths and extensions
4. **Bibliography not updating**: Delete auxiliary files (`*.aux`, `*.bbl`) and recompile

### Debugging Steps

If compilation fails:
1. Check the `.log` file for error messages
2. Ensure all required packages are installed
3. Verify file paths and names
4. Try compiling a minimal example first

## Citation Format Guidelines

### Economics (AEA Style)
- Author-year format: `\citep{key}` for parenthetical, `\citet{key}` for textual
- Multiple authors: use "et al." for 3+ authors
- Journal abbreviations: follow AEA standards

### Management (Nankai Business Review)
- Consult journal guidelines
- May require specific `.bst` file

### Finance
- Field-specific requirements vary
- Always consult your advisor

### Chinese Standards (GBT-2015)
- Sequential numbering
- Chinese character formatting
- Specific reference formatting rules

## Best Practices

1. **Version Control**: Use Git to track changes
2. **Backup**: Regular backups of your work
3. **Incremental Compilation**: Compile frequently to catch errors early
4. **Bibliography Management**: Use reference manager software (Zotero, Mendeley)
5. **Code Organization**: Keep LaTeX code clean and commented

## Contributing

This template is open for improvements. To contribute:
1. Fork the repository
2. Make your changes
3. Submit a pull request
4. Ensure documentation is updated

## License

This work is based on the original SWUFE thesis template and inherits its license. All original credit goes to the respective authors.

## Support

For issues and questions:
1. Check the documentation first
2. Review LaTeX community resources
3. Consult your advisor for field-specific requirements

## Acknowledgments

- Original SWUFE thesis template authors
- Contributors to the LaTeX community
- SWUFE academic standards committee

---

**Note**: This template is provided as-is. Always verify formatting requirements with your institution before submission.