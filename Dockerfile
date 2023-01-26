# mkgmap-docker
FROM peatfaerie/gpsbabel:latest as base
FROM eclipse-temurin:19-jre-alpine
LABEL maintainer=https:/github.com/peatfaerie

ARG MKGMAP_VERSION=r4905

WORKDIR /opt

RUN wget http://www.mkgmap.org.uk/download/mkgmap-${MKGMAP_VERSION}.zip \
    && unzip mkgmap-${MKGMAP_VERSION}.zip \
    && mv mkgmap-${MKGMAP_VERSION} mkgmap \
    && rm mkgmap-${MKGMAP_VERSION}.zip \
    && rm -rf mkgmap/{doc,examples}

RUN apk add --no-cache --update qt5-qtbase libusb

COPY --from=base /usr/local/bin/gpsbabel /usr/local/bin/gpsbabel

ENTRYPOINT ["java","-jar","/opt/mkgmap/mkgmap.jar"]
