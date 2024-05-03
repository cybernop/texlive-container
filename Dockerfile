ARG DEB_VERSION=bookworm

FROM debian:${DEB_VERSION}
ARG TL_VERSION

RUN apt update && apt update -y
RUN apt install wget -y

# cd /tmp # working directory of your choice
WORKDIR /tmp
# Download: wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
#            or: curl -L -o install-tl-unx.tar.gz https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# (or via whatever other method you like)
RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# zcat < install-tl-unx.tar.gz | tar xf -
RUN zcat < install-tl-unx.tar.gz | tar xf -
# RUN perl --version && exit  1
RUN pod install Pod::Usage
# cd install-tl-*
# perl ./install-tl --no-interaction # as root or with writable destination
RUN cd install-tl-* && perl ./install-tl -repository ftp://tug.org/historic/systems/texlive/${TL_VERSION}/tlnet-final --no-interaction
# Finally, prepend /usr/local/texlive/YYYY/bin/PLATFORM to your PATH,
# e.g., /usr/local/texlive/2024/bin/x86_64-linux

