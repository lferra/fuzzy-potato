# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson udev git-r3

DESCRIPTION="fprintd-clients"
HOMEPAGE="https://cgit.freedesktop.org/libfprint/libfprint/ https://github.com/freedesktop/libfprint https://gitlab.freedesktop.org/libfprint/libfprint"
#SRC_URI="https://gitlab.freedesktop.org/libfprint/libfprint/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://gitlab.freedesktop.org/uunicorn/fprintd.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

#PATCHES=( ${FILESDIR}/${PN}-0.8.2-fix-implicit-declaration.patch )

S="${WORKDIR}/${PN}-${PV}"

#src_configure() {
#		local emesonargs=(
#			-Ddoc=false
#			-Dgtk-examples=$(usex examples true false)
#			-Ddrivers=all
#			-Dudev_rules=true
#			-Dudev_rules_dir=$(get_udevdir)/rules.d
#			--libdir=/usr/$(get_libdir)
#		)
#		meson_src_configure
#}
