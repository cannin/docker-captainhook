FROM ubuntu:16.04
MAINTAINER cannin

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y git-core golang

ENV GOPATH /gosource

RUN go get github.com/bketelsen/captainhook

EXPOSE 8080
ENTRYPOINT ["/gosource/bin/captainhook", "-listen-addr=0.0.0.0:8080", "-echo", "-configdir=/webhooks"]
