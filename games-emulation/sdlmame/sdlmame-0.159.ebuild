# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/sdlmame/sdlmame-0.149.ebuild,v 1.1 2013/06/26 13:14:28 hasufell Exp $

EAPI=5
PYTHON_COMPAT=( python2_6 python2_7 )
inherit eutils flag-o-matic python-any-r1 games

MY_ZIP="mame0159s.zip"

DESCRIPTION="Multiple Arcade Machine Emulator (SDL)"

HOMEPAGE="http://mamedev.org/"

RESTRICT="mirror"

SRC_URI="http://mamedev.org/downloader.php?file=releases/${MY_ZIP}"
if [[ ${PN} == "sdlmame" ]] ; then
	SRC_URI="$SRC_URI http://www.netswarm.net/misc/sdlmame-ui.bdf.gz"
fi


LICENSE="XMAME"
SLOT="0"
KEYWORDS="amd64 ~ppc ~x86"
IUSE="X alsa debug opengl"
REQUIRED_USE="debug? ( X )"

RDEPEND="dev-libs/expat
	media-libs/fontconfig
	media-libs/flac
	>=media-libs/libsdl2-2.0.3[sound,joystick,opengl?,video]
	media-libs/sdl-ttf
	sys-libs/zlib
	virtual/jpeg
	alsa? ( media-libs/alsa-lib )
	debug? (
		>=dev-qt/qtgui-4.7
	)
	X? (
		x11-libs/libX11
		x11-libs/libXinerama
	)"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	app-arch/unzip
	virtual/pkgconfig
	X? ( x11-proto/xineramaproto )"

S=${WORKDIR}

# Function to disable a makefile option
disable_feature() {
	sed -i \
		-e "/$1.*=/s:^:# :" \
		"${S}"/${2:-makefile} \
		|| die "sed failed"
}

# Function to enable a makefile option
enable_feature() {
	sed -i \
		-e "/^#.*$1.*=/s:^#::"  \
		"${S}"/${2:-makefile} \
		|| die "sed failed"
}

pkg_setup() {
	games_pkg_setup
	python-any-r1_pkg_setup
}

src_unpack() {
	default
	unpack ./mame.zip
	rm -f mame.zip
}

src_prepare() {
	edos2unix makefile src/osd/sdl/{osdsdl.h,sdl.mak}

	epatch \
		"${FILESDIR}"/${P}-QA.patch \
		"${FILESDIR}"/${P}-debugger-linking.patch \
		"${FILESDIR}"/${P}-sdl_ttf.patch

	# Don't compile zlib and expat
	einfo "Disabling embedded libraries: expat, flac, jpeg, zlib"
	disable_feature BUILD_EXPAT
	disable_feature BUILD_FLAC
	disable_feature BUILD_JPEG
	disable_feature BUILD_ZLIB

	if use amd64; then
		einfo "Enabling 64-bit support"
		enable_feature PTR64
	fi

	if use ppc; then
		einfo "Enabling PPC support"
		enable_feature BIGENDIAN
	fi

	if use debug; then
		einfo "Enabling debug support"
		enable_feature DEBUG
		enable_feature DEBUG src/osd/sdl/sdl.mak
	fi

	enable_feature NO_USE_QTDEBUG src/osd/sdl/sdl.mak

	if ! use opengl ; then
		einfo "Disabling opengl support"
		enable_feature NO_OPENGL src/osd/sdl/sdl.mak
	fi

	if ! use alsa ; then
		einfo "Disabling alsa midi support"
		enable_feature NO_USE_MIDI src/osd/sdl/sdl.mak
	fi

	if ! use X ; then
		einfo "Disabling X support"
		enable_feature NO_X11 src/osd/sdl/sdl.mak
	fi
}

src_compile() {
	emake \
		PYTHON=python2
		TARGET="${PN#sdl}" \
		NAME="${PN}" \
		OPT_FLAGS='-DINI_PATH=\"\$$HOME/.'${PN}'\;'"${GAMES_SYSCONFDIR}/${PN}"'\"' \
		NO_DEBUGGER=$(usex debug "0" "1") default
}

src_install() {
	newgamesbin ${PN#sdl}$(use amd64 && echo 64)$(use debug && echo d) ${PN}

	newman src/osd/sdl/man/${PN#sdl}.6 ${PN}.6

	insinto "${GAMES_DATADIR}/${PN}"
	doins -r src/osd/sdl/keymaps
	[[ ${PN} == "sdlmame" ]] && newins sdlmame-ui.bdf ui.bdf

	insinto "${GAMES_SYSCONFDIR}/${PN}"
	doins "${FILESDIR}"/vector.ini

	sed \
		-e "s:@GAMES_SYSCONFDIR@:${GAMES_SYSCONFDIR}:" \
		-e "s:@GAMES_DATADIR@:${GAMES_DATADIR}:" \
		"${FILESDIR}/${PN/sdl}-${PV}".ini.in > "${D}/${GAMES_SYSCONFDIR}/${PN}/${PN/sdl}.ini" \
		|| die "sed failed"

	dodoc docs/{config,mame,newvideo}.txt
	if [[ ${PN} == "sdlmame" ]] ; then
		dodoc whatsnew*.txt
	else
		dodoc messnew*.txt
	fi

	keepdir \
		"${GAMES_DATADIR}/${PN}"/{ctrlr,cheats,roms,samples,artwork,crosshair} \
		"${GAMES_SYSCONFDIR}/${PN}"/{ctrlr,cheats}

	prepgamesdirs
}

pkg_postinst() {
	games_pkg_postinst

	elog "optional dependencies:"
	elog "  games-emulation/sdlmametools (development tools)"
	echo
	elog "It's strongly recommended that you change either the system-wide"
	elog "${MY_CONF_PN}.ini at \"${GAMES_SYSCONFDIR}/${PN}\" or use a per-user setup at \$HOME/.${PN}"

	if use opengl; then
		echo
		elog "You built ${PN} with opengl support and should set"
		elog "\"video\" to \"opengl\" in ${MY_CONF_PN}.ini to take advantage of that"
	fi
}

