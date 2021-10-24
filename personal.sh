#!/bin/bash

source gcloud.sh

function upload_public_tmp() {
	FILE_TO_UPLOAD="${1}"
	UPLOAD_REMOTE="gs://b0noi-tmp/${FILE_TO_UPLOAD}"
	LINK="https://storage.googleapis.com/b0noi-tmp/${FILE_TO_UPLOAD}"
	gsutil -o GSUtil:parallel_composite_upload_threshold=500M cp "${FILE_TO_UPLOAD}" "${UPLOAD_REMOTE}"
	make_public "${UPLOAD_REMOTE}"
	echo "link: ${LINK}"
}

alias gcloud_auth_set_academy="gcloud config set account viacheslav@kovalevskyi.academy"
alias gcloud_auth_set_main="gcloud config set account kovalevskyi.viacheslav@gmail.com"
