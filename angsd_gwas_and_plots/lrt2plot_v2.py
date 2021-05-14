########################################################
# Script to convert the LRT output of ANGSD to -log10(Pvalues)
# This is version 2 of a script originally written by Ines Miranda from CIBIO-InBIO
# My modification maintains the original name of the scaffolds in the final output
# Version two assumes we are dealing with the output of a case control test from ANGSD
# Writen by Mafalda S. Ferreira
########################################################

import sys
from scipy import stats
import math

stats.chisqprob = lambda chisq, df: stats.chi2.sf(chisq, df)

angsd_file = open(sys.argv[1], 'r')

print 'SNP\tCHR\tBP\tP'

snp = 0

for line in angsd_file:
	elements=line.strip().split()
	if elements[0].startswith("Chromosome"):
		pass
	else:
		snp=snp+1
		if elements[0]=="MT":
			if float(elements[5])<0:
				elements[5]=str(0.000000)
			print str(snp)+'\t'+"22"+'\t'+elements[1]+'\t'+str(-math.log10(stats.chisqprob(float(elements[5]), 1)))
		elif elements[0]=="X":
			if float(elements[5])<0:
				elements[5]=str(0.000000)
			print str(snp)+'\t'+"23"+'\t'+elements[1]+'\t'+str(-math.log10(stats.chisqprob(float(elements[5]), 1)))
		else:
			if float(elements[5])<0:
				elements[5]=str(0.000000)
			print str(snp)+'\t'+elements[0]+'\t'+elements[1]+'\t'+str(-math.log10(stats.chisqprob(float(elements[5]), 1)))

sys.exit()