FROM ubuntu:trusty

RUN apt-get update && apt-get install -y git curl libv8-3.14.5 supervisor

RUN curl -sSL https://get.rvm.io | bash -s stable\
exec $SHELL -l << ASLOGINSHELL\
  rvmsudo rvm requirements\
  rvm use --default ruby-2.4.1 --binary --install\
  gem install bundler\
ASLOGINSHELL

#RUN exec $SHELL -l << ASLOGINSHELL\
#  pushd /app/src\
#    bundle install\
#  popd\
#ASLOGINSHELL

EXPOSE 4000/tcp

VOLUME ["/app"]
WORKDIR /app

ENTRYPOINT ["bash", "-l", "-c", "bundle install && bundle exec jekyll serve --watch --force_polling"]
