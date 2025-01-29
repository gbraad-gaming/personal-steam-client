ARG BASE_IMAGE="ghcr.io/gbraad-devenv/fedora/rdesktop"
ARG BASE_VERSION=41

FROM ${BASE_IMAGE}:${BASE_VERSION}

USER root

RUN dnf install -y \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
    && dnf install -y \
        steam \
    && dnf clean all \
    && rm -rf /var/cache/yum

USER gbraad

RUN echo "exec /usr/bin/steam" >> $HOME/.config/i3/config

# ensure to become root for systemd
USER root
#ENTRYPOINT ["/sbin/init"]
