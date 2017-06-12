#!/bin/sh
yarn && bundle install && bundle exec jekyll serve --watch --force_polling
