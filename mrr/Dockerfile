FROM alpine as builder

COPY . .

RUN apk upgrade; \
apk add build-base linux-headers; \
make

FROM alpine
COPY --from=builder /mrr /

ENTRYPOINT ["/mrr"]


