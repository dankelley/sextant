all: sextant1.pdf sextant2.pdf README.md fig1.png fig2.png
%.pdf: %.R
	Rscript $<
fig2.png: fig2.R
	Rscript $<
fig1.png: fig1.R
	Rscript $<
README.md: README.Rmd
	R --no-save -e 'library(rmarkdown); render("$<", "md_document", encoding="UTF-8")'
clean: force
	rm README.md sextant*.pdf *~
force:

