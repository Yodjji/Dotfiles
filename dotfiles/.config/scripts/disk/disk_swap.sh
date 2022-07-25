#!/bin/bash
swap_used=`df -BM --output=used /dev/nvme0n1p8 | tail -1 | tr -d 'M'`
swap_size=`df -BM --output=size /dev/nvme0n1p8 | tail -1 | tr -d 'M'`
bytes_size=1024

size=`echo "scale=1 ; $swap_size / $bytes_size" | bc`
used=`echo "scale=1 ; $swap_used / $bytes_size" | bc`

echo $used"G" "/" $size"G"