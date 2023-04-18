FROM golang:1.20.3-alpine3.16 AS builder

WORKDIR /src

COPY . .

RUN go build -ldflags '-s -w' hello-full-cycle.go

FROM scratch

WORKDIR /
COPY --from=builder /src / 
CMD ["/hello-full-cycle"]