all: file.md file.pdf file.docx

analysis.html: analysis.Rmd
	Rscript -e "library(rmarkdown); rmarkdown::render('./analysis.Rmd', 'html_document')"

file.pdf: file.md
	  pandoc -H format.sty -V fontsize=12pt file.md -o file.pdf

file.docx: file.md
	  pandoc -s -S --reference-docx=format.docx file.md -o file.docx
