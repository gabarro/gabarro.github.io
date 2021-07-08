HTML = $(shell ls *.tex | sed 's/\.tex/.html/')
PDF  = $(shell ls *.tex | sed 's/\.tex/.pdf/')

all: $(HTML) $(PDF)

pdf: $(PDF)

%.html : %.tex
	grep ^%SCRIPT $< | cut -c9- | bash
	@./.process_verbatims $<
	./.latex_to_html5 < $< > $@

%.pdf : %.tex %.html .header.tex .footer.tex
	cat .header.tex $< .footer.tex | ./.pdflatexfilter > $@

%.dvi : %.tex %.html .header.tex .footer.tex
	cat .header.tex $< .footer.tex | ./.dvilatexfilter > $@

clean :
	$(RM) $(HTML) $(PDF) canvas *.png *.tiff *.g *.txt o/*.png
