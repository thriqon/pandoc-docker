FROM l3iggs/archlinux
MAINTAINER Jonas Weber

RUN pacman -Sy &&\
	pacman -S --quiet --noconfirm make cabal-install ghc

RUN cabal update
RUN cabal install -v3 pandoc-types

CMD ["/bin/bash"]

