# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN}2-${PV}"
inherit desktop qmake-utils xdg-utils

DESCRIPTION="Tool to render 3D fractals"
HOMEPAGE="https://www.mandelbulber.com"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"

LICENSE="CC-BY-4.0 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="joystick opencl openexr sndfile tiff"

BDEPEND="
	virtual/pkgconfig
"
RDEPEND="
	dev-libs/lzo
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5
	dev-qt/qttest:5
	dev-qt/qtwidgets:5
	media-libs/libpng:0=
	sci-libs/gsl:=
	joystick? ( dev-qt/qtgamepad:5 )
	opencl? (
		dev-libs/clhpp
		virtual/opencl
	)
	openexr? (
		media-libs/ilmbase:=
		media-libs/openexr:=
	)
	sndfile? ( media-libs/libsndfile )
	tiff? ( media-libs/tiff:0 )
"
DEPEND="${RDEPEND}
	dev-qt/designer:5
"

S=${WORKDIR}/${MY_P}

src_prepare() {
	default

	use joystick || sed -i -e "s/qtHaveModule(gamepad)/false/" makefiles/common.pri || die
	use openexr || sed -i -e "s/packagesExist(IlmBase)/false/" makefiles/common.pri || die
	use sndfile || sed -i -e "s/packagesExist(sndfile)/false/" makefiles/common.pri || die
	use tiff || sed -i -e "s/packagesExist(libtiff-4)/false/" makefiles/common.pri || die
}

src_configure() {
	if use opencl; then
		eqmake5 makefiles/${PN}-opencl.pro
	else
		eqmake5 makefiles/${PN}.pro
	fi
}

src_install() {
	dobin ${PN}2

	dodoc README NEWS usr/share/doc/${PN}2/Mandelbulber_Manual.pdf

	insinto /usr/share/${PN}2
	doins -r usr/share/${PN}2/*

	insinto /usr/share/applications
	doins ${PN}2.desktop

	newicon -s 256 qt/icons/${PN}.png ${PN}2.png
}
