-include .arcaderc
GAMESRC ?= $(ARCADE)/www

HTMLFILES=$(patsubst %.md,%.html,$(wildcard $(GAMESRC)/*.md $(GAMESRC)/*/*.md))

FILES := robots.txt 404.html index.html $(wildcard css/*) $(wildcard img/*) $(HTMLFILES)

all: $(HTMLFILES)

%.html: %.md
	cat $(ARCADE)/www/header.html > $@
	markdown $< >> $@
	cat $(ARCADE)/www/footer.html >> $@

%.sync: %
	@mkdir -p $(dir staging/$<)
	cp $< staging/$<

.PHONY: sync
sync: $(addsuffix .sync,$(FILES))
	aws s3 sync --acl public-read staging s3://century-arcade.org/

clean:
	rm -f $(HTMLFILES)
	rm -rf staging/
