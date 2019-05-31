// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001

// protodefs.g - Definition of prototype elements for ssp.g
//
// Yue Dai	July 8, 1998


/* file for standard compartments */

include compartments
include Active.g
create neutral /library
disable /library
pushe /library
make_cylind_compartment         /* makes "compartment" */

make_IS_Na  
make_IS_K_DR

make_Na
make_K_DR
make_K_AHP

make_K_A
make_Ca_T
make_Ca_N
make_Ca_L
make_Ca_conc
make_H

make_D_Na
make_D_K_DR
make_D_K_A
make_D_H
make_D_Ca_T
make_D_Ca_N
make_D_Ca_L
make_D_Ca_conc 
make_D_K_AHP

pope
