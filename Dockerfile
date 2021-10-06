FROM webhippie/alpine:latest
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=molecule
ENV MOLECULE_VERSION=3.5.2

# renovate: datasource=pypi depName=molecule-hetznercloud
ENV MOLECULE_HCLOUD_VERSION=1.3.0

# renovate: datasource=pypi depName=molecule-openstack
ENV MOLECULE_OPENSTACK_VERSION=0.3

# renovate: datasource=pypi depName=molecule-docker
ENV MOLECULE_DOCKER_VERSION=1.0.2

RUN apk update && \
  apk upgrade && \
  apk add python3 python3-dev py3-pip py3-cryptography build-base && \
  pip3 install -U molecule==${MOLECULE_VERSION} molecule-hetznercloud==${MOLECULE_HCLOUD_VERSION} molecule-openstack==${MOLECULE_OPENSTACK_VERSION} molecule-docker==${MOLECULE_DOCKER_VERSION} pytest-molecule yamllint testinfra flake8 pycrypto ansible ansible-lint && \
  apk del build-base && \
  rm -rf /var/cache/apk/* /root/.cache
