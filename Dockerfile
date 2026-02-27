FROM alpine 

WORKDIR /app

COPY backend .

EXPOSE 3000

CMD ["./backend"]