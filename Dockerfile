FROM lsiobase/nginx:3.9

# set version label
ARG BUILD_DATE
ARG VERSION

LABEL build_version="Digitalhigh version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Digitalhigh"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache \
	curl \
	php-curl \
	php-xml

# add local files
COPY root/ /

# ports and volumes
EXPOSE 80
VOLUME /config