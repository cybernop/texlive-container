ARG DEB_VERSION=bookworm

FROM debian:${DEB_VERSION}

RUN apt update && apt update -y
RUN apt install texlive-full -y
