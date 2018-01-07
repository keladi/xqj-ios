tag=`cat v.txt`
sed "s/{{tag}}/$tag/g" XqjServ.podspec.tpl > XqjServ.podspec
