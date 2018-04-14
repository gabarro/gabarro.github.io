HTML = $(shell ls *.tex | sed 's/\.tex/.html/')
PDF  = $(shell ls *.tex | sed 's/\.tex/.pdf/')

all: $(HTML) #$(PDF)

pdf: $(PDF)

%.html : %.tex
	grep ^%SCRIPT $< | cut -c9- | sh
	grep -q ^%RUN_VERBATIMS $< && cat $< | ./.getverbatims | sh || true
	pandoc $< -s --mathjax --quiet -t html -H .css | sed 's/lang=""//' > $@

%.pdf : %.tex %.html
	pandoc $< -s -o $@ -H .dpi

clean :
	$(RM) $(HTML) $(PDF) canvas *.png *.tiff o/*.png

