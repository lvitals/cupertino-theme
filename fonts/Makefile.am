fontsdir = $(datadir)/fonts/TTF

fonts_DATA = \
	Sao-Paulo-Bold.ttf \
	Sao-Paulo-BoldItalic.ttf \
	Sao-Paulo-Italic.ttf \
	Sao-Paulo-Light.ttf \
	Sao-Paulo-LightItalic.ttf \
	Sao-Paulo-Regular.ttf \
	Sao-Paulo-Thin.ttf \
	Sao-Paulo-ThinItalic.ttf \
	Sao-Paulo-Compact-Bold.ttf \
	Sao-Paulo-Compact-BoldItalic.ttf \
	Sao-Paulo-Compact-Italic.ttf \
	Sao-Paulo-Compact-Regular.ttf \
	Sao-Paulo-Mono-Regular.ttf \
	Sao-Paulo-Mono-Bold.ttf \
	Sao-Paulo-Mono-BoldItalic.ttf \
	Sao-Paulo-Mono-Italic.ttf

install-data-hook:
	fc-cache -f $(DESTDIR)$(fontsdir)

EXTRA_DIST = $(fonts_DATA)
