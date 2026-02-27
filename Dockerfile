# Stage 1: Build
FROM golang:1.22-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o backend .

# Stage 2: Run
FROM alpine

WORKDIR /app

COPY --from=builder /app/backend .

EXPOSE 3000

CMD ["./backend"]