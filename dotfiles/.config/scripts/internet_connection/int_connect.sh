download=`speedtest-cli | grep "Download" | awk '{print $2}'`
upload=`speedtest-cli | grep "Upload" | awk '{print $2}'`
ping=`speedtest-cli | grep "Hosted" | awk '{print $8}'`

echo "Download speed: $download Mbit/s 
Upload speed: $upload Mbit/s 
Ping: $ping ms"
