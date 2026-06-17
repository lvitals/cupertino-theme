themedir = $(datadir)/themes

# All variants
THEMES = Cupertino-Dark \
	Cupertino-Dark-solid \
	Cupertino-Light \
	Cupertino-Light-solid

install-data-local:
	mkdir -p $(DESTDIR)$(themedir)
	for t in $(THEMES); do \
		cp -prL $$t $(DESTDIR)$(themedir); \
	done
	rm -rf $(DESTDIR)$(themedir)/Cupertino
	ln -sf Cupertino-Light $(DESTDIR)$(themedir)/Cupertino
	@if [ "$(prefix)" = "$(HOME)/.local" ]; then \
		mkdir -p $(HOME)/.themes; \
		for t in $(THEMES); do \
			ln -sf $(DESTDIR)$(themedir)/$$t $(HOME)/.themes/; \
		done; \
		ln -sf $(DESTDIR)$(themedir)/Cupertino $(HOME)/.themes/; \
	fi

uninstall-local:
	for t in $(THEMES); do \
		rm -rf $(DESTDIR)$(themedir)/$$t; \
	done
	rm -rf $(DESTDIR)$(themedir)/Cupertino

EXTRA_DIST = $(THEMES)
DISTCLEANFILES = $(foreach t,$(THEMES),$(t)/index.theme)
