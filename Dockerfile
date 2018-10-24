FROM ruby:2.2.4-alpine 

ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

ENV BUILD_PACKAGES curl-dev build-base bash tzdata file libxml2 linux-headers libffi-dev libxslt-dev
ENV RUBY_PACKAGES postgresql-dev postgresql-client tzdata wget
ENV WKHTMLTOPDF_PACKAGES gtk+ glib ttf-freefont fontconfig dbus

RUN apk add --no-cache \
    $BUILD_PACKAGES \
    $RUBY_PACKAGES \
    $WKHTMLTOPDF_PACKAGES \
    git \
    imagemagick \
    less

RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/main \
    libuv \
    nodejs \
    nodejs-npm && \
  npm install -g yarn istanbul codo

RUN wget --no-check-certificate https://github.com/kernix/wkhtmltopdf-docker-alpine/raw/master/wkhtmltopdf -P /usr/bin/
RUN chmod a+x /usr/bin/wkhtmltopdf

RUN gem install bundler --no-ri --no-rdoc
