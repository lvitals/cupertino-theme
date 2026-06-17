icondir = $(datadir)/icons

# All variants
ICONS = Cupertino \
	Cupertino-blue \
	Cupertino-blue-dark \
	Cupertino-blue-light \
	Cupertino-dark \
	Cupertino-green \
	Cupertino-green-dark \
	Cupertino-green-light \
	Cupertino-grey \
	Cupertino-grey-dark \
	Cupertino-grey-light \
	Cupertino-light \
	Cupertino-nord \
	Cupertino-nord-dark \
	Cupertino-nord-light \
	Cupertino-orange \
	Cupertino-orange-dark \
	Cupertino-orange-light \
	Cupertino-purple \
	Cupertino-purple-dark \
	Cupertino-purple-light \
	Cupertino-red \
	Cupertino-red-dark \
	Cupertino-red-light \
	Cupertino-yellow \
	Cupertino-yellow-dark \
	Cupertino-yellow-light

install-data-local:
	mkdir -p $(DESTDIR)$(icondir)
	for icon in $(ICONS); do \
		cp -pr $$icon $(DESTDIR)$(icondir); \
	done
	@if [ "$(prefix)" = "$(HOME)/.local" ]; then \
		mkdir -p $(HOME)/.icons; \
		for icon in $(ICONS); do \
			ln -sf $(DESTDIR)$(icondir)/$$icon $(HOME)/.icons/; \
		done \
	fi

install-data-hook:
	if test -n "$(GTK_UPDATE_ICON_CACHE)"; then \
		for icon in $(ICONS); do \
			$(GTK_UPDATE_ICON_CACHE) -qf $(DESTDIR)$(icondir)/$$icon; \
		done \
	fi

uninstall-local:
	for icon in $(ICONS); do \
		rm -rf $(DESTDIR)$(icondir)/$$icon; \
	done

EXTRA_DIST = $(ICONS)
