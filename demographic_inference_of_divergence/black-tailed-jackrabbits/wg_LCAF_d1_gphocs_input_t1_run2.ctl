GENERAL-INFO-START

		seq-file		wg_LCAF_d1_gphocs_input.txt
		trace-file		wg_LCAF_d1_run2.log
		num-loci		6712
		burn-in		0
		mcmc-iterations		1100000
		mcmc-sample-skip		10
		start-mig		0
		iterations-per-log		100
		logs-per-line		100

		tau-theta-print		10000
		tau-theta-alpha		1
		tau-theta-beta		10000

		mig-rate-print		0.1
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
				name		Lcalif
				samples		Lib_8_Burke4 d Lib_8_MacKay2 d 
		POP-END

CURRENT-POPS-END


ANCESTRAL-POPS-START

		POP-START
				name		anc
				children		Ltown		Lcalif
				tau-initial		0.000005
		POP-END

ANCESTRAL-POPS-END


MIG-BANDS-START

		BAND-START
				source		Ltown
				target		Lcalif
		BAND-END

		BAND-START
				source		Lcalif
				target		Ltown
		BAND-END

MIG-BANDS-END


