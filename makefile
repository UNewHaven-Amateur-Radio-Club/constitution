TEX_COMPILER := pdflatex

.PHONY: all
all: constitution bylaws

comb: all
	pdfunite constitution.pdf bylaws.pdf combined.pdf

clean:
	rm -r build

constitution: constitution.pdf

bylaws: bylaws.pdf

%.pdf: %.tex
	$(TEX_COMPILER) $<
	# do it twice, as bookmarks and whatnot need a second re-run
	$(TEX_COMPILER) $<

