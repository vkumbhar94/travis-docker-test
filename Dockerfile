FROM golang:1.14 as build
WORKDIR $GOPATH/src/github.com/vkumbhar94/travis-docker-test
ARG VERSION
COPY ./ ./
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o /travis-docker-test

FROM alpine:3.6
COPY --from=build /travis-docker-test /bin
ENTRYPOINT ["travis-docker-test"]
