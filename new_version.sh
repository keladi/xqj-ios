tag=`date +"%Y%m%d.%H%M.%S"`
echo $tag
git add .
git commit -a -m "$tag"
git tag "$tag"
git push origin --tags
