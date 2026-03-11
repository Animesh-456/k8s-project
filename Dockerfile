# Build stage
FROM golang:1.25-alpine AS builder

WORKDIR /app
COPY go.mod go.sum /
COPY . .

RUN go build -tags=prod -o backend

# Runtime stage
FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/backend .

EXPOSE 3000
CMD ["./backend"]