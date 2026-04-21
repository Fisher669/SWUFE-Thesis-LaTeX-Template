# SWUFE Thesis Template Usage Guide

## Quick Start

### 1. Initial Setup
```bash
# Clone or download the template
git clone [repository-url]
cd swufe-thesis-template

# Install required LaTeX packages (if needed)
# Most packages are included in TeX Live 2025
```

### 2. First Compilation
```bash
# Run the compilation script
./compile.bat  # Windows
# or
bash compile.sh  # Linux/Mac
```

### 3. Customize Your Thesis
1. Edit `example-thesis.tex` with your information
2. Replace example chapters with your content
3. Update bibliography in `example-refs.bib`
4. Compile again to see changes

## Detailed Usage Instructions

### A. Setting Up Your Thesis Information

Edit the following section in `example-thesis.tex`:

```latex
% For Bachelor thesis
\title{Your Thesis Title Here}
\college{Your College Name}
\major{Your Major}
\grade{Your Grade Level}
\studentnumber{Your Student ID}
\advisor{Your Advisor's Name}
\author{Your Name}

% For Master/Doctoral thesis (use this instead)
% \title{Your Thesis Title Here}
% \author{Your Name}
% \advisor{Your Advisor's Name}
% \school{Your School}
% \major{Your Major}
% \studentnumber{Your Student ID}
```

### B. Writing Chapters

#### Option 1: Use Existing Structure
- Keep the existing chapter files (`chapter/*.tex`)
- Edit each file with your content
- Maintain the same file names for consistency

#### Option 2: Create New Structure
1. Create new `.tex` files in the `chapter/` directory
2. Name them logically (e.g., `1-introduction.tex`, `2-literature.tex`)
3. Update the main file to include them:

```latex
% In example-thesis.tex
\input{chapter/1-introduction.tex}
\input{chapter/2-literature.tex}
\input{chapter/3-methodology.tex}
% ... etc.
```

### C. Managing References

#### Using Zotero (Recommended)
1. Install Zotero and Better BibTeX extension
2. Organize your references in Zotero
3. Export with Better BibTeX:
   - Right-click on collection → Export
   - Format: Better BibTeX
   - Check "Keep updated"
   - Save as `refs.bib` in project directory

#### Manual BibTeX Management
1. Edit `example-refs.bib` directly
2. Follow the examples provided
3. Use consistent formatting

#### Citation Commands
```latex
% Parenthetical citation
\citep{smith2023_urban_land}  % Output: (Smith and Johnson, 2023)

% Textual citation  
\citet{smith2023_urban_land}  % Output: Smith and Johnson (2023)

% Multiple citations
\citep{smith2023_urban_land, jones2022_land_economics}

% Page numbers
\citep[p.~45]{smith2023_urban_land}
\citep[see][pp.~45-47]{smith2023_urban_land}
```

### D. Creating Professional Tables

Use the `booktabs` package for publication-quality tables:

```latex
\begin{table}[ht]
\centering
\caption{Your Table Title}
\label{tab:your-label}
\begin{tabular}{lccc}
\toprule
Column 1 & Column 2 & Column 3 & Column 4 \\
\midrule
Row 1 & Data 1 & Data 2 & Data 3 \\
Row 2 & Data 4 & Data 5 & Data 6 \\
Row 3 & Data 7 & Data 8 & Data 9 \\
\bottomrule
\end{tabular}
\begin{tablenotes}
\small
\item \textit{Notes}: Add explanatory notes here.
\item \textit{Source}: Data source information.
\end{tablenotes}
\end{table}
```

### E. Including Figures

1. Place images in `fig/` or `pic/` directory
2. Use vector formats (PDF, EPS) when possible
3. For photos, use high-resolution JPEG or PNG

```latex
\begin{figure}[ht]
\centering
\includegraphics[width=0.8\textwidth]{fig/your-figure.pdf}
\caption{Your Figure Caption}
\label{fig:your-label}
\end{figure}
```

### F. Mathematics and Equations

```latex
% Inline math
The formula $E = mc^2$ is famous.

% Display math
\begin{equation}
y = \alpha + \beta x + \epsilon
\label{eq:regression}
\end{equation}

% Multiple equations
\begin{align}
y_i &= \alpha + \beta x_i + \epsilon_i \label{eq:model1} \\
\hat{y}_i &= \hat{\alpha} + \hat{\beta} x_i \label{eq:model2}
\end{align}

% Matrices
\[
\mathbf{X} = \begin{bmatrix}
x_{11} & x_{12} & \cdots & x_{1n} \\
x_{21} & x_{22} & \cdots & x_{2n} \\
\vdots & \vdots & \ddots & \vdots \\
x_{m1} & x_{m2} & \cdots & x_{mn}
\end{bmatrix}
\]
```

### G. Theorems and Proofs

```latex
\begin{theorem}[Important Theorem]
Theorem statement here.
\end{theorem}

\begin{proof}
Proof text here. Use $\square$ to end the proof.
\end{proof}

\begin{definition}[Key Concept]
Definition text here.
\end{definition}

\begin{lemma}[Useful Lemma]
Lemma statement here.
\end{lemma}

\begin{corollary}[Implication]
Corollary statement here.
\end{corollary}
```

## Citation Style Selection

### Economics (Default: AEA Style)
```latex
\usepackage{natbib}
\setcitestyle{authoryear}
\bibliographystyle{econ-aea}
```

### Management (Nankai Business Review)
```latex
% May require specific .bst file
\bibliographystyle{nankai-business-review}
```

### Finance
```latex
% Consult your advisor for specific requirements
\bibliographystyle{financial-review}
```

### Chinese Standards (GBT-2015)
```latex
\bibliographystyle{gbt-2015}
```

## Compilation Workflow

### Standard 4-Step Process
```bash
xelatex example-thesis.tex      # Step 1: Process document
bibtex example-thesis           # Step 2: Process bibliography
xelatex example-thesis.tex      # Step 3: Resolve references
xelatex example-thesis.tex      # Step 4: Final formatting
```

### Using Automation Scripts
- **Windows**: Run `compile.bat`
- **Linux/Mac**: Run `./compile.sh`
- **Cleanup**: Run `clean.bat` or `./clean.sh`

### Troubleshooting Compilation

#### Common Errors and Solutions

1. **"File not found" errors**
   ```bash
   # Check file paths and extensions
   # Ensure all required files are in correct directories
   ```

2. **Font errors**
   ```bash
   # Install required Chinese fonts
   # Or modify font settings in thesis-swufe.cls
   ```

3. **Bibliography errors**
   ```bash
   # Delete .aux and .bbl files and recompile
   del *.aux *.bbl
   ./compile.bat
   ```

4. **Undefined control sequences**
   ```bash
   # Check for missing packages
   # Ensure all \usepackage commands are correct
   ```

#### Debug Mode
```bash
# Compile with verbose output
xelatex -interaction=errorstopmode example-thesis.tex

# Check log file for details
type example-thesis.log | more
```

## Best Practices

### 1. Version Control
```bash
# Initialize git repository
git init
git add .
git commit -m "Initial thesis template"

# Regular commits
git add -A
git commit -m "Add chapter 3: Methodology"
```

### 2. Backup Strategy
- Regular backups to cloud storage
- Versioned backups using git
- External hard drive backups monthly

### 3. Writing Workflow
1. **Outline**: Plan chapter structure first
2. **Draft**: Write content without formatting concerns
3. **Format**: Apply LaTeX formatting after content is complete
4. **Review**: Compile frequently to catch errors early
5. **Finalize**: Final compilation and proofreading

### 4. Collaboration
- Use git for version control
- Maintain clear commit messages
- Document changes in CHANGELOG.md
- Use branches for major revisions

### 5. Performance Optimization
- Split large documents into multiple files
- Use `\includeonly` during development
- Compile only changed sections when possible
- Clean auxiliary files regularly

## Advanced Features

### Customizing the Class File
The `thesis-swufe.cls` file can be modified for specific needs:

```latex
% Change default font size
\LoadClass[12pt, openany, twoside]{book}

% Modify page margins
\geometry{left=3cm, right=2.5cm, top=2.5cm, bottom=2.5cm}

% Customize header/footer
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\leftmark}
\fancyhead[LO]{\rightmark}
```

### Adding Packages
Add required packages in the main file preamble:

```latex
\usepackage{newpackage}       % Add new packages here
\usepackage{anotherpackage}   % Additional packages
```

### Creating Custom Commands
Define custom commands for frequently used formatting:

```latex
% In preamble
\newcommand{\important}[1]{\textbf{\textit{#1}}}
\newcommand{\code}[1]{\texttt{#1}}
\newcommand{\var}[1]{\mathit{#1}}

% Usage in document
This is \important{important text}.
The variable \var{x} represents...
```

## Submission Checklist

Before final submission, verify:

### Content
- [ ] All required sections included
- [ ] Abstract in both Chinese and English
- [ ] Table of contents complete
- [ ] All figures and tables numbered and referenced
- [ ] Bibliography complete and correctly formatted
- [ ] Acknowledgements included
- [ ] Appendices (if any) properly formatted

### Formatting
- [ ] Page margins correct
- [ ] Font size and style consistent
- [ ] Line spacing appropriate
- [ ] Headers and footers correct
- [ ] Page numbering consistent
- [ ] Figure and table captions properly formatted

### Technical
- [ ] Compiles without errors
- [ ] All cross-references resolved
- [ ] Bibliography citations correct
- [ ] No orphaned files
- [ ] PDF output as expected

### Institutional Requirements
- [ ] Meets SWUFE formatting guidelines
- [ ] Required declarations included
- [ ] Advisor approval obtained
- [ ] Submission deadlines met

## Getting Help

### Resources
1. **LaTeX Documentation**: https://www.latex-project.org/help/
2. **TeX Stack Exchange**: https://tex.stackexchange.com/
3. **SWUFE Library**: Thesis formatting guidelines
4. **Department Resources**: Advisor and committee guidance

### Support Channels
- GitHub Issues: For template bugs and improvements
- Department Workshops: Thesis writing support
- Peer Review: Exchange with fellow students
- Professional Editors: For final polishing

## License and Attribution

This template is based on the original SWUFE thesis template. Please acknowledge:
- Original SWUFE template authors
- Contributors to this improved version
- Any third-party packages used

---

**Remember**: Always verify final formatting with your department's specific requirements before submission.