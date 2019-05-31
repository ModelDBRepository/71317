// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001


*relative
*cartesian
*asymmetric
*sylindrical

*set_compt_param        RM      0.4
*set_compt_param        RA      0.2 
*set_compt_param        CM      0.015  
*set_compt_param     EREST_ACT  -0.060

axon none	400 0 0 10	\
		Na	1200	\
		K_DR	400	

*set_compt_param        RM      0.4
*set_compt_param        RA      0.2
*set_compt_param        CM      0.015
*set_compt_param     EREST_ACT  -0.060

IS   axon 	100 0 0 5	\
 		IS_Na 	2400 	\
		IS_K_DR 1100

*set_compt_param        RM      0.4
*set_compt_param        RA      0.2
*set_compt_param        CM      0.015
*set_compt_param     EREST_ACT  -0.060

soma  IS   	360  0 0 10 	\
		Na 	2000	\
		K_DR 	350 	\
                H       60     \
		K_AHP 	80	\
		K_A 	55	\
		Ca_T	40	\
		Ca_N	120	\
		Ca_L	20	\
		Ca_conc	-17.402e12

//Specifying constants (RM=0.4, RA=0.7,CM=0.01)
*set_compt_param        RM      0.4
*set_compt_param        RA      0.6
*set_compt_param        CM      0.015
*set_compt_param     EREST_ACT  -0.060

dend  soma	500 0 0 40	\
		D_Na	0	\
		D_K_DR	0	\
		D_K_AHP	30	\
		D_K_A	0	\
		D_H	0	\
		D_Ca_T	0	\
		D_Ca_N	15	\
		D_Ca_L	3.3	\
		D_Ca_conc -10.769e12


dend1 dend	 400 0 0 30
dend2 dend1      300 0 0 25
dend3 dend2      200 0 0 20
dend4 dend3      100 0 0 15

