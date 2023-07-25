install:
	mkdir -p ~/.themes
	cp -Rf . ~/.themes/adw-gtk3-custom-dark

use:
	gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3-custom-dark"	
	gsettings set org.gnome.desktop.wm.preferences theme "adw-gtk3-custom-dark"

watch:
	watchexec -e css -- bash -c "make install"