#!/bin/bash

set +x
uuid=$(uuidgen)
tee /tmp/datafile-${uuid} > /dev/null
#rm -r -f NA_summits.bed
/home/eecs/gunjan/envs/gunjan/bin/macs2 callpeak -t /tmp/datafile-${uuid} --verbose 0 --outdir /tmp -n ${uuid}
#fileName=HELLO
#awk -v file="$fileName" 'BEGIN{OFS="\t"}{$4=file}1' NA_summits.bed
#if [ -f /tmp/*summits.bed ]; then
#    cat /tmp/*summits.bed
#fi

cat /tmp/${uuid}_summits.bed 2>/dev/null

rm -rf /tmp/datafile-${uuid}
rm -rf /tmp/${uuid}_summits.bed
rm -rf /tmp/${uuid}_peaks.xls
rm -rf /tmp/${uuid}_model.r 
rm -rf /tmp/${uuid}_peaks.narrowPeak


#tee hi.txt > /dev/null
#cp /home/eecs/gunjan/all-adam/cannoli/test.bed gunjan.bed
#cat gunjan.bed
#/home/eecs/gunjan/envs/gunjan/bin/macs2 callpeak -t test.bed -n HI

#cat /home/eecs/gunjan/all-adam/cannoli/test.bed
#cat HI_summits.bed

