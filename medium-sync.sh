#!/usr/bin/env bash

bundle update && bundle install

ruby -ropen-uri -e "File.write('.rss.xml', URI.open('https://medium.com/feed/@marconak-matej').read)"
bundle exec jekyll import rss --source .rss.xml --canonical_link true --extract_tags category
