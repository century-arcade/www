HTMLFILES=$(patsubst %.md,%.html,$(wildcard */*.md *.md))

FILES := robots.txt 404.html index.html $(wildcard css/*) $(wildcard img/*) $(HTMLFILES)

all: $(HTMLFILES)

%.html: %.md
	cat header.html > $@
	markdown $< >> $@
	cat footer.html >> $@

%.sync: %
	@mkdir -p $(dir staging/$<)
	cp $< staging/$<

.PHONY: sync
sync: $(addsuffix .sync,$(FILES))
	aws s3 sync --acl public-read staging s3://www.century-arcade.org/

clean:
	rm -f $(HTMLFILES)
	rm -rf staging/
