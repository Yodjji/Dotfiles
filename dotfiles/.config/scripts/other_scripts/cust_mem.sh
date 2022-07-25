#!/bin/bash

mem_used=`free -h | head -2 | tail -1 | tr -d 'i' | cut -d " " -f 20`
mem_total=`free -m | head -2 | tail -1 | tr -d 'i' | cut -d " " -f 12`
bytes_size=1024

size=`echo "scale=2 ; $mem_total / $bytes_size" | bc`


echo "Mem:" $mem_used "/" $size"G"
# echo $used"G" "/" $size"G"

