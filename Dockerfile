
FROM alpine:latest

MAINTAINER Jonas Weber

COPY mitch.tishmack@gmail.com-55881c97.rsa.pub /etc/apk/keys/mitch.tishmack@gmail.com-55881c97.rsa.pub

RUN rm /etc/apk/repositories
COPY repositories /etc/apk/repositories

RUN apk update &&\
  apk upgrade &&\
  apk add texlive@testing ghc cabal-install stack bash linux-headers musl-dev gmp-dev zlib-dev make &&\
  cabal update &&\
  cabal install pandoc pandoc-crossref pandoc-citeproc

CMD ["/bin/bash"]

