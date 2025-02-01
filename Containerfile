ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN dnf install -y \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    && dnf install -y \
        steam \
    && dnf clean all \
    && rm -rf /var/cache/yum \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.title "Personal Steam" \
    && git config -f /etc/rdesktop/rdesktop.ini rdesktop.exec "/usr/bin/steam"

#ENTRYPOINT ["/sbin/init"]
