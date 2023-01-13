install:
	mkdir -p ~/.themes
	cp -Rf . ~/.themes/adw-gtk3-dark-custom

use:
	gsettings set org.gnome.desktop.interface gtk-theme "Adw-gtk3-dark-custom"	
	gsettings set org.gnome.desktop.wm.preferences theme "Adw-gtk3-dark-custom"
