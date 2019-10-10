FROM alpine:3.9.4

ENV TERRAFORM_VERSION=0.12.6

RUN apk update && \
    apk add curl unzip && \
    cd /tmp && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/terraform", "--version"]


