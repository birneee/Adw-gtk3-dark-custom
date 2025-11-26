PREFIX ?= ~/.themes
THEME_NAME = adw-gtk3-dark-custom
INSTALL_PATH = $(PREFIX)/$(THEME_NAME)

install:
	mkdir -p $(INSTALL_PATH)
	cp -Rf ./gnome-shell $(INSTALL_PATH)/gnome-shell
	cp -Rf ./gtk-3.0 $(INSTALL_PATH)/gtk-3.0
	cp -Rf ./index.theme $(INSTALL_PATH)/index.theme

use:
	gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-custom-dark"	
	gsettings set org.gnome.desktop.wm.preferences theme "adw-gtk3-custom-dark"

watch:
	watchexec -e css -- bash -c "make install"
