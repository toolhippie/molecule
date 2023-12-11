FROM ghcr.io/dockhippie/alpine:3.19
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=molecule
ENV MOLECULE_CORE_VERSION=6.0.2

# renovate: datasource=pypi depName=molecule-plugins
ENV MOLECULE_PLUGINS_VERSION=23.5.0

RUN apk update && \
  apk upgrade && \
  apk add docker python3 python3-dev py3-pip py3-cryptography build-base cargo && \
  CARGO_NET_GIT_FETCH_WITH_CLI=true pip3 install -U molecule==${MOLECULE_CORE_VERSION} molecule-plugins[containers]==${MOLECULE_PLUGINS_VERSION} molecule-plugins[podman]==${MOLECULE_PLUGINS_VERSION} molecule-plugins[docker]==${MOLECULE_PLUGINS_VERSION} pytest-molecule yamllint testinfra flake8 pycrypto ansible ansible-lint && \
  apk del build-base cargo && \
  rm -rf /var/cache/apk/* /root/.cache
