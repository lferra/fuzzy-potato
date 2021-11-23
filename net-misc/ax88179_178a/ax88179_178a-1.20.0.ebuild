# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit linux-info linux-mod

DESCRIPTION="A kernel module for the ASIX USB 3.0 AX88179 ethernet controller"
HOMEPAGE="https://www.asix.com.tw/en/support/download"
SRC_URI="https://www.asix.com.tw/en/support/download/file/120 -> ${PN^^}_LINUX_DRIVER_v${PV}_SOURCE.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN^^}_Linux_Driver_v${PV}_source"

CONFIG_CHECK="USB_USBNET ~!USB_NET_AX88179_178A"
WARNING_USB_NET_AX88179_178A="CONFIG_USB_NET_AX88179_178A is enabled. ${P} will not be loaded unless kernel driver ASIX AX88179/178A USB 3.0/2.0 to Gigabit Ethernet (CONFIG_USB_NET_AX88179_178A) is DISABLED."

MODULE_NAMES="${PN}(net/usb:)"
BUILD_TARGETS="default"

src_prepare() {
	eapply_user
	sed -i 's/make -C/${MAKE} -C/' Makefile || die
	sed -i "s/\$(shell uname -r)/${KV_FULL}/" Makefile || die
}
