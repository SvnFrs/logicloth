# Start from the latest golang base image
FROM golang:latest

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY . .

RUN go build -v -o /usr/local/bin/app ./...

EXPOSE 3030

CMD ["app"]
