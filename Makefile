all: sextant1.pdf sextant2.pdf README.md
%.pdf: %.R
	Rscript $<
README.md: README.Rmd
	R --no-save -e 'library(rmarkdown); render("$<", "md_document", encoding="UTF-8")'
clean: force
	rm README.md sextant*.pdf *~
force:

