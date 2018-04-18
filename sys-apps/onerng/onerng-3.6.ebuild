# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit udev

DESCRIPTION="OneRNG - Hardware Random Number Generator"
HOMEPAGE="http://onerng.info"
SRC_URI="https://github.com/OneRNG/onerng.github.io/raw/master/sw/onerng_${PV}.orig.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"

S="${WORKDIR}/${PN}_${PV}"

DEPEND="virtual/udev"
RDEPEND="${DEPEND}
	sys-apps/rng-tools
	dev-python/python-gnupg
	dev-libs/openssl
	sys-process/at"

src_configure() {
	econf --with-rulesdir="$(get_udevdir)"/rules.d
}

src_install() {
	default
	udev_reload
}
