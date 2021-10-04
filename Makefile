all: sextant.pdf README.md
sextant.pdf: sextant.R
	Rscript $<
README.md: README.Rmd
	R --no-save -e 'library(rmarkdown); render("$<", "md_document", encoding="UTF-8")'
clean: force
	rm README.md sextant.pdf *~
force:

