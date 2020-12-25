#!/usr/bin/env sh

username="$1"

echo "Vagrant-Control: Checking Vagrant Boxes to suspend"
for vm in $(su -c "vagrant global-status" $username | awk '/running/{ print $1 } '); do
        su -c "vagrant suspend ${vm}" $username &
        pids[${i}]=$!
        echo "Vagrant-Control: suspending: ${vm}: ${pids[$i]}"
done

for pid in ${pids[*]}; do 
        wait $pid
	echo "Done: $pid"
done

for vm in $(su -c "vagrant global-status" $username | awk '/default/{ print $1 } '); do
	echo "Vagrant-Control: checking status of $vm"
	status=$(su -c "vagrant status $vm" $username | awk '/default/{print $2 $3}')
	echo "Vagrant-Control: status of $vm: $status"
done

