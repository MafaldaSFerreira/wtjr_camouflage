#!/usr/bin/awk -f 

#FILE=$1
{OFS="\t"; if (!/^#/){print $1,$2-1,$2,$4"/"$5,"+"}}