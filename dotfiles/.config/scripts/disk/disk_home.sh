#!/bin/bash

home_disk_usage(){
    home_used=`df -BM --output=used /dev/nvme0n1p10 | tail -1 | tr -d 'M'`
    home_size=`df -BM --output=size /dev/nvme0n1p10 | tail -1 | tr -d 'M'`
    bytes_size=1024

    size=`echo "scale=1 ; $home_size / $bytes_size" | bc`
    used=`echo "scale=1 ; $home_used / $bytes_size" | bc`

    echo $used"G" "/" $size"G"
}


root_disk_usage(){
    root_used=`df -BM --output=used /dev/nvme0n1p9 | tail -1 | tr -d 'M'`
    root_size=`df -BM --output=size /dev/nvme0n1p9 | tail -1 | tr -d 'M'`
    bytes_size=1024

    size=`echo "scale=1 ; $root_size / $bytes_size" | bc`
    used=`echo "scale=1 ; $root_used / $bytes_size" | bc`

    echo $used"G" "/" $size"G"
}


swap_disk_usage(){
    swap_used=`df -BM --output=used /dev/nvme0n1p8 | tail -1 | tr -d 'M'`
    swap_size=`df -BM --output=size /dev/nvme0n1p8 | tail -1 | tr -d 'M'`
    bytes_size=1024

    size=`echo "scale=1 ; $swap_size / $bytes_size" | bc`
    used=`echo "scale=1 ; $swap_used / $bytes_size" | bc`

    echo $used"G" "/" $size"G"
}


main(){
    home_disk_usage
    root_disk_usage
    swap_disk_usage
}

main
