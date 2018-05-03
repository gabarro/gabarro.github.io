HTML = $(shell ls *.tex | sed 's/\.tex/.html/')
PDF  = $(shell ls *.tex | sed 's/\.tex/.pdf/')

all: $(HTML) #$(PDF)

pdf: $(PDF)

%.html : %.tex
	grep ^%SCRIPT $< | cut -c9- | sh
	@./.process_verbatims $<
	./.latextoh5 < $< > $@

%.pdf : %.tex %.html .header.tex .footer.tex
	cat .header.tex $< .footer.tex | ./.pdflatexfilter > $@

clean :
	$(RM) $(HTML) $(PDF) canvas *.png *.tiff *.g o/*.png
