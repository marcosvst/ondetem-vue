#!/usr/bin/env sh

# abort on errors
set -e

git init
git add -A
git commit -m "fist commit"


git remote add origin https://github.com/marcosvst/ondetem-vue.git
git branch -M master


git checkout -b gh-pages

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push origin gh-pages

cd -