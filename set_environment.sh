#!/bin/bash

source `dirname $0`/common.sh

TARGET=${1-ar71xx}
SSH_KEY="$PWD/configs/common/keys/ssh_key"

[ ! -d configs/$TARGET ] && error target does not exist

echo "Updating feeds"
scripts/feeds update -a
scripts/feeds install -a

echo "Copying config"
cp -f configs/$TARGET/config .config || error config for this target does not exist

echo "Copying files"
[ ! -e files ] && mkdir files
[ -d configs/common/files ] && cp -rf configs/common/files/* files/ 2>/dev/null
[ -d configs/$TARGET/files ] && cp -rf configs/$TARGET/files/* files/ 2>/dev/null
echo "HOST_BASE=$HOST_BASE" > files/etc/confvars 2>/dev/null

# authorized_keys is already in files/
# git can't save these permissions :/
chmod 600 $SSH_KEY
