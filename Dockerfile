FROM  golang:alpine

WORKDIR /app

COPY . .

RUN go build  -ldflags "-s -w" -o hello .

FROM scratch

COPY --from=0 /app/hello /usr/local/bin/hello

CMD [ "hello" ]