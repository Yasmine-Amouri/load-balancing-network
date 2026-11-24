FROM golang:1.23 AS build
RUN go install github.com/rakyll/hey@v0.1.4

FROM debian:12-slim
RUN apt-get update \
 && apt-get install -y --no-install-recommends curl iperf3 iproute2 procps \
 && rm -rf /var/lib/apt/lists/*
COPY --from=build /go/bin/hey /usr/local/bin/hey
CMD ["sleep", "infinity"]