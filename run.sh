#!/bin/bash
set -euo pipefail
set -x

declare -r BUILDDIR="${PWD}"
declare -r SRCDEST="/build/sources"
declare -r SRCPKGDEST="/build/srcpackages"
declare -r LOGDEST="/build/makepkglogs"

podman run --rm -it --userns=keep-id \
	-v "${BUILDDIR}":/build:rw \
	-v "${SRCDEST:-$BUILDDIR/sources}":/build/sources:rw \
	-v "${SRCPKGDEST:-$BUILDDIR/srcpackages}":/build/srcpackages:rw \
	-v "${LOGDEST:-$BUILDDIR/makepkglogs}":/build/makepkglogs:rw \
	jonathonf/manjaro-src
