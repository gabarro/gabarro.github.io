PFLAGS = -N -s#--toc


HTML = $(shell ls *.tex | sed 's/\.tex/.html/')
PDF  = $(shell ls *.tex | sed 's/\.tex/.pdf/')

all: $(HTML) #$(PDF)

pdf: $(PDF)


%.html : %.tex
	grep ^%SCRIPT $< | cut -c9- | sh
	@./.process_verbatims $<
	pandoc $(PFLAGS) -H .css $< --mathjax -t html | sed -f .htmlclean > $@

%.pdf : %.tex %.html
	pandoc $(PFLAGS) -H .dpi $< -o $@

clean :
	$(RM) $(HTML) $(PDF) canvas *.png *.tiff o/*.png



# alternative way to produce pdf files, by running latex directly
u/%.pdf : %.tex %.html .header.tex .footer.tex
	cat .header.tex $< .footer.tex | ./.pdflatexfilter > $@
