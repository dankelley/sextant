all: sextant1.pdf sextant2.pdf fig1.png fig2.png
%.pdf: %.R
	Rscript $<
%.png: %.R
	Rscript $<
clean: force
	-rm -f *.pdf *.png *~
force:

