FROM quay.io/vektorcloud/base:3.6

ENV \ 
  OCAML_VERSION=4.04.1-r0  \
  OPAM_VERSION=1.2.2-r1  \
  OPAMYES=true

ENV PATH="/root/.opam/$OCAML_VERSION/bin:$PATH"

RUN apk add --no-cache \
  bash \
  curl \
  gcc \
  git \
  m4 \
  make \
  mercurial \
  opam="$OPAM_VERSION" \
  ocaml="$OCAML_VERSION" \
  subversion 

WORKDIR /root
ENV HOME /root

RUN opam init --no-setup 

COPY .ocamlinit /root/.ocamlinit

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
