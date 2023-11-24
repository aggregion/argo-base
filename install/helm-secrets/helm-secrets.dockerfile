FROM alpine:latest

ENV MAIN_PATH=/custom-tools
ENV HELM_SECRETS_VERSION=4.4.2
ENV KUBECTL_VERSION=1.26.1
ENV VALS_VERSION=0.24.0
ENV SOPS_VERSION=3.7.3

RUN mkdir -p $MAIN_PATH/helm-plugins
RUN wget -qO- https://github.com/jkroepke/helm-secrets/releases/download/v${HELM_SECRETS_VERSION}/helm-secrets.tar.gz | tar -C $MAIN_PATH/helm-plugins -xzf-;
RUN wget -qO $MAIN_PATH/curl https://github.com/moparisthebest/static-curl/releases/latest/download/curl-amd64
RUN wget -qO $MAIN_PATH/sops https://github.com/mozilla/sops/releases/download/v${SOPS_VERSION}/sops-v${SOPS_VERSION}.linux
RUN wget -qO $MAIN_PATH/kubectl https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN wget -qO- https://github.com/helmfile/vals/releases/download/v${VALS_VERSION}/vals_${VALS_VERSION}_linux_amd64.tar.gz | tar -xzf- -C $MAIN_PATH/ vals;
RUN cp $MAIN_PATH/helm-plugins/helm-secrets/scripts/wrapper/helm.sh $MAIN_PATH/helm
RUN chmod +x $MAIN_PATH/*
