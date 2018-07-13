FROM ruby:2.3
UN apt-get update \
    && apt-get install -y --no-install-recommends \
       mysql \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]

