GENERAL-INFO-START

		seq-file		wg_LAR_gphocs_input.txt
		trace-file		wg_LAR_gphocs_t4_d2_run2.log
		num-loci		3735
		burn-in		0
		mcmc-iterations		3100000
		mcmc-sample-skip		5
		start-mig		0
		iterations-per-log		100
		logs-per-line		100

		tau-theta-print		1000
		tau-theta-alpha		1
		tau-theta-beta		10000

		mig-rate-print		10
		mig-rate-alpha		0.002
		mig-rate-beta		0.00001

		locus-mut-rate		CONST

		find-finetunes		TRUE
		find-finetunes-num-steps		100
		find-finetunes-samples-per-step		100


GENERAL-INFO-END


CURRENT-POPS-START

		POP-START
				name		Ltown
				samples		Lib_6_JMG186 d JMG193 d 
		POP-END

		POP-START
				name		Lar
				samples		Lib_4_UAM_66285 d Lib_4_UAM_83621 d 
		POP-END

CURRENT-POPS-END


ANCESTRAL-POPS-START

		POP-START
				name		anc
				children		Ltown		Lar
				tau-initial		0.000005
		POP-END

ANCESTRAL-POPS-END


MIG-BANDS-START

		BAND-START
				source		Ltown
				target		Lar
		BAND-END

		BAND-START
				source		Lar
				target		Ltown
		BAND-END

MIG-BANDS-END


