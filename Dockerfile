FROM webhippie/alpine:3.16
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=molecule
ENV MOLECULE_VERSION=4.0.1

# renovate: datasource=pypi depName=molecule-docker
ENV MOLECULE_DOCKER_VERSION=2.0.0

RUN apk update && \
  apk upgrade && \
  apk add python3 python3-dev py3-pip py3-cryptography libffi-dev build-base && \
  pip3 install -U molecule==${MOLECULE_VERSION} molecule-docker==${MOLECULE_DOCKER_VERSION} pytest-molecule yamllint testinfra flake8 pycrypto ansible ansible-lint && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
