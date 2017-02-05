
CHAPTERS := Header.yml \
			Introduction.md \
			Chance.md \
			Necessity.md \
			Not-by-genes-alone.md \
			The-cradle.md \
			The-ice.md \
			After-the-ice.md \
			Looking-ahead.md \
			References.md


SOURCE_CHAPTERS := $(foreach chapter,$(CHAPTERS),chapters/$(chapter))


PANDOC := pandoc

PANDOC_OPTS_ALL :=  -S --toc --smart \
					--top-level-division=chapter \
					--filter pandoc-citeproc

PANDOC_PDF_OPTS := $(PANDOC_OPTS_ALL) \
					--default-image-extension=pdf \
					--variable links-as-notes \
					--variable documentclass=scrbook \
					--variable=geometry:b5paper


PANDOC_EPUB_OPTS := $(PANDOC_OPTS_ALL) \
					--default-image-extension=png \
					-t epub3 --toc-depth=1 \
					--epub-cover-image=cover.png

book.pdf: $(SOURCE_CHAPTERS) Makefile
	$(PANDOC) $(PANDOC_PDF_OPTS) -o $@ $(SOURCE_CHAPTERS)

book.epub: $(CHAPTERS) Makefile
	$(PANDOC) $(PANDOC_EPUB_OPTS) -o $@ $(SOURCE_CHAPTERS)

book.mobi: book.epub
	./kindlegen book.epub -o book.mobi

all: book.pdf book.epub book.mobi

clean:
	rm book.pdf book.epub book.mobi
