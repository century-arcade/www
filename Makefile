-include .arcaderc

WWWSRC ?= $(ARCADE)/www

-include $(WWWSRC)/BUILD

MD_FILES ?= $(shell find $(WWWSRC) -name '*.md')
ZIP_FILES ?= $(shell find $(WWWSRC) -name '*.zip')
HTML_FILES += $(MD_FILES:.md=.html)
STAGING = $(WWWSRC)/staging

all: $(HTML_FILES)

%.html: %.md
	cat $(ARCADE)/www/header.html > $@
	markdown $< >> $@
	cat $(ARCADE)/www/footer.html >> $@

BOILERPLATE :=        \
	robots.txt        \
	404.html          \
	index.html        \
	css/ img/


FILES := $(HTML_FILES)  \
	     $(ZIP_FILES)   \

staging: $(addsuffix .staged,$(FILES))
	cp -R $(BOILERPLATE) $(STAGING)/

%.staged: %
	mkdir -p $(STAGING)/$(dir $(@:$(WWWSRC)/%=%))
	cp $* $(STAGING)/$(*:$(WWWSRC)/%=%)

.PHONY: sync
sync: staging
	aws s3 sync --acl public-read $(STAGING) s3://century-arcade.org/

clean:
	rm -f $(HTML_FILES)
	rm -rf $(STAGING)
