pod_lint:
	pod spec lint
pod_push:
	pod trunk push
git_push:
	sh new_version.sh
replace_v:
	sh replace_spec.sh
new_ver:git_push replace_v pod_push
