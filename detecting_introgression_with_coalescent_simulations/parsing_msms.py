# This script will parse the msms simulation output
# and calculate dxy between two populations assuming
# two populations with two individuals each.

import sys
import pandas as pd

input=open(sys.argv[1],"r")
outstring=str(sys.argv[2])
option=int(sys.argv[3])

# read input lines:
lines=input.readlines()

if option==1:

   outfile='{}.dxy'.format(outstring)
   output=open(outfile,"w")
   # every loci starts with //
   # let's start a counter to count the number of loci
   noloci=0
   # a counter for the line numbers:
   ####
   noline=0
   for line in lines:
      noline += 1
      if line.startswith("//"):
               noloci += 1
               # after the //, the actual data will be two lines over, after the segsites and position line
               # so, for each line of 0 and 1, let's convert them into a list of 0 and 1s
               indv1=list(map(int,lines[noline+2].strip())) #strip removes \n; map converts the list in integers
               indv2=list(map(int,lines[noline+3].strip()))
               indv3=list(map(int,lines[noline+4].strip()))
               indv4=list(map(int,lines[noline+5].strip()))

               #convert this into a dataframe in pandas:
               df=pd.DataFrame(list(zip(indv1, indv2, indv3, indv4)), 
                  columns =['indv1', 'indv2', 'indv3', 'indv4'])
               
               # indv1 and indv2 are from deme1 and indv3 and indv4 are from deme2
               # we can calcute the pairwise differences between individuals of diff demes
               df['indv13']=abs(df['indv1']-df['indv3'])
               df['indv14']=abs(df['indv1']-df['indv4'])
               df['indv23']=abs(df['indv2']-df['indv3'])
               df['indv24']=abs(df['indv2']-df['indv4'])

               # and now calculate the total differences between both demes
               df['diff']=df.loc[:,'indv13':'indv24'].sum(axis=1)/4

               # and finally, calculate dxy for the loci size you specified in your simulation:
               outline=['loci_{}'.format(noloci),str(df['diff'].sum(axis=0)/20000)]

               output.write('\t'.join(outline))
               output.write('\n')
   output.close()

if option==2:
   outfile1='{}_allele1.dxy'.format(outstring)
   outfile2='{}_allele2.dxy'.format(outstring)
   outfile3='{}_intraspecific.dxy'.format(outstring)
             
   output1=open(outfile1,"w")
   output2=open(outfile2,"w")
   output3=open(outfile3,"w")

   # every loci starts with //
   # let's start a counter to count the number of loci
   noloci=0
   # a counter for the line numbers:
   ####
   noline=0
   for line in lines:
      noline += 1
      if line.startswith("//"):
               noloci += 1
               # after the //, the actual data will be two lines over, after the segsites and position line
               # so, for each line of 0 and 1, let's convert them into a list of 0 and 1s
               indv1=list(map(int,lines[noline+2].strip())) #strip removes \n; map converts the list in integers
               indv2=list(map(int,lines[noline+3].strip()))
               indv3=list(map(int,lines[noline+4].strip()))
               indv4=list(map(int,lines[noline+5].strip()))

               #convert this into a dataframe in pandas:
               df=pd.DataFrame(list(zip(indv1, indv2, indv3, indv4)), 
                  columns =['indv1', 'indv2', 'indv3', 'indv4'])
               # presumabily, ind1 and indv2 will have two different balanced alleles. 
               # so we need to calculate dxy between indv3 and indv4 but keep it separated.
               df['indv13']=abs(df['indv1']-df['indv3'])
               df['indv14']=abs(df['indv1']-df['indv4'])
               df['indv23']=abs(df['indv2']-df['indv3'])
               df['indv24']=abs(df['indv2']-df['indv4'])

               df['indv12']=abs(df['indv1']-df['indv2'])
               # and now calculate the total differences between both demes
               df['diff1']=df.loc[:,['indv13','indv14']].sum(axis=1)/2
               df['diff2']=df.loc[:,['indv23','indv24']].sum(axis=1)/2
               
               # and finally, calculate dxy for the loci size you specified in your simulation:
               outline1=['loci_{}'.format(noloci),str(df['diff1'].sum(axis=0)/20000)]
               outline2=['loci_{}'.format(noloci),str(df['diff2'].sum(axis=0)/20000)]
               outline3=['loci_{}'.format(noloci),str(df['indv12'].sum(axis=0)/20000)]

               output1.write('\t'.join(outline1))
               output1.write('\n')
               output2.write('\t'.join(outline2))
               output2.write('\n')
               output3.write('\t'.join(outline3))
               output3.write('\n')
   output1.close()
   output2.close()
   output3.close()

if option==3:
   outfile='{}_intraspecific.dxy'.format(outstring)
   output=open(outfile,"w")

   # every loci starts with //
   # let's start a counter to count the number of loci
   noloci=0
   # a counter for the line numbers:
   ####
   noline=0
   for line in lines:
      noline += 1
      
      if line.startswith("//"):
         noloci += 1
         
         segsites=lines[noline].strip().split(" ")
         
         if int(segsites[1])==0:
            
            outline=['loci_{}'.format(noloci),str(0)]
            #print(outline)
            output.write('\t'.join(outline))
            output.write('\n')
         else:
            # after the //, the actual data will be two lines over, after the segsites and position line
            # so, for each line of 0 and 1, let's convert them into a list of 0 and 1s
            indv1=list(map(int,lines[noline+2].strip())) #strip removes \n; map converts the list in integers
            indv2=list(map(int,lines[noline+3].strip()))

            #convert this into a dataframe in pandas:
            df=pd.DataFrame(list(zip(indv1, indv2)),
            columns =['indv1', 'indv2'])
            # presumabily, ind1 and indv2 will have two different balanced alleles. 
            # so we need to calculate dxy between indv3 and indv4 but keep it separated.
            df['indv12']=abs(df['indv1']-df['indv2'])

            # and finally, calculate dxy for the loci size you specified in your simulation:
            outline=['loci_{}'.format(noloci),str(df['indv12'].sum(axis=0)/20000)]

            output.write('\t'.join(outline))
            output.write('\n')
   output.close()

input.close()


           

