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
	@if [ "$(MENU_LOGO)" != "apple" ]; then \
		echo "Applying menu logo: $(MENU_LOGO)"; \
		if [ "$(MENU_LOGO)" = "mate" ]; then \
			LOGO_SOURCE="apps/symbolic/mate-desktop-symbolic.svg"; \
			SYMBOLIC_SOURCE="apps/symbolic/mate-desktop-symbolic.svg"; \
		else \
			if [ -f "$(srcdir)/Cupertino/apps/scalable/distributor-logo-$(MENU_LOGO).svg" ]; then \
				LOGO_SOURCE="apps/scalable/distributor-logo-$(MENU_LOGO).svg"; \
				SYMBOLIC_SOURCE="apps/scalable/distributor-logo-$(MENU_LOGO).svg"; \
			elif [ -f "$(srcdir)/Cupertino/apps/scalable/distributor-logo-$(MENU_LOGO)linux.svg" ]; then \
				LOGO_SOURCE="apps/scalable/distributor-logo-$(MENU_LOGO)linux.svg"; \
				SYMBOLIC_SOURCE="apps/scalable/distributor-logo-$(MENU_LOGO)linux.svg"; \
			else \
				LOGO_SOURCE=""; \
			fi; \
		fi; \
		if [ -n "$$LOGO_SOURCE" ]; then \
			for theme in $(ICONS); do \
				DEST_THEME="$(DESTDIR)$(icondir)/$$theme"; \
				if echo "$$theme" | grep -q -- "-dark"; then \
					SRC_THEME="Cupertino-dark"; \
				else \
					SRC_THEME="Cupertino"; \
				fi; \
				if [ -f "$(DESTDIR)$(icondir)/$$SRC_THEME/$$LOGO_SOURCE" ]; then \
					LOGO_PATH="$(DESTDIR)$(icondir)/$$SRC_THEME/$$LOGO_SOURCE"; \
				else \
					LOGO_PATH="$(DESTDIR)$(icondir)/Cupertino/$$LOGO_SOURCE"; \
				fi; \
				if [ -f "$(DESTDIR)$(icondir)/$$SRC_THEME/$$SYMBOLIC_SOURCE" ]; then \
					SYMBOLIC_PATH="$(DESTDIR)$(icondir)/$$SRC_THEME/$$SYMBOLIC_SOURCE"; \
				else \
					SYMBOLIC_PATH="$(DESTDIR)$(icondir)/Cupertino/$$SYMBOLIC_SOURCE"; \
				fi; \
				find $$DEST_THEME -name "start-here.svg" -exec cp -f "$$LOGO_PATH" {} \;; \
				find $$DEST_THEME -name "start-here-symbolic.svg" -exec cp -f "$$SYMBOLIC_PATH" {} \;; \
			done; \
		else \
			echo "Warning: Logo source for $(MENU_LOGO) not found, keeping default."; \
		fi; \
	fi
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
