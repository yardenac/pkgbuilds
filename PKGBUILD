pkgname=django-storages-hg
pkgver=20121101
__hgrev=1574890d87be
pkgrel=1
pkgdesc="Collection of custom storage backends for Django"
arch=('any')
url="http://code.larlet.fr/django-storages/"
license=('BSD3')
depends=('django')
makedepends=('mercurial')

_hgroot="https://bitbucket.org/david/django-storages"
_hgrepo="django-storages"
_hgbranch="default"

build() {
	 hg clone -b ${_hgbranch} -u ${_hgrev} "${_hgroot}/${_hgrepo}" ${_hgrepo}
	 cd ${_hgrepo}
	 if (( $(hg id -n) < $(hg id -nr ${_hgbranch}) )); then
		  printf 'You are not building the latest revision!\n'
		  printf "Consider updating _hgrev to $(hg id -r ${_hgbranch}).\n"
	 fi
	 python2 setup.py build
}

package() {
	 cd ${_hgrepo}
	 python2 setup.py install --root="$pkgdir" --optimize=1
}
