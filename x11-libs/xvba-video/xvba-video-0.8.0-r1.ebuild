# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-libs/xvba-video/xvba-video-0.8.0-r1.ebuild,v 1.7 2013/09/05 19:44:48 mgorny Exp $

EAPI=5

EGIT_REPO_URI="git://anongit.freedesktop.org/vaapi/xvba-driver"
[[ ${PV} = 9999 ]] && inherit git-2
PYTHON_COMPAT=( python{2_6,2_7} )
inherit eutils autotools python-any-r1

DESCRIPTION="XVBA Backend for Video Acceleration (VA) API"
HOMEPAGE="http://www.freedesktop.org/wiki/Software/vaapi"
SRC_URI="http://dev.gentooexperimental.org/~scarabeus/xvba-driver-${PV}.tar.bz2"
# No source release yet, the src_uri is theoretical at best right now
#[[ ${PV} = 9999 ]] || SRC_URI="http://www.freedesktop.org/software/vaapi/releases/${PN}/${P}.tar.bz2"

LICENSE="GPL-2+ MIT"
SLOT="0"
# newline is needed for broken ekeyword
[[ ${PV} = 9999 ]] || \
KEYWORDS="amd64 x86"
IUSE="debug opengl"

RDEPEND="
	x11-libs/libva[X(+),opengl?]
	x11-libs/libvdpau
	x11-drivers/ati-drivers
"
DEPEND="${DEPEND}
	${PYTHON_DEPS}
	virtual/pkgconfig"

DOCS=( NEWS README AUTHORS )

S="${WORKDIR}/xvba-driver-${PV}"

pkg_setup() {
	python-any-r1_pkg_setup
}

src_prepare() {
	epatch \
		"${FILESDIR}"/${PN}-fix-mesa-gl.h.patch
	eautoreconf
	epatch_user
}

src_configure() {
	econf \
		$(use_enable debug) \
		$(use_enable opengl glx)
}

src_install() {
	default
	prune_libtool_files --all
}
