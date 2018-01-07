pod_lint:
	pod spec lint
pod_push:
	pod trunk push
git_push:
	sh new_version.sh
replace_v:
	sh replace_spec.sh
update_repo:
	pod setup
	say 刷新缓存完成
new_ver:git_push replace_v pod_push
m5:
	m5 -p xqj -t ios
	cp -a /tmp/m5/xqj/ios/* /Volumes/d01/projects/xqj/models/ios/XqjIos
