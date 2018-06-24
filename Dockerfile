FROM golang
WORKDIR /go/src/hello-app
COPY . /go/src/hello-app
RUN go get ./
RUN go build -o main
CMD [ "./main" ]