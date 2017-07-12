#!/bin/bash

set +x

macs2 callpeak -t /dev/stdin
cat NA_summits.bed
