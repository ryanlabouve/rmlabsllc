git branch -D gh-pages
git co -b gh-pages
npm run prod
JEKYLL_ENV=production bundle exec jekyll build
rm -rf ./dist
rm -rf $(ls | sort -u | grep -Ev '_site|deploy.sh')
mv _site/* .
git add .
git commit -m "Deploy"
git push origin gh-pages -f
git co master