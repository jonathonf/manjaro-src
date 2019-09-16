#!/bin/bash
set -euo pipefail

mkdir sources srcpackages makepkglogs || true
chown -R builder /home/builder /builds

echo "Building source package..."
sudo -u builder script -q -c "/usr/bin/makepkg --noconfirm --noprogressbar --nosign -CSc --allsource" /dev/null
