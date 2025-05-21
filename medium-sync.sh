#!/usr/bin/env bash

bundle update && bundle install
curl https://medium.com/feed/@marconak-matej > .rss.xml
bundle exec jekyll import rss --source .rss.xml --canonical_link true --extract_tags category
