#!/usr/bin/env bash

os=$(getOsFamily)
if [[ "$os" = "rhel" ]]; then
	sudo rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
	sudo yum update
	sudo yum install dotnet-sdk-2.2
fi
