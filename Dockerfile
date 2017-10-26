FROM golang:1.9 AS builder
WORKDIR /go/src/hellohttp
ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hellohttp .
FROM alpine
WORKDIR /
COPY --from=builder /go/src/hellohttp/hellohttp /go/bin/hellohttp
CMD ["/go/bin/hellohttp"]

