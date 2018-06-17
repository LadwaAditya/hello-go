FROM golang
RUN mkdir /app
COPY . /go/src/github.com/LadwaAditya/hello-go/
WORKDIR /go/src/github.com/LadwaAditya/hello-go/
RUN go get ./
RUN go build -o main
CMD [ "./main" ]