FROM golang:latest

WORKDIR /app
RUN git clone https://github.com/kumina/unbound_exporter.git /app
RUN go get -d ./...
RUN CGO_ENABLED=0 GOOS=linux go build --ldflags '-extldflags "-static"' -o unbound_exporter
RUN strip unbound_exporter

FROM alpine:latest  
WORKDIR /root
COPY --from=0 /app/unbound_exporter .

EXPOSE 9167
CMD ["./unbound_exporter"]  

# COPY app.go .
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

