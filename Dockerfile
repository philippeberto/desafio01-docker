#!/bin/bash
FROM golang:1.17-alpine AS builder

WORKDIR /usr/local/go/src/hello

COPY . .

RUN go build hello.go



FROM scratch

COPY --from=builder /usr/local/go/src/hello .

CMD [ "/hello" ]