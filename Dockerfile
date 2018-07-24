FROM ruby:latest

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        mysql-client sqlite \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
ENTRYPOINT [ "/usr/src/app/entry-point.sh" ]
CMD ["/usr/src/app/bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]
