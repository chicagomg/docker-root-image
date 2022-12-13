FROM ubuntu:jammy-20221130

ENV SHELLOPTS="xtrace:pipefail:errexit"
ENV DEBIAN_FRONTEND=noninteractive

# Install tools & locales
RUN apt update; \
    apt upgrade -y; \
    apt install -y --no-install-recommends apt-utils; \
    apt install -y --no-install-recommends apt-transport-https ca-certificates p11-kit; \
    \
    apt install -y --no-install-recommends tzdata locales; \
    echo "en_US.UTF-8 UTF-8" >  /etc/locale.gen; \
    echo "LANG=en_US.UTF-8" > /etc/default/locale; \
    locale-gen; \
    apt autoremove -y ;\
    \
    rm -rf /var/cache/debconf/* /var/lib/apt/lists/* /var/log/*

ENV SHELLOPTS=""
ENV PYTHONUNBUFFERED=1

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]
