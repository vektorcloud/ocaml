#!/bin/bash

. /root/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

exec $@
