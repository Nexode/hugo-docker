FROM alpine:3.8 as build

ENV HUGO_VERSION 0.53

RUN cd /tmp && \
    apk add --no-cache wget && \
    wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar xzfv hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    find .

FROM scratch
COPY --from=build /tmp/hugo /hugo

ENTRYPOINT ["/hugo"]
CMD ["--help"]
