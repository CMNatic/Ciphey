FROM python:3.8.5-slim-buster

LABEL description="Ciphey - An Automated Decoding and Decryption Tool"
LABEL maintainer="CMNatic <https://github.com/CMNatic>"
LABEL withthanks="Thanks to REMnux for providing the initial DockerHub Repo. Their Dockerimage is already very optimal, we've just adapted it slightly for non-REMnux environments"


USER root

RUN pip3 install --upgrade pip && \
  pip3 install --upgrade ciphey && \
  groupadd -r ciphey && \
  useradd -m -r -g ciphey -d /home/ciphey -s /usr/sbin/nologin -c "Ciphey User" ciphey && \
  mkdir -p /home/ciphey && \
  chown -R ciphey:ciphey /home/ciphey

USER ciphey
ENV HOME /home/ciphey
ENV USER ciphey

WORKDIR /home/ciphey/
COPY . /home/ciphey/

ENTRYPOINT ["/usr/local/bin/ciphey"]
