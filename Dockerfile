FROM alpine:3.5

RUN apk add --no-cache gcc musl-dev make

WORKDIR /
ADD . /ttt
RUN cd ttt/; DESTDIR=/usr make all install
CMD ["ttt"]
