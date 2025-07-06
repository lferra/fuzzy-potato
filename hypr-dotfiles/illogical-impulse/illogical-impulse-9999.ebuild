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
	media-sound/cava
	media-sound/pavucontrol-qt
	media-video/wireplumber:*
	dev-libs/libdbusmenu[gtk3]
	media-sound/playerctl
"

RDEPEND_BACKLIGHT="
	x11-misc/gammastep
	app-misc/geoclue
	app-misc/brightnessctl
	app-misc/ddcutil:=
"

RDEPEND_BASIC="
	net-misc/axel
	sys-devel/bc
	sys-apps/coreutils
	app-misc/cliphist
	dev-build/cmake
	net-misc/curl
	net-misc/rsync
	net-misc/wget
	sys-apps/ripgrep
	app-misc/jq
	dev-build/meson
	x11-misc/xdg-user-dirs
"

# TODO: Readex Pro, Material Design icons, Rubik, Gabarito
RDEPEND_FONTS_THEMES="
	x11-themes/adw-gtk3
	kde-misc/darkly
	sys-apps/eza
	app-shells/fish
	media-libs/fontconfig:1.0
	x11-terms/kitty
	app-shells/starship
	media-fonts/nerd-fonts
"

RDEPEND_HYPRLAND="
	gui-libs/hyprutils
	gui-apps/hyprpicker
	dev-libs/hyprlang
	gui-apps/hypridle
	gui-libs/hyprland-qt-support
	gui-libs/hyprland-qt-support
	gui-apps/hyprlock
	gui-libs/hyprcursor
	dev-util/hyprwayland-scanner
	gui-wm/hyprland
	gui-libs/xdg-desktop-portal-hyprland
	gui-apps/wl-clipboard
"

RDEPEND_KDE="
	kde-plasma/bluedevil
	gnome-base/gnome-keyring
	net-misc/networkmanager
	kde-plasma/plasma-nm
	kde-plasma/polkit-kde-agent
	kde-apps/dolphin
	kde-plasma/systemsettings
"

RDEPEND_MICROTEX="
	dev-libs/tinyxml2
	dev-cpp/gtkmm:3.0
	dev-cpp/gtksourceviewmm
	dev-cpp/cairomm
"

RDEPEND_PORTAL="
	sys-apps/xdg-desktop-portal
	kde-plasma/xdg-desktop-portal-kde
	sys-apps/xdg-desktop-portal-gtk
	gui-libs/xdg-desktop-portal-hyprland
"

RDEPEND_PYTHON="
	llvm-core/clang
	dev-python/uv
	gui-libs/gtk
	gui-libs/libadwaita
	net-libs/libsoup:3.0
	dev-libs/libportal
	dev-libs/gobject-introspection
	dev-lang/sassc
	media-libs/opencv[python]
"

RDEPEND_SCREENCAPTURE="
	gui-apps/hyprshot
	gui-apps/slurp
	gui-apps/swappy
	app-text/tesseract:*
	gui-apps/wf-recorder
"

RDEPEND_TOOLKIT="
	kde-apps/kdialog
	dev-qt/qt5compat:6
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	dev-qt/qtimageformats:6
	dev-qt/qtmultimedia:6
	dev-qt/qtpositioning:6
	dev-qt/qtquicktimeline:6
	dev-qt/qtsensors:6
	dev-qt/qtsvg:6
	dev-qt/qttools:6
	dev-qt/qttranslations:6
	dev-qt/qtvirtualkeyboard:6
	dev-qt/qtwayland:6
	kde-frameworks/syntax-highlighting:6
	sys-power/upower
	gui-apps/wtype
	x11-misc/ydotool
"

RDEPEND_WIDGETS="
	gui-apps/fuzzel
	dev-libs/glib
	gui-apps/hypridle
	gui-libs/hyprutils
	gui-apps/hyprlock
	gui-apps/hyprpicker
	gui-apps/quickshell
	gui-apps/swww
	app-i18n/translate-shell
	gui-apps/wlogout
"

# TODO: microtex, oneui4-icons
RDEPEND="
	${RDEPEND_AUDIO}
	${RDEPEND_BACKLIGHT}
	${RDEPEND_BASIC}
	x11-themes/bibata-xcursors
	${RDEPEND_FONTS_THEMES}
	${RDEPEND_HYPRLAND}
	${RDEPEND_KDE}
	${RDEPEND_MICROTEX}
	${RDEPEND_PORTAL}
	${RDEPEND_PYTHON}
	${RDEPEND_SCREENCAPTURE}
	${RDEPEND_TOOLKIT}
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
