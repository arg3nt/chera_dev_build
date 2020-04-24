FROM ubuntu:19.10

# Install base deps
RUN apt update && apt install -y bash curl git unzip xz-utils zip libglu1-mesa

# Install flutter beta and enable web builds
RUN git clone https://github.com/flutter/flutter.git -b beta
WORKDIR flutter/bin
RUN ./flutter channel beta && ./flutter upgrade && ./flutter config --enable-web
WORKDIR /


COPY build_and_deploy.sh /build_and_deploy.sh

ENV chera_dev_branch master

ENTRYPOINT ["/build_and_deploy.sh"]
