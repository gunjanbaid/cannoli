#!/bin/bash

set +x

# input=`cat`

# Mapping quality replaced with source file name
# since MACS2 does not use mapping quality.
# fileName=`echo ${input} | head -1 | awk '{print $11}'`

# data files will be stored in inDir
# MACS2 output files will be stored in outDir
inDir=/tmp/cannoliMacs2/input
outDir=/tmp/cannoliMacs2/output

# save each file locally on worker nodes
# MACS2 must read from files, cannot read from stdin
# echo ${input} | tee ${inDir}/${fileName} > /dev/null

# run MACS2
# macs2 callpeak -t ${inDir}/${fileName} -n ${fileName} --outdir ${outDir}

# replace name field in MACS2 BED output file with source file name
# save BED entries to a variable
# output=`awk -v file="$fileName" 'BEGIN{OFS="\t"}{$4=file}1' ${outDir}/${fileName}_summits.bed`

# Delete files created by MACS2
# rm -r -f /tmp/cannoliMacs2

# pipe out entries from MACS2 BED output file
# echo ${output}

cat /home/eecs/gunjan/all-adam/cannoli/test.bed
