# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PLOCALES="ar cs de el es eu fa_IR fr gl he hi hr hu id ie it ko nb nl nn oc pt_BR ru sr sv tr uk zh_CN zh_TW"
inherit meson plocale xdg gnome2-utils
DESCRIPTION="gtk ebook reader built with gjs"
HOMEPAGE="https://github.com/johnfactotum/foliate/"
#SRC_URI="https://dev.gentoo.org/~grozin/${P}.tar.bz2"
SRC_URI="https://github.com/johnfactotum/${PN}/archive/refs/tags/${PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"

BDEPEND="${MESON_DEPEND}"
RDEPEND="dev-libs/gjs
	gui-libs/gtk
	>=gui-libs/libadwaita-1.7:=
	net-libs/webkit-gtk:6[introspection]
	sys-devel/gettext"

src_prepare() {
	default
	xdg_environment_reset

	plocale_find_changes "${S}"/po '' '.po'

	rm_po() {
		rm po/${1}.po
		sed -e "/^${1}/d" -i po/LINGUAS
	}

	plocale_for_each_disabled_locale rm_po
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postinst
	gnome2_schemas_update
}
