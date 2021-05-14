import sys
from Bio import SeqIO

gens = [SeqIO.parse(open(fastaFile, 'rU'), 'fasta') for fastaFile in
        sys.argv[1:]]

while True:
    for i in range(0, len(gens)):
        try:
            inRec = gens[i].next()
            print '>' + inRec.id + '\t' + inRec.seq
        except:
            exit()
