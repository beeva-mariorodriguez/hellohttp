FROM golang:1.9 AS builder
WORKDIR /go/src/hellohttp
ADD . .
RUN go get github.com/tools/godep && \
        godep get && \
        CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hellohttp .
FROM scratch
WORKDIR /
COPY --from=builder /go/src/hellohttp/hellohttp /go/bin/hellohttp
CMD ["/go/bin/hellohttp"]

