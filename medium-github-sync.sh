#!/usr/bin/env bash

bundle update && bundle install

ruby -ropen-uri -e "File.write('.rss.xml', URI.open('https://medium.com/feed/@marconak-matej').read)"
bundle exec jekyll import rss --source .rss.xml --canonical_link true --extract_tags category


echo "Adding _posts"
git add _posts

echo "Check if there are some new _posts"

if ! (git diff --staged --quiet --exit-code); then

      echo "Commiting changes"
      git commit -m 'chore: import blogs from medium'

      echo "Pushing changes"
      git push origin main
  fi

