FROM l3iggs/archlinux
MAINTAINER Jonas Weber

RUN pacman -Sy &&\
	pacman -S --quiet --noconfirm make cabal-install texlive-core texlive-fontsextra texlive-formatsextra texlive-genericextra texlive-latexextra texlive-pictures texlive-plainextra texlive-pstricks texlive-publishers texlive-science ghc jre7-openjdk-headless &&\
	cabal update &&\
	cabal install pandoc pandoc-citeproc pandoc-crossref &&\
	rm -rf /root/.cabal/packages /var/cache/pacman/pkg &&\
	ln -s ~/.cabal/bin/* /usr/local/bin

CMD ["/bin/bash"]

