set -e

m=`git status`
if [[ -n "${m}" ]];
then
git add .
git commit -m "提交"
git push origin master
fi

