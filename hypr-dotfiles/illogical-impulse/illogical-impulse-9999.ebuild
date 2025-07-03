# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Modern, feature-rich and accessible desktop configuration"
HOMEPAGE="https://end-4.github.io/dots-hyprland-wiki/en/"
EGIT_REPO_URI="https://github.com/end-4/dots-hyprland.git"
LICENSE="GPL-3+"
SLOT="0"

RDEPEND_AUDIO="
	dev-libs/libdbusmenu[gtk3]
	gui-apps/swww
	media-sound/pavucontrol
	media-sound/playerctl
	media-video/wireplumber:*
"

RDEPEND_BACKLIGHT="
	app-misc/brightnessctl
	app-misc/ddcutil:=
"

RDEPEND_BASIC="
	app-misc/cliphist
	app-misc/jq
	dev-build/cmake
	dev-build/meson
	dev-lang/typescript
	dev-libs/gjs
	gui-apps/fuzzel
	net-libs/nodejs:*[npm]
	net-misc/axel
	sys-apps/ripgrep
	sys-devel/bc
	x11-misc/xdg-user-dirs
"

# TODO: Readex Pro, Material Design icons, Rubik, Gabarito
RDEPEND_FONTS="
	app-shells/fish
	app-shells/starship
	dev-qt/qtwayland:5
	gui-apps/foot
	media-fonts/nerdfonts
	media-libs/fontconfig:1.0
	x11-misc/qt5ct
	x11-themes/adw-gtk3
"

# TODO: blueberry
RDEPEND_GNOME="
	gnome-base/gnome-control-center:2
	gnome-base/gnome-keyring
	gnome-extra/polkit-gnome
	net-misc/networkmanager
	net-wireless/gnome-bluetooth:3
	x11-misc/gammastep
"

RDEPEND_GTK="
	dev-libs/gobject-introspection
	gui-apps/yad
	gui-libs/gdk-pixbuf-loader-webp
	gui-libs/gtk-layer-shell
	sys-power/upower
	x11-libs/gtk+:3
	x11-libs/gtksourceview:3.0
	x11-misc/xdg-user-dirs-gtk
	x11-misc/ydotool
"

RDEPEND_PORTAL="
	sys-apps/xdg-desktop-portal
	sys-apps/xdg-desktop-portal-gtk
	sys-apps/xdg-desktop-portal-hyprland
"

# TODO: materialyoucolor
RDEPEND_PYMYC="
	dev-python/libsass
	dev-python/material-color-utilities
	gui-apps/gradience
"

RDEPEND_PYTHON="
	dev-python/build
	dev-python/pillow
	dev-python/setuptools-scm
	dev-python/wheel
	x11-misc/pywal
"

RDEPEND_SCREENCAPTURE="
	app-text/tesseract:*
	gui-apps/grim
	gui-apps/slurp
	gui-apps/swappy
	gui-apps/wf-recorder
"

# TODO: anyrun
RDEPEND_WIDGETS="
	dev-python/psutil
	dev-python/pywayland
	dev-ruby/sass:3.7
	gui-apps/wl-clipboard
	gui-apps/wlogout
	gui-libs/hyprutils
	hypr-apps/hypridle
	hypr-apps/hyprlock
	hypr-apps/hyprpicker
"

# TODO: microtex, oneui4-icons
RDEPEND="
	gui-apps/ags
	${RDEPEND_AUDIO}
	${RDEPEND_BACKLIGHT}
	${RDEPEND_BASIC}
	x11-themes/bibata-xcursors
	${RDEPEND_FONTS}
	${RDEPEND_GNOME}
	${RDEPEND_GTK}
	${RDEPEND_PORTAL}
	${RDEPEND_PYMYC}
	${RDEPEND_PYTHON}
	${RDEPEND_SCREENCAPTURE}
	${RDEPEND_WIDGETS}
"

DOCS=(
	CONTRIBUTING.md
	README.md
)

src_install() {
	einstalldocs

	insinto /etc/eselect/hypr-dotfiles/configs/illogical-impulse/etc
	doins -r Extras/swaylock

	insinto /etc/eselect/hypr-dotfiles/configs/illogical-impulse/home
	doins -r .config .local

	insinto /
	doins -r "Extras/gnome-text-editor themes (Paste to root)/usr"
}
