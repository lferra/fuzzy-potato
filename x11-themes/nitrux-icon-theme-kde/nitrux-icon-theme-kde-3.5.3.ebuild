# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

MY_PN="nitrux"

DESCRIPTION="Part of The Nitrux Artwork Project and was created to be used in the upcoming NITRUX OS"
HOMEPAGE="http://deviantn7k1.deviantart.com/art/Nitrux-293634207"
SRC_URI="http://store.nitrux.in/files/NITRUX.tar.gz -> ${P}.tar.gz"
LICENSE="CCPL-Attribution-ShareAlike-NonCommercial-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="binchecks strip"

S=${WORKDIR}

src_unpack() {
        unpack ${PN}-${PV}.tar.gz
}

src_compile() {
        emake index.theme
}


#src_install() {
#	insopts -m644
#	diropts -m755
#	insinto /usr/share/icons/
#	doins -r NITRUX
#}
