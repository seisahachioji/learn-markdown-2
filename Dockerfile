FROM ubuntu:trusty

RUN apt-get update && apt-get install -y git curl libv8-3.14.5 supervisor

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo 'deb https://dl.yarnpkg.com/debian/ stable main' | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

RUN bash -l -c 'curl -sSL https://get.rvm.io | bash -s stable'
RUN bash -l -c 'rvm requirements'
RUN bash -l -c 'rvm use --default ruby-2.4.1 --binary --install'
RUN bash -l -c 'gem install bundler'

COPY run_jekyll.sh /run_jekyll.sh

EXPOSE 4000/tcp

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["bash", "-l", "/run_jekyll.sh"]
