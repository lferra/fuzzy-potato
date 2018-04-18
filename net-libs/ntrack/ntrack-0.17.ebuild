# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools-utils

MY_PV="${PV/./}"

DESCRIPTION="A lightweight library for getting events on network online status changes"
HOMEPAGE="https://launchpad.net/ntrack"
SRC_URI="http://launchpad.net/${PN}/main/${MY_PV}/+download/ntrack-${MY_PV}.tar.gz"

LICENSE="|| ( GPL-3 LGPL-3 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="glib +libnl rtnetlink qt4"

RDEPEND="libnl? ( dev-libs/libnl )
	glib? ( dev-libs/glib:2 )
	qt4? ( dev-qt/qtcore:4 )"
DEPEND="rtnetlink? ( >=sys-kernel/linux-headers-2.6 )
	${RDEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

DOCS=( "AUTHORS" "NEWS" "README" )

PATCHES=( "${FILESDIR}/${PN}-0.14-docs.patch"
	"${FILESDIR}/${P}-no-werror.patch"
	#"${FILESDIR}/${P}-fix-ftbfs-nl_object_ops.patch"
	)

REQUIRED_USE="|| ( glib qt4 )
	|| ( libnl rtnetlink )"

src_prepare() {
	autotools-utils_src_prepare

	# eautoreconf breaks, so let's use this instead
	sh autogen.sh
}

src_configure() {
	local mybackend

	if use libnl && use rtnetlink;
	then
		mybackend="libnl,rtnetlink"
	else
		use libnl && mybackend="libnl"
		use rtnetlink && mybackend="rtnetlink"
	fi

	local myeconfargs=(
		$(use_with glib glib2)
		$(use_with qt4)
		--enable-backend=${mybackend}
		--without-gobject
		--without-pygobject
	)

	autotools-utils_src_configure
}
