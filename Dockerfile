FROM l3iggs/archlinux
MAINTAINER Jonas Weber

RUN pacman -Sy &&\
	pacman -S --quiet --noconfirm make cabal-install texlive-core texlive-fontsextra texlive-formatsextra texlive-genericextra texlive-latexextra texlive-pictures texlive-plainextra texlive-pstricks texlive-publishers texlive-science ghc jre7-openjdk-headless wget
RUN pacman -S --quiet --noconfirm graphviz

RUN cabal update
RUN cabal install pandoc
RUN cabal install pandoc-citeproc
RUN cabal install pandoc-crossref

CMD ["/bin/bash"]

