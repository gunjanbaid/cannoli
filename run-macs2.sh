#!/bin/bash

set +x

# generate unique ID for each partition
# so files with default names not overwritten
uuid=$(uuidgen)
# save input BAM records to a temp file
tee /tmp/datafile-${uuid} > /dev/null

# qname column replaced with original filename
# extract original filename
name=`/home/eecs/gunjan/envs/gunjan/bin/samtools view /tmp/datafile-${uuid} | head -1 | cut -f1`
/home/eecs/gunjan/envs/gunjan/bin/macs2 callpeak -t /tmp/datafile-${uuid} --verbose 0 --outdir /tmp -n ${uuid}

# replace name column with original filename
# output BED records
awk -v file="$name" 'BEGIN{OFS="\t"}{$4=file}1' /tmp/${uuid}_summits.bed 2>/dev/null

# clean up temp datafile and all MACS2 files
rm -rf /tmp/datafile-${uuid}
rm -rf /tmp/${uuid}_summits.bed
rm -rf /tmp/${uuid}_peaks.xls
rm -rf /tmp/${uuid}_model.r 
rm -rf /tmp/${uuid}_peaks.narrowPeak

