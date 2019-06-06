FROM golang:latest

# Set go bin which doesn't appear to be set already.
ENV GOBIN /go/bin

# build directories
RUN mkdir -p /go/src/app/server
COPY ./server/Gopkg* /go/src/app/server/
WORKDIR /go/src/app

# Go dep!
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

# Build my app
#RUN go build -o /app/main .
#CMD ["/app/main"]

#RUN cd server && dep ensure -v

COPY . /go/src/app

RUN make server
