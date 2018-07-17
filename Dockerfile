FROM spokrandt/alpine-rails5:latest 
RUN adduser -S app -h /app ; \
    chown app /app; \
    gem install -N io-like -v '0.3.0'; \
    gem install -N archive-zip -v '0.11.0'; \
    gem install -N execjs -v '2.7.0'; \
    gem install -N autoprefixer-rails -v '8.6.5'; \
    gem install -N bcrypt -v '3.1.12' ; \
    gem install -N bindex -v '0.5.0'; \
    gem install -N msgpack -v '1.2.4'; \
    gem install -N bootsnap -v '1.3.1'; \
    gem install -N popper_js -v '1.12.9'; \
    gem install -N rb-fsevent -v '0.10.3'; \
    gem install -N ffi -v '1.9.25'; \
    gem install -N rb-inotify -v '0.9.10'; \ 
    gem install -N sass-listen -v '4.0.0'; \
    gem install -N sass -v '3.5.6'; \
    gem install -N bootstrap -v '4.1.1'; \
    gem install -N bootstrap-sass-extras -v '0.0.7'; \
    gem install -N byebug -v '10.0.2'
USER app 
COPY . /app
WORKDIR /app
RUN ["/app/bin/bundle", "install"]
EXPOSE 3000
ENTRYPOINT ["/app/bin/entry"]
CMD ["/app/bin/rails","server","-b","0.0.0.0","-p","3000"]
