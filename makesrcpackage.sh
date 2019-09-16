#!/bin/bash
set -euo pipefail

cd /build
mkdir sources srcpackages makepkglogs || true
chown -R builder /home/builder

echo "Building source package..."
sudo -u builder script -q -c "/usr/bin/makepkg --noconfirm --noprogressbar --nosign -CSc --allsource" /dev/null
