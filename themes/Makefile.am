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
	@if [ "$(prefix)" = "$(HOME)/.local" ]; then \
		mkdir -p $(HOME)/.themes; \
		for t in $(THEMES); do \
			ln -sf $(DESTDIR)$(themedir)/$$t $(HOME)/.themes/; \
		done; \
	fi

uninstall-local:
	for t in $(THEMES); do \
		rm -rf $(DESTDIR)$(themedir)/$$t; \
	done

EXTRA_DIST = $(THEMES)
DISTCLEANFILES = $(foreach t,$(THEMES),$(t)/index.theme)
