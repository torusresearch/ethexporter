FROM golang:alpine
RUN apk update && apk add libstdc++ g++ git

ADD . /ethexporter
WORKDIR /ethexporter
RUN go install

ENV GETH https://ropsten.infura.io
ENV PORT 9015

RUN mkdir /app
WORKDIR /app
ADD addresses.txt /app

EXPOSE 9015

ENTRYPOINT /go/bin/ethexporter
