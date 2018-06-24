FROM golang as builder
#Set Working dirictory
WORKDIR /go/src/app
#Copy source code to container
COPY . /go/src/app
#Install dependencies
RUN go get ./
#Build the app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main

# use a minimal alpine image
FROM alpine:3.7
# add ca-certificates in case you need them
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
# set working directory
WORKDIR /root
# copy the binary from builder
COPY --from=builder /go/src/app/main .
# run the binary
CMD ["./main"]