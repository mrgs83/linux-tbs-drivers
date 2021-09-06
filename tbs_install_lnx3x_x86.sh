#!/bin/bash

make distclean

echo "TBS drivers set for x86 Linux 3.x"
./v4l/tbs-x86_r3.sh
#./v4l/tbs-dvbc-x86_r3.sh

# Enable some staging drivers
make stagingconfig

echo "TBS drivers building..."
make -j2

echo "TBS drivers installing..."
sudo rm -r -f /lib/modules/$(uname -r)/updates/extra
sudo make install

echo "TBS drivers installation done"
echo "You need to reboot..."
