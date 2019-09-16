FROM archlinux/base:latest

RUN pacman -Syu --noconfirm --noprogressbar --needed git curl wget ca-certificates sudo binutils fakeroot && \
    rm -fr /var/cache/pacman/pkg/* && \
    rm -f /var/lib/pacman/sync/*

RUN /usr/bin/useradd -m builder -u 1000 && \
    echo 'builder ALL=(root) NOPASSWD:/usr/bin/pacman' > /etc/sudoers.d/makepkg

RUN sed -i '44cMAKEFLAGS="-j$(($(nproc) + 1))"' /etc/makepkg.conf && \
    sed -i '116cSRCDEST=/builds/sources'           /etc/makepkg.conf && \
    sed -i '118cSRCPKGDEST=/builds/srcpackages'    /etc/makepkg.conf && \
    sed -i '120cLOGDEST=/builds/makepkglogs'       /etc/makepkg.conf && \
    sed -i '132cCOMPRESSXZ=(xz -c -z -T0 -)'    /etc/makepkg.conf && \
    sed -i "145cSRCEXT='.src.tar.xz'"           /etc/makepkg.conf

ADD makesrcpackage.sh /makesrcpackage.sh
RUN chmod a+rx /makesrcpackage.sh

VOLUME [ '/builds' ]

CMD [ "/makesrcpackage.sh" ]
