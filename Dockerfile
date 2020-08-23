FROM ubuntu:18.04

ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-add-repository --yes --update ppa:ansible/ansible \
    && apt-get install -y ansible=2.9.12-1ppa~bionic \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
