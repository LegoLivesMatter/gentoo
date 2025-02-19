# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 virtualx

MY_P="RxPY-${PV}"
DESCRIPTION="Reactive Extensions for Python"
HOMEPAGE="https://reactivex.io/"
SRC_URI="
	https://github.com/ReactiveX/RxPY/archive/v${PV}.tar.gz
		-> ${MY_P}.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0"
SLOT="4"
KEYWORDS="~amd64 ~x86"

DEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_test() {
	virtx distutils-r1_src_test
}
