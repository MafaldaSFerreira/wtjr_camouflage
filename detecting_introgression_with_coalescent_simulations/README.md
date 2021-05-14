## MSMS simulations

We used msms to simulated the expected divergence between white-tailed jackrabbits and black-tailed jackrabbits or Arctic hares. We used the ouput demographic parameters from GPhoCs and to calculate the input parameters for msms. The calculations are detailed in the excel file `msms_calculations.xlsx`. 

The sweep models (3 and 4) were used to understand if low absolute genetic divergence could be explained by fixation of an allele prior to species divergence. We introduced a beneficial allele 25,000 generations before the split of the two lineages and with a selection coefficient of s=0.1. The introduced allele had an additive effect, its initial frequency was ½ Ne, and we retained simulations where the beneficial allele was not lost (flag -SFC).

### White-tailed jackrabbits vs Black-tailed jackrabbits

#### Model 1: Demographic model with migration.
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.18 -I 2 2 2 0 -n 1 0.86 -n 2 1.91 -m 1 2 0.000000086 -m 2 1 0.000000048 -ej 0.88 1 2 -en 0.88 2 1 > sim-pam_LCAF_t1-model1_4indv_1000rep_8Sep20.output
```
#### Model 2: Demographic model without migration.
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.18 -I 2 2 2 0 -n 1 0.86 -n 2 1.91 -ej 0.88 1 2 -en 0.88 2 1 > sim-pam_LCAF_t1-model2_4indv_1000rep_8Sep20.output
```

#### Model 3: Demographic model with selective sweep without migration. 
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.18 -I 2 2 2 0 -n 1 0.86 -n 2 1.91 -ej 0.88 1 2 -en 0.88 2 1 -N 424912 -SI 0.89 2 0 0.0000012 -Sc 0.88 2 84982 42491 0 -Sp 0.5 -SFC > sim-pam_LCAF-model3_ADD0.1_4indv_1000rep_8Sep20.output
```

#### Model 4: Demographic model with selective sweep with migration.
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.18 -I 2 2 2 0 -n 1 0.86 -n 2 1.91 -m 1 2 0.000000086 -m 2 1 0.000000048 -ej 0.88 1 2 -en 0.88 2 1 -N 424912 -SI 0.89 2 0 0.0000012 -Sc 0.88 2 84982 42491 0 -Sp 0.5 -SFC > sim-pam_LCAF-model4_ADD0.1_4indv_1000rep_8Sep20.output
```

### White-tailed jackrabbits vs Arctic hares
#### Model 1: Demographic model with migration.
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.58 -I 2 2 2 0 -n 1 1.34 -n 2 0.16 -m 1 2 0.000001384 -m 2 1 0.000000002 -ej 0.34 1 2 -en 0.34 2 1 > sim-pam_LAR_t1-model1_4indv_1000rep_8Sep20.output
```
#### Model 2: Demographic model without migration.
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.58 -I 2 2 2 0 -n 1 1.34 -n 2 0.16 -ej 0.34 1 2 -en 0.34 2 1 > sim-pam_LAR_t1-model2_4indv_1000rep_8Sep20.output
```
#### Model 3: Demographic model with selective sweep without migration. 
```
java -jar /msms/lib/msms.jar 4 1000 -t 95.58 -I 2 2 2 0 -n 1 1.34 -n 2 0.16 -ej 0.34 1 2 -en 0.34 2 1 -N 426714 -SI 0.35 2 0 0.0000012 -Sc 0.34 2 85343 42671 0 -Sp 0.5 -SFC > sim-pam_LAR-model3_ADD0.1_4indv_1000rep_8Sep20.output
```
#### Model 4: Demographic model with selective sweep with migration.

```
java -jar /msms/lib/msms.jar 4 1000 -t 95.58 -I 2 2 2 0 -n 1 1.34 -n 2 0.16 -m 1 2 0.000001384 -m 2 1 0.000000002 -ej 0.34 1 2 -en 0.34 2 1 -N 426714 -SI 0.35 2 0 0.0000012 -Sc 0.34 2 85343 42671 0 -Sp 0.5 -SFC > sim-pam_LAR-model4_ADD0.1_4indv_1000rep_8Sep20.output
```

Use `parsing_msms.py`, calculate divergence (dxy) between the populations in the output.

```
python3 parsing_msms.py sim-pam_LAR-model4_ADD0.1_4indv_1000rep_8Sep20.output sim-pam_LAR-model4_ADD0.1_4indv_1000rep_8Sep20.dxy 1
```

## Empirical dxy distributions

To generate empirical distributions of dxy for each association region, I start from geno files which were generated as described [here](https://github.com/MafaldaSFerreira/wtjr_winter_camouflage_evolution/blob/master/variant_call_and_consensus_fasta/README.md).

To make the code run faster, I narrowed the geno file for each target scaffold to a region 1Mb around the association regions.

```
awk 'NR==1{print $0}; NR>1{if($2>=24088393 && $2<=24337751) print $0}' chr_245_full_align_up_fi.geno > chr_245_1Mb_asso.geno
awk 'NR==1{print $0}; NR>1{if($2>=3282351 && $2<=3562194) print $0}' chr_311_full_align_up_fi.geno > chr_311_1Mb_asso.geno
awk 'NR==1{print $0}; NR>1{if($2>=46756651 && $2<=47220426) print $0}' chr_342_full_align_up_fi.geno > chr_342_1Mb_asso.geno
```

Then, I constructed the input for the script `run_dxy_empirical_distb.sh`. This script requires eight input variables.

1. chromosome: the target scaffold [integer]
2. start: first coordinate of the region being analyzed [integer]
3. end: last coordinate of the region being analyzed [integer]
4. region: the name of the region. e.g. "association" [string]

These have the same format as `popgenWindows.py` from `Genomics General`.

5. pop1: the name of population 1. e.g. "Ltown_W_2B" [string]
6. sample1: the name of the individuals of population 1 separated by strings. e.g. "Lib_6_JMG186,Lib_6_JMG185". [string]
7. pop2: the name of population 2. e.g. "Larc3" [string]
8. sample2: the name of the individuals of population 2 separated by strings. e.g. "Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630". [string]

These were the commands I ran for the analyses. Note that different individiuals are used depending on their genotype at each association region. The script will first call `filterGenotypes.py` from `Genomics General` to create a new geno file with the target individuals. Then, it will run the custom script `random_sample_from_geno.py` to produce 1000 new geno files by randomly sampling 20000 lines from the input geno file. Then, it will use `popgenWindows.py` from `Genomics General` to calculate dxy between the two populations (or species, in this case).

#### White-tailed vs Black-tailed jackrabbits

```
run_dxy_empirical_distb.sh 245 24188393 24237751 association Ltown_W_2A 'Lib_6_JMG186,JMG176' Larc3 'Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630'

run_dxy_empirical_distb.sh 245 24188393 24237751 association Ltown_B_2 'JMG193,Pool3_2IDS1' Larc3 'Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630'

run_dxy_empirical_distb.sh 342 46856651 47120426 association Ltown_B_4 'JMG193,Pool3_2IDS1,Pool3_2IDS2,JMG188' Larc3 'Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630'

run_dxy_empirical_distb.sh 342 46856651 47120426 association Ltown_W_1 Lib_6_JMG186 Larc3 'Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630'

run_dxy_empirical_distb.sh 311 3382351 3462194 association Ltown_W_2B 'Lib_6_JMG186,Lib_6_JMG185' Larc3 'Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630'

run_dxy_empirical_distb.sh 311 3382351 3462194 association Ltown_B_3 'JMG193,Pool3_2IDS1,Pool3_2IDS2' Larc3 'Lib_4_UAM_66285,Lib_4_UAM_83621,Lib_4_UAM_83630'
```

#### White-tailed jackrabbits vs Arctic hares
```
run_dxy_empirical_distb.sh 245 24188393 24237751 association Ltown_B_2 'JMG193,Pool3_2IDS1' Lcalif2 'Lib_8_Burke4,Lib_8_MacKay2'

run_dxy_empirical_distb.sh 245 24188393 24237751 association Ltown_W_2A 'Lib_6_JMG186,JMG176' Lcalif5 'Lib_8_Burke4,Lib_8_MacKay2,Lib_8_Burke1,Mackay3,Bauer6_S84'

run_dxy_empirical_distb.sh 311 3382351 3462194 association Ltown_B_3 'JMG193,Pool3_2IDS1,Pool3_2IDS2' Lcalif5 'Lib_8_Burke4,Lib_8_MacKay2,Lib_8_Burke1,Mackay3,Bauer6_S84'

run_dxy_empirical_distb.sh 311 3382351 3462194 association Ltown_W_2B 'Lib_6_JMG186,Lib_6_JMG185' Lcalif5 'Lib_8_Burke4,Lib_8_MacKay2,Lib_8_Burke1,Mackay3,Bauer6_S84'

run_dxy_empirical_distb.sh 342 46856651 47120426 association Ltown_B_4 'JMG193,Pool3_2IDS1,Pool3_2IDS2,JMG188' Lcalif5 'Lib_8_Burke4,Lib_8_MacKay2,Lib_8_Burke1,Mackay3,Bauer6_S84'

run_dxy_empirical_distb.sh 342 46856651 47120426 association Ltown_W_1 Lib_6_JMG186 Lcalif5 'Lib_8_Burke4,Lib_8_MacKay2,Lib_8_Burke1,Mackay3,Bauer6_S84'
```

The output files from these runs are inside this folder.