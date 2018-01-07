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
new_ver:git_push replace_v pod_push update_repo
