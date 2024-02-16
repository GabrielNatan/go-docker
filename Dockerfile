FROM golang:alpine AS builder

WORKDIR /app
COPY main.go .
RUN  go mod init fullcycle && \
     go build -o main .

FROM scratch

WORKDIR /app
COPY --from=builder /app/main .

CMD ["./main"]
