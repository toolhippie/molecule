FROM ghcr.io/dockhippie/alpine:3.23@sha256:1007587cf611613076e699591a06b62713fa611d14a69118d7b363fd1a8804ca
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=molecule
ENV MOLECULE_CORE_VERSION=25.12.0

# renovate: datasource=pypi depName=molecule-plugins
ENV MOLECULE_PLUGINS_VERSION=25.8.12

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_CORE_VERSION=13.1.0

RUN apk update && \
  apk upgrade && \
  apk add --no-cache bash python3 python3-dev py3-pip build-base openssl-dev libffi-dev cargo && \
  pip3 install --break-system-packages -U molecule==${MOLECULE_CORE_VERSION} molecule-plugins[containers]==${MOLECULE_PLUGINS_VERSION} molecule-plugins[podman]==${MOLECULE_PLUGINS_VERSION} molecule-plugins[docker]==${MOLECULE_PLUGINS_VERSION} ansible==${ANSIBLE_CORE_VERSION} ansible-lint pytest-molecule yamllint testinfra flake8 pycrypto && \
  apk del build-base openssl-dev libffi-dev cargo && \
  rm -rf /var/cache/apk/* /root/.cache
