#!/bin/sh
set -x
set -e

HOME_DIR=/opt
role=$1

cd ${HOME_DIR}
wget https://raw.githubusercontent.com/yudong2015/HBase/2.4.4-v3.0.0-dev/src/scripts/migrate.sh
wget https://raw.githubusercontent.com/yudong2015/HBase/2.4.4-v3.0.0-dev/src/scripts/make_image.sh

sh make_image.sh
if [ "x$role" = "xclient" ]
then
    sh migrate.sh client
else
    sh migrate.sh node
fi

rm ${HOME_DIR}/migrate.sh ${HOME_DIR}/make_image.sh

echo "Done"