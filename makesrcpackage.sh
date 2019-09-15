#!/bin/bash
set -euo pipefail

cd /build
mkdir sources srcpackages makepkglogs || true

echo "Building source package..."
script -q -c "/usr/bin/makepkg --noconfirm --noprogressbar --nosign -CSc --allsource" /dev/null
