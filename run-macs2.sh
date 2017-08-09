#!/bin/bash

set +x

inputFile=`cat`
outputPath=$1
fileName=`basename $inputFile`

/home/eecs/gunjan/envs/gunjan/bin/macs2 callpeak -t ${inputFile} -n ${fileName} --outdir ${outputPath}/${fileName}_output
echo file:${outputPath}/${fileName}_output/${fileName}_summits.bed

