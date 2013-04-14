#!/bin/bash

HOST_BASE=${HOST_BASE-"CZ"}

error() {
	echo "<ERROR>"
	echo "$@"
	exit 1
}

nssh() {
	ssh -i $SSH_KEY
}
export nssh

nscp() {
	scp -i $SSH_KEY
}
export nscp

nenum() {
	avahi-browse -t -k _ssh._tcp | grep $HOST_BASE
}
export nenum
