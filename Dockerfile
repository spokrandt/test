FROM alpine:latest
ENV BUILD_PACKAGES="curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev libxml2-dev" \
    RUBY_PACKAGES="ruby ruby-io-console ruby-json yaml nodejs" \
    RAILS_VERSION="5.2.0"

RUN \
  apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES && \
  gem install -N bundler
 
RUN \
  gem install -N pkg-config -v "~> 1.1" && \
  gem install -N nokogiri && \
  gem install -N rails --version "$RAILS_VERSION" && \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \

  # cleanup and settings
  bundle config --global build.nokogiri "--use-system-libraries" && \
  bundle config --global build.nokogumbo "--use-system-libraries" && \
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/lib/lib/ruby/gems/*/cache/* && \
  rm -rf ~/.gem

EXPOSE 3000
ENTRYPOINT ["entry"]
CMD ["rails","server","-b","0.0.0.0","-p","3000"]
