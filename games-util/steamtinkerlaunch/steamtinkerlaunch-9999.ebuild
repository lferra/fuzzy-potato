# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
 
EAPI=7
DESCRIPTION="Linux wrapper tool for use with the Steam client which allows to customize and start tools and options for games quickly on the fly"
HOMEPAGE="https://github.com/frostworx/steamtinkerlaunch"
SRC_URI="https://raw.githubusercontent.com/frostworx/steamtinkerlaunch/master/stl"

LICENSE="GPL3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# dep gnome-extra/zenity substituted for gnome-extra/yad, see docs
DEPEND="
        app-shells/bash
        dev-vcs/git
        sys-process/procps
        app-arch/unzip
        net-misc/wget
        sys-apps/which
        x11-misc/wmctrl
        x11-misc/xdotool
        x11-apps/xprop
        x11-apps/xrandr
        x11-apps/xwininfo
        gnome-extra/zenity
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

src_unpack(){
	cp ${DISTDIR}/stl ${S}
}

src_install(){
	exeinto /usr/bin
	doexe  stl
}
