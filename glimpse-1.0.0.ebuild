# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Email widget for x11-wm/awesome"
HOMEPAGE="https://github.com/alexandru-elisei/glimpse"
SRC_URI="https://github.com/alexandru-elisei/glimpse/archive/${PV}.tar.gz"
RESTRICT="mirror"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND=""
RDEPEND=">=x11-wm/awesome-3.5.0
	<=x11-wm/awesome-3.5.9
	>=dev-lang/python-3.2.0"

DOCS="README.md"

src_install() {
	insinto /usr/share/awesome/lib/glimpse
	doins glimpse.py init.lua

	if use examples; then
		DOCS+=" example.conf"
	fi
	einstalldocs
}

pkg_postinst() {
	# Make glimpse.py executable.
	chmod  0755 /usr/share/awesome/lib/glimpse/glimpse.py
}
