echo `df -h --output=used /dev/nvme0n1p10 | tail -1 | tr -d ''` "/" `df -h --output=size /dev/nvme0n1p10 | tail -1 | tr -d ''`
