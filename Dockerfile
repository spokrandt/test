FROM spokrandt/alpine-rails5:latest 
RUN adduser -S app ; \
    gem install -N io-like -v '0.3.0'; \
    gem install -N archive-zip -v '0.11.0'; \
    gem install -N execjs -v '2.7.0'; \
    gem install -N autoprefixer-rails -v '8.6.5'; \
    gem install -N bcrypt -v '3.1.12' ; \
    gem install -N bindex -v '0.5.0'; \
    gem install -N msgpack -v '1.2.4'; \
    gem install -N bootsnap -v '1.3.1'; \
    gem install -N popper_js -v '1.12.9'
USER app 
COPY . /app
WORKDIR /app
RUN ["/app/bin/bundle", "install"]
EXPOSE 3000
ENTRYPOINT ["/app/bin/entry"]
CMD ["/app/bin/rails","server","-b","0.0.0.0","-p","3000"]
