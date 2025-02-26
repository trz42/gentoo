# Copyright 2020-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler-1.0.2
	ahash-0.7.6
	aho-corasick-0.7.18
	android_system_properties-0.1.4
	anyhow-1.0.62
	arc-swap-1.5.1
	arrayvec-0.7.2
	async-broadcast-0.4.1
	async-channel-1.7.1
	async-executor-1.4.1
	async-io-1.8.0
	async-lock-2.5.0
	async-recursion-0.3.2
	async-task-4.3.0
	async-trait-0.1.57
	atoi-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	base64-0.13.0
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.9.0
	block-buffer-0.10.2
	bstr-0.2.17
	btoi-0.4.2
	bumpalo-3.11.0
	byte-unit-4.0.14
	byteorder-1.4.3
	bytes-1.2.1
	bytesize-1.1.0
	cache-padded-1.2.0
	castaway-0.2.2
	cc-1.0.73
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.22
	clap-3.2.20
	clap_complete-3.2.4
	clap_derive-3.2.18
	clap_lex-0.2.4
	clru-0.5.0
	cmake-0.1.48
	combine-4.6.6
	compact_str-0.4.1
	concurrent-queue-1.2.4
	const_format-0.2.26
	const_format_proc_macros-0.2.22
	core-foundation-0.7.0
	core-foundation-sys-0.7.0
	core-foundation-sys-0.8.3
	cpufeatures-0.2.4
	crc32fast-1.3.2
	crossbeam-0.8.2
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.10
	crossbeam-queue-0.3.6
	crossbeam-utils-0.8.11
	crypto-common-0.1.6
	dashmap-5.3.4
	deelevate-0.2.0
	derivative-2.2.0
	difflib-0.4.0
	digest-0.9.0
	digest-0.10.3
	dirs-2.0.2
	dirs-4.0.0
	dirs-next-2.0.0
	dirs-sys-0.3.7
	dirs-sys-next-0.1.2
	dlv-list-0.3.0
	downcast-0.11.0
	dunce-1.0.2
	dyn-clone-1.0.9
	either-1.8.0
	enumflags2-0.7.5
	enumflags2_derive-0.7.4
	errno-0.2.8
	errno-dragonfly-0.1.2
	event-listener-2.5.3
	fastrand-1.8.0
	filedescriptor-0.8.2
	filetime-0.2.17
	flate2-1.0.24
	float-cmp-0.9.0
	fnv-1.0.7
	form_urlencoded-1.0.1
	fragile-1.2.1
	futures-core-0.3.23
	futures-io-0.3.23
	futures-lite-1.12.0
	futures-sink-0.3.23
	futures-task-0.3.23
	futures-util-0.3.23
	generic-array-0.14.6
	gethostname-0.2.3
	getrandom-0.1.16
	getrandom-0.2.7
	git-actor-0.11.4
	git-attributes-0.3.3
	git-bitmap-0.1.2
	git-chunk-0.3.1
	git-config-0.7.1
	git-date-0.1.0
	git-diff-0.18.1
	git-discover-0.4.2
	git-features-0.22.3
	git-glob-0.3.2
	git-hash-0.9.8
	git-index-0.4.3
	git-lock-2.1.1
	git-object-0.20.3
	git-odb-0.32.0
	git-pack-0.22.0
	git-path-0.4.1
	git-quote-0.2.1
	git-ref-0.15.4
	git-refspec-0.1.1
	git-repository-0.23.1
	git-revision-0.4.4
	git-sec-0.3.1
	git-tempfile-2.0.4
	git-traverse-0.16.4
	git-url-0.7.3
	git-validate-0.5.5
	git-worktree-0.4.3
	guess_host_triple-0.1.3
	hash_hasher-2.0.3
	hashbrown-0.12.3
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	home-0.5.3
	human_format-1.0.3
	iana-time-zone-0.1.46
	idna-0.2.3
	indexmap-1.9.1
	instant-0.1.12
	io-close-0.3.7
	io-lifetimes-0.7.3
	is_debug-1.0.1
	itertools-0.10.3
	itoa-1.0.3
	js-sys-0.3.59
	jwalk-0.6.0
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.132
	libz-sys-1.1.8
	linked-hash-map-0.5.6
	linux-raw-sys-0.0.46
	local_ipaddress-0.1.3
	lock_api-0.4.8
	log-0.4.17
	mac-notification-sys-0.5.6
	mach-0.3.2
	malloc_buf-0.0.6
	matches-0.1.9
	memchr-2.5.0
	memmap2-0.5.7
	memmem-0.1.1
	memoffset-0.6.5
	minimal-lexical-0.2.1
	miniz_oxide-0.5.3
	mockall-0.11.2
	mockall_derive-0.11.2
	nix-0.23.1
	nix-0.25.0
	nom-5.1.2
	nom-7.1.1
	normalize-line-endings-0.3.0
	notify-rust-4.5.8
	nu-ansi-term-0.46.0
	num-derive-0.3.3
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	num_threads-0.1.6
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	once_cell-1.13.1
	opaque-debug-0.3.0
	open-3.0.2
	ordered-float-2.10.0
	ordered-multimap-0.4.3
	ordered-stream-0.0.1
	os_info-3.5.0
	os_str_bytes-6.3.0
	overload-0.1.1
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	path-slash-0.2.1
	pathdiff-0.2.1
	pathsearch-0.2.0
	percent-encoding-2.1.0
	pest-2.3.0
	pest_derive-2.3.0
	pest_generator-2.3.0
	pest_meta-2.3.0
	phf-0.8.0
	phf_codegen-0.8.0
	phf_generator-0.8.0
	phf_shared-0.8.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	polling-2.3.0
	ppv-lite86-0.2.16
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.43
	process_control-3.5.1
	prodash-19.0.1
	quick-error-2.0.1
	quick-xml-0.24.0
	quote-1.0.21
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.3
	rand_hc-0.2.0
	rand_pcg-0.2.1
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.6.0
	regex-automata-0.1.10
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	rust-ini-0.18.0
	rustix-0.35.9
	rustversion-1.0.9
	ryu-1.0.11
	same-file-1.0.6
	schemars-0.8.10
	schemars_derive-0.8.10
	scopeguard-1.1.0
	semver-0.11.0
	semver-1.0.13
	semver-parser-0.10.2
	serde-1.0.144
	serde_derive-1.0.144
	serde_derive_internals-0.26.0
	serde_json-1.0.85
	serde_repr-0.1.9
	sha-1-0.10.0
	sha1-0.6.1
	sha1-0.10.1
	sha1-asm-0.5.1
	sha1_smol-1.0.0
	sha2-0.9.9
	shadow-rs-0.16.3
	shared_library-0.1.9
	shell-words-1.1.0
	signal-hook-0.1.17
	signal-hook-0.3.14
	signal-hook-registry-1.4.0
	siphasher-0.3.10
	slab-0.4.7
	smallvec-1.9.0
	socket2-0.4.6
	starship-battery-0.7.9
	static_assertions-1.1.0
	strsim-0.10.0
	strum-0.22.0
	strum_macros-0.22.0
	syn-1.0.99
	systemstat-0.2.0
	tempfile-3.3.0
	termcolor-1.1.3
	terminal_size-0.2.1
	terminfo-0.7.3
	termios-0.3.3
	termtree-0.2.4
	termwiz-0.15.0
	textwrap-0.15.0
	thiserror-1.0.32
	thiserror-impl-1.0.32
	time-0.1.44
	time-0.3.14
	time-macros-0.2.4
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	toml-0.5.9
	toml_edit-0.14.4
	tracing-0.1.36
	tracing-attributes-0.1.22
	tracing-core-0.1.29
	typenum-1.15.0
	ucd-trie-0.1.4
	uds_windows-1.0.2
	uluru-3.0.0
	unicase-2.6.0
	unicode-bidi-0.3.8
	unicode-bom-1.1.4
	unicode-ident-1.0.3
	unicode-normalization-0.1.21
	unicode-segmentation-1.9.0
	unicode-width-0.1.9
	unicode-xid-0.2.3
	uom-0.30.0
	url-2.2.2
	urlencoding-2.1.2
	utf8-width-0.1.6
	utf8parse-0.2.0
	vcpkg-0.2.15
	version_check-0.9.4
	versions-4.1.0
	vtparse-0.6.2
	waker-fn-1.1.0
	walkdir-2.3.2
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.82
	wasm-bindgen-backend-0.2.82
	wasm-bindgen-macro-0.2.82
	wasm-bindgen-macro-support-0.2.82
	wasm-bindgen-shared-0.2.82
	wepoll-ffi-0.1.2
	which-4.3.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.24.0
	windows-0.37.0
	windows-0.39.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.37.0
	windows_aarch64_msvc-0.39.0
	windows_i686_gnu-0.24.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.37.0
	windows_i686_gnu-0.39.0
	windows_i686_msvc-0.24.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.37.0
	windows_i686_msvc-0.39.0
	windows_x86_64_gnu-0.24.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.37.0
	windows_x86_64_gnu-0.39.0
	windows_x86_64_msvc-0.24.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.37.0
	windows_x86_64_msvc-0.39.0
	winres-0.1.12
	winrt-notification-0.5.1
	xml-rs-0.8.4
	yaml-rust-0.4.5
	zbus-2.3.2
	zbus_macros-2.3.2
	zbus_names-2.2.0
	zvariant-3.6.0
	zvariant_derive-3.6.0
"

inherit cargo flag-o-matic

DESCRIPTION="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
HOMEPAGE="https://starship.rs/"
SRC_URI="
	https://github.com/starship/starship/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="Apache-2.0 BSD BSD-2 CC0-1.0 ISC MIT MPL-2.0 Unlicense WTFPL-2 ZLIB"

SLOT="0"
KEYWORDS="~amd64"

BDEPEND=">=virtual/rust-1.59"

PATCHES=(
	# https://bugs.gentoo.org/866133
	"${FILESDIR}"/${PN}-1.10.3-no-strip.patch
)

QA_FLAGS_IGNORED="usr/bin/starship"

src_configure() {
	# See https://bugs.gentoo.org/869758
	filter-lto

	export PKG_CONFIG_ALLOW_CROSS=1
	export OPENSSL_NO_VENDOR=true

	cargo_src_configure
}

src_install() {
	cargo_src_install
	dodoc README.md CHANGELOG.md
}

pkg_postinst() {
	local v
	for v in ${REPLACING_VERSIONS}; do
		if ver_test "${v}" -lt "1.9.0"; then
			einfo "Note that vicmd_symbol config option was renamed to vimcmd_symbol in version 1.9"
		fi
	done
}
