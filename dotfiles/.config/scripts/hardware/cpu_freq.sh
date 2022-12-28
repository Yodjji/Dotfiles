#!/bin/bash

perf='performance' 
pows='powersave'

read -p "Inter powermode for your cpu (performance - perf, powersave - pows): " mode

if [[ $mode == perf ]]; then
  `sudo cpupower frequency-set -g $perf -d 2100000 -u 4056000`
  echo 'Now activate performance mode'
else
  `sudo cpupower frequency-set -g $pows -d 1700000 -u 2100000`
  echo 'Now activate powersave mode'
fi
