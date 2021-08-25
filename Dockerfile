FROM webhippie/python:3.7
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=molecule
ENV MOLECULE_VERSION=3.4.0

# renovate: datasource=pypi depName=molecule-hetznercloud
ENV MOLECULE_HCLOUD_VERSION=1.2.1

# renovate: datasource=pypi depName=molecule-openstack
ENV MOLECULE_OPENSTACK_VERSION=0.3

# renovate: datasource=pypi depName=molecule-docker
ENV MOLECULE_DOCKER_VERSION=1.0.1

RUN apk update && \
  apk upgrade && \
  apk add git openssh-client gcc make libffi-dev musl-dev openssl-dev rust cargo && \
  pip3 install -U molecule==${MOLECULE_VERSION} molecule-hetznercloud==${MOLECULE_HCLOUD_VERSION} molecule-openstack==${MOLECULE_OPENSTACK_VERSION} molecule-docker==${MOLECULE_DOCKER_VERSION} pytest-molecule yamllint testinfra flake8 pycrypto ansible ansible-lint && \
  apk del gcc make libffi-dev musl-dev openssl-dev rust cargo && \
  rm -rf /var/cache/apk/*

