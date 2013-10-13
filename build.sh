#!/bin/bash
set -x
set -e

TEMPIMAGE="$(uuidgen)"
VER=12.04.3

cat << EOF > Dockerfile
FROM ibuildthecloud/ubuntu-core:${VER}
ADD ubuntu-kvm.sh /
EOF

docker build -t $TEMPIMAGE .

ID=$(docker run -privileged=true -d $TEMPIMAGE /ubuntu-kvm.sh)

docker attach $ID
docker wait $ID
docker commit $ID ibuildthecloud/ubuntu-kvm ${VER}

rm Dockerfile
