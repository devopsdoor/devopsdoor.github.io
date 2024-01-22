#/bin/bash

LATEST_BLOG=`ls -1tr _posts | tail -1`
DEVOPSDOOR_HOME="/Users/basil/projects/devopsdoor.github.io"
BLOG_URL="blog"
bundle exec jekyll build
cp -prf _site/* $DEVOPSDOOR_HOME/$BLOG_URL
rm $DEVOPSDOOR_HOME/$BLOG_URL/robots.txt
cd $DEVOPSDOOR_HOME
cp -prf $BLOG_URL/sitemap.xml ./
git add $BLOG_URL
git commit -m "$LATEST_BLOG"
git push origin main
