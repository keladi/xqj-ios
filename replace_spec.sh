tag=`cat v.txt`
sed "s/{{tag}}/$tag/g" XqjModel.podspec.tpl
