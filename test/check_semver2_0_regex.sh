#!/bin/bash

MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"

function check_version
{
	if ! [[ ${IMAGE_TAG} =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?$ ]]
	then
		echo "Version ${IMAGE_TAG}: semver2.0 KO"
	else
		echo "Version ${IMAGE_TAG}: semver2.0 OK"
	fi
}

echo "Checking valid versions"
for IMAGE_TAG in $(cat ${MY_PATH}/valid_versions.txt)
do 
	check_version
done

echo -e "\nChecking invalid versions"
for IMAGE_TAG in $(cat ${MY_PATH}/invalid_versions.txt)
do
        check_version
done


