# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.2

EAPI=8

CRATES="
	ab_glyph@0.2.28
	ab_glyph_rasterizer@0.1.8
	addr2line@0.24.1
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-activity@0.6.0
	android-properties@0.2.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.89
	approx@0.5.1
	arrayref@0.3.9
	arrayvec@0.7.6
	as-raw-xcb-connection@1.0.1
	async-trait@0.1.83
	atomic-waker@1.1.2
	autocfg@1.4.0
	backtrace@0.3.74
	bindgen@0.69.4
	bitflags@1.3.2
	bitflags@2.6.0
	block2@0.5.1
	block@0.1.6
	bumpalo@3.16.0
	bytemuck@1.18.0
	bytemuck_derive@1.7.1
	byteorder-lite@0.1.0
	byteorder@1.5.0
	bytes@0.4.12
	bytes@1.7.2
	calloop-wayland-source@0.3.0
	calloop@0.13.0
	cc@1.1.24
	cesu8@1.1.0
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	cgl@0.3.2
	chrono@0.4.38
	clang-sys@1.8.1
	clap@4.5.19
	clap_builder@4.5.19
	clap_derive@4.5.18
	clap_lex@0.7.2
	clipboard-win@3.1.1
	colorchoice@1.0.2
	combine@4.6.7
	concurrent-queue@2.5.0
	convert_case@0.6.0
	copypasta@0.10.1
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.23.2
	crc32fast@1.4.2
	crossbeam-channel@0.5.13
	crossbeam-utils@0.8.20
	csscolorparser@0.6.2
	cursor-icon@1.1.0
	deranged@0.3.11
	derive-new@0.6.0
	dirs-sys@0.4.1
	dirs@5.0.1
	dispatch@0.2.0
	dlib@0.5.2
	downcast-rs@1.2.1
	dpi@0.1.1
	either@1.13.0
	equivalent@1.0.1
	errno@0.3.9
	fdeflate@0.3.5
	file-id@0.2.1
	filetime@0.2.25
	flate2@1.0.34
	flexi_logger@0.28.5
	font-types@0.6.0
	foreign-types-macros@0.2.3
	foreign-types-shared@0.3.1
	foreign-types@0.5.0
	fsevent-sys@4.1.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.1.31
	futures@0.3.30
	gethostname@0.4.3
	getrandom@0.1.16
	getrandom@0.2.15
	gimli@0.31.0
	gl@0.14.0
	gl_generator@0.14.0
	glam@0.27.0
	glamour@0.11.1
	glob@0.3.1
	glutin-winit@0.5.0
	glutin@0.32.1
	glutin_egl_sys@0.7.0
	glutin_glx_sys@0.6.0
	glutin_wgl_sys@0.6.0
	hashbrown@0.14.5
	hashbrown@0.15.0
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	home@0.5.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	image@0.25.2
	indexmap@2.6.0
	indoc@2.0.5
	inotify-sys@0.1.5
	inotify@0.9.6
	iovec@0.1.4
	is_terminal_polyfill@1.70.1
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.11
	jni-sys@0.3.0
	jni@0.21.1
	jobserver@0.1.32
	js-sys@0.3.70
	khronos_api@3.1.0
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy-bytes-cast@5.0.1
	lazy_static@1.5.0
	lazycell@1.3.0
	libc@0.2.159
	libloading@0.8.5
	libredox@0.0.2
	libredox@0.1.3
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.22
	lru@0.12.4
	malloc_buf@0.0.6
	memchr@2.7.4
	memmap2@0.9.5
	minimal-lexical@0.2.1
	miniz_oxide@0.8.0
	mio@0.8.11
	mio@1.0.2
	ndk-context@0.1.1
	ndk-sys@0.6.0+11769913
	ndk@0.9.0
	nom@7.1.3
	notify-debouncer-full@0.3.1
	notify@6.1.1
	num-bigint@0.4.6
	num-complex@0.4.6
	num-conv@0.1.0
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.4.2
	num-traits@0.2.19
	num@0.4.3
	num_enum@0.7.3
	num_enum_derive@0.7.3
	nvim-rs@0.7.0
	objc-foundation@0.1.1
	objc-sys@0.3.5
	objc2-app-kit@0.2.2
	objc2-cloud-kit@0.2.2
	objc2-contacts@0.2.2
	objc2-core-data@0.2.2
	objc2-core-image@0.2.2
	objc2-core-location@0.2.2
	objc2-encode@4.0.3
	objc2-foundation@0.2.2
	objc2-link-presentation@0.2.2
	objc2-metal@0.2.2
	objc2-quartz-core@0.2.2
	objc2-symbols@0.2.2
	objc2-ui-kit@0.2.2
	objc2-uniform-type-identifiers@0.2.2
	objc2-user-notifications@0.2.2
	objc2@0.5.2
	objc@0.2.7
	objc_id@0.1.1
	object@0.36.4
	once_cell@1.20.1
	option-ext@0.2.0
	orbclient@0.3.47
	owned_ttf_parser@0.24.0
	parity-tokio-ipc@0.9.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	percent-encoding@2.3.1
	phf@0.11.2
	phf_generator@0.11.2
	phf_macros@0.11.2
	phf_shared@0.11.2
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	pkg-config@0.3.31
	png@0.17.14
	polling@3.7.3
	portable-atomic@1.9.0
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	prettyplease@0.2.22
	proc-macro-crate@3.2.0
	proc-macro2@1.0.86
	quick-xml@0.36.2
	quote@1.0.36
	rand@0.7.3
	rand@0.8.5
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	rand_hc@0.2.0
	raw-window-handle@0.6.2
	read-fonts@0.20.0
	redox_syscall@0.4.1
	redox_syscall@0.5.7
	redox_users@0.4.6
	regex-automata@0.4.8
	regex-syntax@0.8.5
	regex@1.11.0
	rmp@0.8.14
	rmpv@1.3.0
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustix@0.38.37
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	scc@2.2.0
	scoped-env@2.1.0
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sctk-adwaita@0.10.1
	sdd@3.0.3
	serde@1.0.210
	serde_derive@1.0.210
	serde_json@1.0.128
	serde_spanned@0.6.8
	serial_test@3.1.1
	serial_test_derive@3.1.1
	shlex@1.3.0
	signal-hook-registry@1.4.2
	simd-adler32@0.3.7
	siphasher@0.3.11
	skia-bindings@0.75.0
	skia-safe@0.75.0
	skrifa@0.20.0
	slab@0.4.9
	smallvec@1.13.2
	smithay-client-toolkit@0.19.2
	smithay-clipboard@0.7.2
	smol_str@0.2.2
	socket2@0.5.7
	spin_sleep@1.2.1
	strict-num@0.1.1
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	swash@0.1.18
	syn@2.0.79
	tar@0.4.42
	thiserror-impl@1.0.64
	thiserror@1.0.64
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	tiny-skia-path@0.11.4
	tiny-skia@0.11.4
	tokio-io@0.1.13
	tokio-macros@2.4.0
	tokio-util@0.7.12
	tokio@1.40.0
	toml@0.5.11
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	tracing-core@0.1.32
	tracing@0.1.40
	tracy-client-sys@0.22.2
	ttf-parser@0.24.1
	typed-path@0.7.1
	unicode-ident@1.0.13
	unicode-segmentation@1.12.0
	utf8parse@0.2.2
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-futures@0.4.43
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	wayland-backend@0.3.7
	wayland-client@0.31.6
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.6
	wayland-protocols-plasma@0.3.4
	wayland-protocols-wlr@0.3.4
	wayland-protocols@0.32.4
	wayland-scanner@0.31.5
	wayland-sys@0.31.5
	web-sys@0.3.70
	web-time@1.1.0
	which@4.4.2
	which@6.0.3
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.56.0
	windows-implement@0.56.0
	windows-interface@0.56.0
	windows-registry@0.2.0
	windows-result@0.1.2
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.56.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winit@0.30.5
	winnow@0.6.20
	winres@0.1.12
	winsafe@0.0.19
	wslpath-rs@0.1.0
	x11-clipboard@0.9.2
	x11-dl@2.21.0
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	xattr@1.3.1
	xcursor@0.3.8
	xdg@2.5.2
	xkbcommon-dl@0.4.2
	xkeysym@0.2.1
	xml-rs@0.8.22
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

inherit cargo desktop toolchain-funcs xdg-utils

# Bumping guid
# --- Getting the dependencies for CRATES:
# 1. clone git@github.com:neovide/neovide.git
# 2. run ./pycargoebuild ./ in that directory
# 3. CRATES variables will be in generated ebuild
#
# --- Getting the commits below
# 1. find in neovides cargo.toml which version of skia-safe us used
# 2. go to https://github.com/rust-skia/rust-skia/tags and browse the files of that version
# 3. note the commit of the skia directory
# 3. click on the skia directory which links to https://github.com/rust-skia/skia/tree/somecommit
# 4. browse the releases page for the corresponding tag for that noted commit
# 5. browse the files of that tag
# 6. open the file DEPS
# 7. it contains a line that specifies the commit of wuff used.
SKIA_PV="m127-0.75.0"
WUFF_COMMIT="e3f919ccfe3ef542cfc983a82146070258fb57f8"

DESCRIPTION="Neovide: No Nonsense Neovim Gui"
HOMEPAGE="https://neovide.dev/"
SRC_URI="
	https://github.com/neovide/neovide/archive/${PV}.tar.gz -> ${P}.tar.gz
	https://codeload.github.com/rust-skia/skia/tar.gz/${SKIA_PV} -> skia-${SKIA_PV}.tar.gz
	https://github.com/google/wuffs-mirror-release-c/archive/${WUFF_COMMIT}.tar.gz -> wuffs-${WUFF_COMMIT}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
LICENSE+="
	Apache-2.0 BSD-2 BSD Boost-1.0 CC0-1.0 ISC LGPL-3 MIT MPL-2.0
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/openssl
	dev-libs/expat
	dev-libs/icu:=
	media-libs/fontconfig
	media-libs/freetype
	media-libs/harfbuzz:=
	media-libs/libjpeg-turbo:=
	media-libs/libpng:=
	sys-libs/zlib
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-build/gn
	dev-util/bindgen
	sys-devel/clang
"

# rust does not use *FLAGS from make.conf, silence portage warning
QA_FLAGS_IGNORED="usr/bin/.*"

src_unpack() {
	cargo_src_unpack
	mkdir -p "${WORKDIR}"/skia-"${SKIA_PV}"/third_party/externals/ || die
	ln -s "${WORKDIR}"/wuffs-mirror-release-c-"${WUFF_COMMIT}" \
		"${WORKDIR}"/skia-"${SKIA_PV}"/third_party/externals/wuffs || die
}

src_prepare() {
	eapply_user
	cargo_src_configure
	sed -i "${S}/Cargo.toml" -e 's/strip = true/strip = false/'

	export SKIA_SOURCE_DIR="${WORKDIR}/skia-${SKIA_PV}"
	export SKIA_GN_COMMAND="gn"
	export SKIA_NINJA_COMMAND="ninja"
	export SKIA_USE_SYSTEM_LIBRARIES="true"

	pushd "${WORKDIR}" || die
	# remove this if next version uses newer skia-bindings
	# eapply "${FILESDIR}/${P}_skia-bindings-0.75.0_system_icu.patch"
	if tc-is-gcc; then
		eapply "${FILESDIR}/${P}_skia-bindings-0.75.0_gcc.patch"
	fi
}

src_install() {
	cargo_src_install
	domenu assets/neovide.desktop
	newicon assets/neovide.svg neovide
}

pkg_postinst() {
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
}
