#!/usr/bin/env sh
username=$1

if [ -z $username ]; then
	echo "Please provide a username to check"
	exit $1
fi

for vm in $(su -c "vagrant global-status" $username | awk '/default/{ print $1 } '); do
	echo '----------------------'
	echo "checking status of $vm"
	status="$(su -c "vagrant status $vm" $username | awk '/default/{print $2 $3}')"
	echo "status of $vm: $status"
done

