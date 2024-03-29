FROM golang:latest as builder

WORKDIR /opt/unityexporter
COPY . .

RUN go build main.go utils.go unitycollector.go

FROM alpine:latest
WORKDIR /opt/unityexporter
COPY --from=builder /opt/unityexporter/main .

EXPOSE 8080

CMD ["./main"]
