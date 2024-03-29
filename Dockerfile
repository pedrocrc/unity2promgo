FROM golang:latest

WORKDIR /opt/unityexporter
COPY . .

#RUN GO111MODULE=off go get -u github.com/muravsky/gounity
#RUN GO111MODULE=off go get -u github.com/prometheus/client_golang/prometheus
#RUN GO111MODULE=off go get -u github.com/prometheus/client_golang/prometheus/promhttp

RUN go build main.go utils.go unitycollector.go

EXPOSE 8080

ENTRYPOINT sh -c ./main
