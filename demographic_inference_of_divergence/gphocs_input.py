import sys

input=sys.argv[1]
chr=sys.argv[2]
output=sys.argv[3]

data = open(input)

table = []

for line in data:
    table.append(line.split())

#print table

aa = []

i = 1
for line in table:
    if len(line) > 0:
        if line[0] == "locus_name":
            print i
            line[0] = chr + "_" + str(i)
            i += 1

#print table

outfile = open(output, "w")

#outfile.write("".join(str(i-2)) + "\n" + "\n")

for item in table:
    outfile.write("\t".join(item) + "\n")
