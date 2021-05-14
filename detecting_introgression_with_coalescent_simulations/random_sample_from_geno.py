# this script will take 1000 samples of 20000 sites from 
# the associated regions and output a new fasta file
# we will either have a geno file with 4 samples or 3 samples.
# the script will excute different code depending on that.

import sys
from random import sample 
import pandas as pd

inputfile=open(sys.argv[1],"r")
chromosome=int(sys.argv[2])

# read input lines:
lines=inputfile.readlines()

for i in range(1000):
	outname='chr_{}_sample_{}.geno'.format(chromosome,i)
	output=open(outname,"w")
	
	header=lines[0]
	output.write(header)
	
	subset=sample(lines[1:],20000)
	output.writelines(subset)
	output.close()
	
inputfile.close()
	
