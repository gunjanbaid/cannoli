#!/bin/bash

set +x

inputFile=`cat`
outputPath=$1

macs2 callpeak -t ${inputFile} -n ${inputFile} --outdir ${outputPath}/${inputFile}_output
cat ${outputPath}/${inputFile}_output/${inputFile}_summits.bed
