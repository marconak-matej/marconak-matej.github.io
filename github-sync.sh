#!/usr/bin/env bash

echo "Adding _posts"
git add _posts

echo "Check if there are some new _posts"

if ! (git diff --staged --quiet --exit-code); then

      echo "Commiting changes"
      git commit -m 'chore: import blogs from medium'

      echo "Pushing changes"
      git push origin main
  fi



