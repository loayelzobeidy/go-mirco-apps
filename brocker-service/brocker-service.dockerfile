#base go image
FROM golang:1.23-alpine AS builder

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN CGO_ENABLED=0 go build -o brockerApp ./cmd/api

RUN chmod +x /app/brockerApp

FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/brockerApp /app

CMD ["/app/brockerApp"]
