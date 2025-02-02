FROM alpine:latest

RUN \
        apk add curl git \
        && curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
        && chmod +x ./kubectl \
        && mv ./kubectl /usr/local/bin \
        && curl -O https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz --insecure \
        && tar -xf helm-*.tar.gz \
        && mv ./linux-amd64/helm /usr/local/bin \
	&& helm plugin install https://github.com/databus23/helm-diff

ENTRYPOINT ["/bin/sh", "-c"]
