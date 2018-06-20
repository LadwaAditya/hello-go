FROM golang
WORKDIR /go/src/app
COPY . /go/src/app
RUN go get ./
RUN go build -o main
CMD [ "./main" ]