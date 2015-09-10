FROM l3iggs/archlinux
MAINTAINER Jonas Weber

RUN pacman -Sy &&\
	pacman -S --quiet --noconfirm make cabal-install texlive-core texlive-fontsextra texlive-formatsextra texlive-genericextra texlive-latexextra texlive-pictures texlive-plainextra texlive-pstricks texlive-publishers texlive-science ghc gcc wget gnupg &&\
	cd /tmp && \
	wget http://files.nothingisreal.com/software/gpp/gpp-2.24.tar.bz2 && \
	wget http://files.nothingisreal.com/software/gpp/gpp-2.24.tar.bz2.sig && \
	gpg --keyserver pgp.mit.edu --recv-keys 28F47A15AB82C216D278DEB92B119C3AEFBF4915 && \
	gpg --verify gpp-2.24.tar.bz2.sig gpp-2.24.tar.bz2 && \
	tar xf gpp-2.24.tar.bz2 && \
	cd gpp-2.24 && \
	./configure --prefix=/usr && \
	make && make install && \
	cd / &&\
	rm -rf /tmp/gpp-2.24.tar.bz2 /tmp/gpp-2.24.tar.bz2 /tmp/gpp-2.24 /root/.gnupg && \
	cabal update &&\
	cabal install pandoc pandoc-citeproc pandoc-crossref &&\
	pacman -R --noconfirm wget gcc ghc && \
	rm -rf /root/.cabal/packages /var/cache/pacman/pkg &&\
	ln -s ~/.cabal/bin/* /usr/local/bin

CMD ["/bin/bash"]

