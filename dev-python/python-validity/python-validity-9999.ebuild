# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
EGIT_REPO_URI="https://github.com/uunicorn/python-validity.git"

inherit git-r3 distutils-r1 systemd

DESCRIPTION="python-validity"
HOMEPAGE="https://github.com/uunicorn/python-validity"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~ppc ~ppc64 ~sparc ~x86"

DEPEND=">=dev-python/cryptography-2.1.4
>=dev-python/pyusb-1.0.0
>dev-python/pyyaml-3.12
app-arch/innoextract"

#PATCHES=( ${FILESDIR}/${PN}-0.8.2-fix-implicit-declaration.patch )

S="${WORKDIR}/${PN}-${PV}"

python_install_all() {
        distutils-r1_python_install_all
}
