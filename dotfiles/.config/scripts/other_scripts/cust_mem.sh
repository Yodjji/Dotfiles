#!/bin/bash

MEM=$(free -h --giga | awk '/^Mem:/ {print $3 "/" $2}')
echo $MEM
