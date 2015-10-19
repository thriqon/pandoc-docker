FROM l3iggs/archlinux
MAINTAINER Jonas Weber

RUN pacman -Sy &&\
	pacman -S --quiet --noconfirm make cabal-install texlive-core texlive-fontsextra texlive-formatsextra texlive-genericextra texlive-latexextra texlive-pictures texlive-plainextra texlive-pstricks texlive-publishers texlive-science ghc jre7-openjdk-headless wget
RUN pacman -S --quiet --noconfirm graphviz ttf-dejavu fontconfig

RUN cabal update
RUN cabal install -v3 pandoc pandoc-citeproc pandoc-crossref

CMD ["/bin/bash"]

