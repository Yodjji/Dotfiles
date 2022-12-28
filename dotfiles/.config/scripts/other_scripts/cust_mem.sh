#!/bin/bash

MEM=$(free -h --kilo | awk '/^Mem:/ {print $3 "/" $2}')

echo $MEM
