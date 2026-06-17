SUBDIRS = fonts icons themes wallpapers other

install-data-hook:
	@echo "=========================================================="
	@echo " Updating icon caches..."
	-gtk-update-icon-cache -qf $(DESTDIR)$(datadir)/icons/Cupertino
	@echo " Cupertino Theme installed successfully!"
	@echo " You may need to restart your Appearance settings"
	@echo " to see the new theme in the list."
	@echo "=========================================================="
