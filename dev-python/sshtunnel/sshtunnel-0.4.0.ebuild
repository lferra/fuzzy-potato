# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Pure Python SSH tunnels"
HOMEPAGE="https://pypi.org/project/sshtunnel/"
SRC_URI="mirror://pypi/s/sshtunnel/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm x86"

RESTRICT="test"

RDEPEND="dev-python/paramiko[${PYTHON_USEDEP}]"
