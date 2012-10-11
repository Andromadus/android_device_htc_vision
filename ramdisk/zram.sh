#!/system/bin/sh
#
# ZRAM activation
#
# Copyright (C) 2012 The CyanogenMod Project
#      Author: Humberto Borba <humberos@gmail.com>
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ZRAM="persist.service.zram"

if [ "$(getprop $ZRAM)" = "0" ]; then

    busybox echo "[ZRAM]: NOT ACTIVATED.";
    exit 1

else

    busybox echo "[ZRAM]: INIT";

    if ! busybox test -e /sys/block/zram0/disksize ; then

        busybox echo "[ZRAM]: ERROR unable to find /sys/block/zram0/disksize";
        busybox echo "[ZRAM]: NOT ACTIVATED IN KERNEL.";
        exit 1

    else

        ZRAM_VALUE="$(getprop $ZRAM)"
        busybox echo "[ZRAM]: ZRAM_VALUE $ZRAM_VALUE";

        RAM_SIZE=`busybox cat /proc/meminfo | awk 'match($1,"MemTotal") == 1 {print $2}'`
        let "RAM_SIZE *= 1024"
        busybox echo "[ZRAM]: RAM_SIZE $RAM_SIZE";

        let "RAM_SIZE/=100"
        DISKSIZE=$(($RAM_SIZE * $ZRAM_VALUE))
        busybox echo "[ZRAM]: DISKSIZE $DISKSIZE";

        if (( "$DISKSIZE" > 0 )) ; then

            busybox echo "[ZRAM]: Setting ZRAM disksize.";
            busybox echo $DISKSIZE > /sys/block/zram0/disksize

            busybox echo "[ZRAM]: Starting ZRAM.";
            busybox mkswap /dev/block/zram0
            busybox swapon /dev/block/zram0
            busybox echo "[ZRAM]: ACTIVATED.";

        else

            busybox echo "[ZRAM]: Invalid Disk Size.";
            exit 1

        fi

    fi

fi

exit 0
