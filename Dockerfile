# Stage 1: Build
FROM golang:1.22-alpine AS builder

WORKDIR /app

# Copy everything first
COPY . .

# Tidy and download in one step
RUN go mod tidy && go mod download

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o backend .

# Stage 2: Run
FROM alpine

WORKDIR /app

COPY --from=builder /app/backend .

EXPOSE 3000

CMD ["./backend"]