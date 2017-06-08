FROM ubuntu:trusty

RUN apt-get update && apt-get install -y git curl libv8-3.14.5 supervisor

RUN curl -sSL https://get.rvm.io | bash -s stable
RUN rvm requirements
RUN rvm use --default ruby-2.4.1 --binary --install
RUN gem install bundler

EXPOSE 4000/tcp

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["bash", "-l", "-c", "bundle install && bundle exec jekyll serve --watch --force_polling"]
