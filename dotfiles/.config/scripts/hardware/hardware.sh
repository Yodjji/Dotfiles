tempCPU=`sensors 2> /dev/null | grep "cpu" | awk '{print $2}'`

cust_memory(){
    mem_used=`free -h | head -2 | tail -1 | tr -d '' | cut -d " " -f 20`
    mem_total=`free -m | head -2 | tail -1 | tr -d '' | cut -d " " -f 12`
    bytes_size=1024

    size=`echo "scale=2 ; $mem_total / $bytes_size" | bc`

    echo "Mem:" $mem_used "/" $size"Gi"
}


home_disk_usage(){
    home_used=`df -BM --output=used /dev/nvme0n1p7 | tail -1 | tr -d 'M'`
    home_size=`df -BM --output=size /dev/nvme0n1p7 | tail -1 | tr -d 'M'`
    bytes_size=1024

    size=`echo "scale=1 ; $home_size / $bytes_size" | bc`
    used=`echo "scale=1 ; $home_used / $bytes_size" | bc`

    echo $used"G" "/" $size"G"
}


root_disk_usage(){
    root_used=`df -BM --output=used /dev/nvme0n1p6 | tail -1 | tr -d 'M'`
    root_size=`df -BM --output=size /dev/nvme0n1p6 | tail -1 | tr -d 'M'`
    bytes_size=1024

    size=`echo "scale=1 ; $root_size / $bytes_size" | bc`
    used=`echo "scale=1 ; $root_used / $bytes_size" | bc`

    echo $used"G" "/" $size"G"
}


swap_disk_usage(){
    swap_used=`df -BM --output=used /dev/nvme0n1p5 | tail -1 | tr -d 'M'`
    swap_size=`df -BM --output=size /dev/nvme0n1p5 | tail -1 | tr -d 'M'`
    bytes_size=1024

    size=`echo "scale=1 ; $swap_size / $bytes_size" | bc`
    used=`echo "scale=1 ; $swap_used / $bytes_size" | bc`

    echo $used"G" "/" $size"G"
}

internet_connection(){
    download=`speedtest-cli | grep "Download" | awk '{print $2}'`
    upload=`speedtest-cli | grep "Upload" | awk '{print $2}'`
    ping=`speedtest-cli | grep "Hosted" | awk '{print $8}'`

    echo "Download speed: $download Mbit/s 
Upload speed: $upload Mbit/s 
Ping: $ping ms"
}

main(){
    echo "Temp CPU: $tempCPU"
    cust_memory
    echo "HD:" `home_disk_usage`
    echo "RD:" `root_disk_usage`
    echo "Swap:" `swap_disk_usage`
}

# notify-send "System status:" $"Temp CPU: $tempCPU\n RAM: `cust_memory`\nRD: `root_disk_usage`\nHD: `home_disk_usage`\nSwap: `swap_disk_usage`\nInternet connection: \n`internet_connection`"
notify-send "Disk status:" $"\nRD: `root_disk_usage`\nHD: `home_disk_usage`\nSwap: `swap_disk_usage`\n"
# notify-send "Please wait..."
# echo "Disk status: 
# RD: `root_disk_usage`
# HD: `home_disk_usage`
# Swap: `swap_disk_usage`"
