#!/bin/bash

HOST_BASE=${HOST_BASE-"CZ"}
SSH_KEY=`dirname $0`/configs/common/keys/ssh_key

error() {
	echo "<ERROR>"
	echo "$@"
	exit 1
}

nssh() {
	ssh -i $SSH_KEY $@
}
export nssh

nscp() {
	scp -i $SSH_KEY $@
}
export nscp

nenum() {
	avahi-browse -t -k _ssh._tcp | grep $HOST_BASE | cut -f9 -d' '
}
export nenum
