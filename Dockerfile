FROM alpine:3.7

ENV VERSION v1.8-rc1

WORKDIR /srv

RUN set -xe && \
    mkdir /config && \
    apk add --no-cache unzip curl ca-certificates && \
    curl -fsSLO --compressed "https://github.com/shawn1m/overture/releases/download/${VERSION}/overture-linux-arm64.zip" && \
    unzip -o "overture-linux-arm64.zip" -d /srv && \
    rm -rf "overture-linux-arm64.zip" && \
    cp -rf /srv/config.yml /config/ && \
    apk del unzip curl

VOLUME [ "/config" ]

CMD [ "/srv/overture-linux-arm64", "-c", "/config/config.yml" ]
