#!/bin/bash
root_used=`df -BM --output=used /dev/nvme0n1p9 | tail -1 | tr -d 'M'`
root_size=`df -BM --output=size /dev/nvme0n1p9 | tail -1 | tr -d 'M'`
bytes_size=1024

size=`echo "scale=1 ; $root_size / $bytes_size" | bc`
used=`echo "scale=1 ; $root_used / $bytes_size" | bc`

echo $used"G" "/" $size"G"