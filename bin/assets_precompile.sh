# compile resume
cd /home/piousbox/projects/microsites2-compiler/
git checkout resume3
git pull origin resume3
git checkout master-resume
git merge resume3
cd vendor && rm -rf assets && ln -s /home/piousbox/projects/ish_lib/vendor/assets .
bundle
bundle exec rake assets:precompile
git add .
git add -u
git commit -m "adding assets `date +"%Y-%m-%d"`"
git push origin master-resume
echo 'Resume compiled.'

