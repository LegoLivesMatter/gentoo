# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

MY_P=${P/-/.}
DESCRIPTION="Helpers to maintain useful information about a request context"
HOMEPAGE="
	https://opendev.org/openstack/oslo.context/
	https://github.com/openstack/oslo.context/
	https://pypi.org/project/oslo.context/
"
SRC_URI="mirror://pypi/${PN::1}/${PN/-/.}/${MY_P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"

RDEPEND="
	>dev-python/pbr-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/debtcollector-1.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>dev-python/pbr-2.1.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/fixtures-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/oslotest-3.2.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest
distutils_enable_sphinx doc/source \
	dev-python/openstackdocstheme
