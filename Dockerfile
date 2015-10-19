FROM l3iggs/archlinux
MAINTAINER Jonas Weber

RUN pacman -Sy &&\
	pacman -S --quiet --noconfirm make cabal-install texlive-core texlive-fontsextra texlive-formatsextra texlive-genericextra texlive-latexextra texlive-pictures texlive-plainextra texlive-pstricks texlive-publishers texlive-science ghc jre7-openjdk-headless wget
RUN pacman -S --quiet --noconfirm graphviz ttf-dejavu fontconfig

RUN cabal update
RUN cabal install tls
RUN cabal install highlighting-kate
RUN cabal install aeson
RUN cabal install syb

RUN cabal install pandoc-types
RUN cabal install pandoc
RUN cabal install pandoc-citeproc
RUN cabal install pandoc-crossref

CMD ["/bin/bash"]

