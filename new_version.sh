tag=`date +"%Y%m%d.%H%M.%S"`

git add .
git commit -a -m "$tag"
git tag "$tag"
git push origin --tags
echo $tag |pbcopy
echo $tag
echo $tag > v.txt
