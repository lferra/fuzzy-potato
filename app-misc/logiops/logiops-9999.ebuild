# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="This is an unofficial driver for Logitech mice and keyboard."
HOMEPAGE="https://github.com/PixlOne/logiops"
EGIT_REPO_URI="https://github.com/PixlOne/logiops.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="examples"

DEPEND="dev-libs/libconfig"
#BDEPEND="virtual/pkgconfig"

S="${WORKDIR}/${PN}-${PV}"

src_configure() {
	cmake_src_configure
}

#src_install() {
#        dobin logid
#}
