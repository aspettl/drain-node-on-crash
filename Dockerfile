FROM ubuntu:18.04
LABEL maintainer="aaron@spettl.de"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      apt-utils \
      curl \
      ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

## Install kubectl
RUN curl --location https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl --output /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

## Setup run script
WORKDIR /root
ADD run.sh /root/run.sh

CMD /root/run.sh
