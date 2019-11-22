set -e
echo `pwd`
m=`git status`
nothingComit="nothing to commit"
if [[ $m =~ $nothingComit ]];
then
echo "exist"
else
git add .
git commit -m "提交"
git push origin master
fi

