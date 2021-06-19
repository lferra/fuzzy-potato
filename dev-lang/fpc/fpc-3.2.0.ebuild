# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit prefix toolchain-funcs

HOMEPAGE="https://www.freepascal.org/"
DESCRIPTION="Free Pascal Compiler"
FPCV="3.2.0"
SRC_URI="ftp://ftp.freepascal.org/pub/fpc/dist/3.2.0/source/fpc-${FPCV}.source.tar.gz
	ftp://ftp.freepascal.org/pub/fpc/beta/3.2.0-rc1/fpcbuild-${FPCV}.tar.gz
	amd64? ( ftp://ftp.freepascal.org/pub/fpc/dist/3.2.0/x86_64-linux/fpc-${FPCV}-x86_64-linux.tar )
	x86? ( ftp://ftp.freepascal.org/pub/fpc/dist/3.2.0/i386-linux/fpc-${FPCV}.i386-linux.tar )"

SLOT="0"
LICENSE="GPL-2 LGPL-2.1-with-linking-exception"
KEYWORDS="amd64 x86"
IUSE="doc source"

RESTRICT="strip" #269221

S=${WORKDIR}/fpcbuild-${FPCV}/fpcsrc

pkg_pretend() {
	if [[ ${MERGE_TYPE} != binary ]]; then
		# Bug 475210
		if $(tc-getLD) --version | grep -q "GNU gold"; then
			eerror "fpc does not function correctly when built with the gold linker."
			eerror "Please select the bfd linker with binutils-config."
			die "GNU gold detected"
		fi
	fi
}

src_unpack() {
	case ${ARCH} in
		amd64)	FPC_ARCH="x86_64"    PV_BIN="${FPCV}-" ;;
		x86)	FPC_ARCH="i386"      PV_BIN="${FPCV}." ;;
		*)	die "This ebuild doesn't support ${ARCH}." ;;
	esac

	unpack ${A}

	tar -xf ${PN}-${PV_BIN}${FPC_ARCH}-linux/binary.${FPC_ARCH}-linux.tar || die "Unpacking binary.${FPC_ARCH}-linux.tar failed!"
	tar -xzf base.${FPC_ARCH}-linux.tar.gz || die "Unpacking base.${FPC_ARCH}-linux.tar.gz failed!"
}

src_prepare() {
	default	
	PV_BIN="${FPCV}"

	find "${WORKDIR}" -name Makefile -exec sed -i -e 's/ -Xs / /g' {} + || die

	# let the pkg manager compress man files
	sed -i '/find man.* gzip /d' "${WORKDIR}"/fpcbuild-${PV_BIN}/install/man/Makefile || die

	# make the compiled binary check for fpc.cfg under the prefixed /etc/ path
	hprefixify "${WORKDIR}"/fpcbuild-${PV_BIN}/fpcsrc/compiler/options.pas
}

set_pp() {
	case ${ARCH} in
		amd64)	FPC_ARCH="x64" FPC_PARCH="x86_64" ;;
		x86)	FPC_ARCH="386" FPC_PARCH="i386" ;;
		*)	die "This ebuild doesn't support ${ARCH}." ;;
	esac

	case ${1} in
		bootstrap)	pp="${WORKDIR}"/lib/fpc/3.2.0/ppc${FPC_ARCH} ;;
		new) 	pp="${S}"/compiler/ppc${FPC_ARCH} ;;
		*)	die "set_pp: unknown argument: ${1}" ;;
	esac
}

src_compile() {
	local pp

	# Using the bootstrap compiler.
	set_pp bootstrap

	emake PP="${pp}" compiler_cycle AS="$(tc-getAS)"

	# Save new compiler from cleaning...
	cp "${S}"/compiler/ppc${FPC_ARCH} "${S}"/ppc${FPC_ARCH}.new || die

	# ...rebuild with current version...
	emake PP="${S}"/ppc${FPC_ARCH}.new AS="$(tc-getAS)" compiler_cycle

	# ..and clean up afterwards
	rm "${S}"/ppc${FPC_ARCH}.new || die

	# Using the new compiler.
	set_pp new

	emake PP="${pp}" AS="$(tc-getAS)" rtl_clean

	emake PP="${pp}" AS="$(tc-getAS)" rtl packages_all utils
}

src_install() {
	local pp
	set_pp new

	#fpcbuild-3.0.0/utils/fpcm/fpcmake
	#${WORKDIR}/${PN}build-${PV}/utils/fpcm/fpcmake"
	#fpcbuild-3.0.0/fpcsrc/utils/fpcm/bin/x86_64-linux/fpcmake
	set -- PP="${pp}" FPCMAKE="${S}/utils/fpcm/bin/${FPC_PARCH}-linux/fpcmake" \
		INSTALL_PREFIX="${ED}"/usr \
		INSTALL_DOCDIR="${ED}"/usr/share/doc/${PF} \
		INSTALL_MANDIR="${ED}"/usr/share/man \
		INSTALL_SOURCEDIR="${ED}"/usr/lib/fpc/${FPCV}/source

	emake "$@" compiler_install rtl_install packages_install utils_install

		mkdir "${ED}"/usr/lib64
		mv "${ED}"/usr/lib/libpas2jslib.so "${ED}"/usr/lib64/libpas2jslib.so

	dosym ../lib/fpc/${FPCV}/ppc${FPC_ARCH} /usr/bin/ppc${FPC_ARCH}

	cd "${S}"/../install/doc || die
	emake "$@" installdoc

	cd "${S}"/../install/man || die
	emake "$@" installman

	if use doc ; then
		cd "${S}"/../fpcdocs || die
		dodoc -r *
	fi

	if use source ; then
		cd "${S}" || die
		shift
		emake PP="${ED}"/usr/bin/ppc${FPC_ARCH} "$@" sourceinstall
		find "${ED}"/usr/lib/fpc/${FPCV}/source -name '*.o' -exec rm {} \;
	fi

	"${ED}"/usr/lib/fpc/${FPCV}/samplecfg "${ED}"/usr/lib/fpc/${FPCV} "${ED}"/etc || die

	# set correct (prefixed) path for e.g. unit files
	sed -i "s:${ED}:${EPREFIX}:g" "${ED}"/etc/fpc.cfg || die

	rm -r "${ED}"/usr/lib/fpc/lexyacc || die
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]] && use ide; then
		einfo "To read the documentation in the fpc IDE, enable the doc USE flag"
	fi
}
