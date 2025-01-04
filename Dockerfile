FROM ubuntu:24.04

# https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/reference.md#run---mounttypecache
RUN rm -f /etc/apt/apt.conf.d/docker-clean; echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt update && \
    DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata && \
    apt install -y --no-install-recommends nano ca-certificates curl dos2unix openjdk-17-jdk && \
    apt -y upgrade && \
    apt autoremove -y

WORKDIR /

# --strip-components=1 removes the root folder in the tar.gz
# adjust the Megamek release/version as needed
RUN curl -L https://github.com/MegaMek/megamek/releases/download/v0.49.19.1/megamek-0.49.19.1.tar.gz \
    --output megamek.tar.gz && \
    tar -xzf megamek.tar.gz --strip-components=1 && \
    rm megamek.tar.gz

COPY startup.sh /
RUN dos2unix /startup.sh && chmod +x startup.sh

CMD ["/startup.sh"]
# for debugging
# CMD ["tail", "-f", "/dev/null"]