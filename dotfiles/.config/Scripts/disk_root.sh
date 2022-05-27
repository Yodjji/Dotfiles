echo `df -h --output=used / | tail -1 | tr -d ''` "/" `df -h --output=size / | tail -1 | tr -d ''`
