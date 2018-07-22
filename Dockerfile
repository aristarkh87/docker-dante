FROM alpine

ENV DANTE_VER 1.4.2
ENV DANTE_URL https://www.inet.no/dante/files/dante-$DANTE_VER.tar.gz
ENV DANTE_SHA 4c97cff23e5c9b00ca1ec8a95ab22972813921d7fbf60fc453e3e06382fc38a7
ENV DANTE_FILE dante.tar.gz
ENV DANTE_TEMP dante

RUN set -xe \
    && apk add --no-cache \
        linux-pam \
    && apk add --no-cache -t .build-deps \
        build-base \
        curl \
        linux-pam-dev \
    && mkdir $DANTE_TEMP \
        && cd $DANTE_TEMP \
        && curl -sSL $DANTE_URL -o $DANTE_FILE \
        && echo "$DANTE_SHA *$DANTE_FILE" | sha256sum -c \
        && tar xzf $DANTE_FILE --strip 1 \
        && ac_cv_func_sched_setscheduler=no ./configure \
        && make install \
        && cd .. \
        && rm -rf $DANTE_TEMP \
    && apk del --purge .build-deps

EXPOSE 1080

CMD ["sockd"]
