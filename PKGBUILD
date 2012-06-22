pkgname=screen-best
pkgver=20120622
pkgrel=1
pkgdesc="GNU Screen package with everything"
arch=(i686 x86_64)
provides=(screen screen-vs)
conflicts=(screen screen-vs)
depends=(ncurses pam)
makedepends=(git automake autoconf)
url=http://www.gnu.org/software/screen/
license=GPL
backup=(etc/screenrc etc/pam.d/screen)
#install=screen.install
source=http://projects.archlinux.org/svntogit/packages.git/plain/screen/trunk/screen-4.0.3-long-term.patch
md5sums=2723c3e71d5a2e5a74b6ddbc5215ef0f
_gitroot=git://git.savannah.gnu.org/screen.git
_gitname=screen

build() {
	 cd $srcdir
	 [ -d $srcdir/$_gitname ] \
		  && cd $_gitname && git pull origin \
		  || git clone $_gitroot
	 cd $srcdir/$_gitname/src
	 patch -Np1 -i $srcdir/screen-4.0.3-long-term.patch
	 ./autogen.sh
	 ./configure \
		  --prefix=/usr \
		  --enable-pam \
		  --enable-colors256 \
		  --enable-rxvt_osc \
		  --enable-telnet \
		  --with-pty-group=5 \
		  --with-sys-screenrc=/etc/screenrc \
		  --mandir=/usr/share/man \
		  --infodir=/usr/share/info
	 ionice -c 3 nice -n 19 make
}
package() {
	 cd $srcdir/$_gitname/src
	 make DESTDIR=$pkgdir install
	 mkdir -p $pkgdir/etc/pam.d
	 echo 'auth		required	pam_unix.so' > $pkgdir/etc/pam.d/screen
	 chmod u-s $pkgdir/usr/bin/screen-4.1.0
}
