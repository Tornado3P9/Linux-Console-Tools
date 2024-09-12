# pandoc

Convert documents between various formats.  
More information: <https://pandoc.org>.  

```bash
# Convert file to PDF (the output format is determined by file extension):
pandoc input.md -o output.pdf

# Force conversion to use a specific format:
pandoc input.docx --to gfm -o output.md

# Convert to a standalone file with the appropriate headers/footers (for LaTeX, HTML, etc.):
pandoc input.md -s -o output.tex

# Convert markdown to html using custom CSS style for the resulting HTML:
pandoc -f markdown -t html -s --css="codehilite.css" filename.md -o filename.html

# List all supported input formats:
pandoc --list-input-formats

# List all supported output formats:
pandoc --list-output-formats
```
