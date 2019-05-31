// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001

//**********************  Table of variables  *****************************

float PI = 3.14159

float RM = 0.40  //org=0.25      // specific membrane resistance (ohms m^2)
float CM = 0.015 //org=0.01      // specific membrane capacitance (farads/m^2)
float RA = 0.7   //org=0.7       // specific axial resistance (ohms m)

float gmax = 3e-10              // maximum synaptic conductance (Siemen)
float tmax = 1.0              // simulation time in sec
float dt = 0.00005              // (0.00005)simulation time step in sec


float EREST_ACT = -0.060
float ENA = 0.115 + EREST_ACT // 0.055
float EK = -0.015 + EREST_ACT // -0.075
float ECA = 0.140 + EREST_ACT // 0.080
float Eh = -0.065 //-0.065, h current is Na and K mixed currents

float axon_l = 400e-6,  axon_d = 10e-6
float IS_l   = 100e-6,  IS_d   = 5e-6
float soma_l = 360e-6,  soma_d = 10e-6
float dend_l = 500e-6,  dend_d = 40e-6

float Axon_A = axon_l * PI * axon_d 
float IS_A   = IS_l   * PI * IS_d 
float SOMA_A = soma_l * PI * soma_d
float dend_A = dend_l * PI * dend_d



//========================  Ramp current injection ====================

float md = 	2	// mode: Sin=0; Sq=1; Tri=2; Const=3
float amp = 	15e-9	// amplitude
float dc_off = 	-2e-9	// dc_offset
float phs = 	0	// phase
float f = 	1	// frequency
float out =	0	// output

float level_1 =	0e-9	//level1: 	nA	e.g. 10e-9
float width_1 = 0.001	//width1: 	Sec	e.g. 0.010
float delay_1 =	0.1	//delay1: 	Sec	e.g. 0.050
float level_2 = 0       //level2: 	nA	e.g. 5e-9
float width_2 = 0       //width2: 	Sec	e.g. 0.020
float delay_2 = 10       //delay2: 	Sec	e.g. 0.050
float base    =	0	//baselevel:	nA	e.g. 1e-9
float trig    = 0	//trig_mode: 0=free run; 1=ext. trig; 2=ext. gate



//======================== File Names for Write Out ========================
 
//str Soma_I_inj_Name
//str IS_I_pls_Name

str IS_Vm_NAME 	 = "IS_Vm.asc", 	IS_Im_NAME 	= "IS_Im.asc"
str IS_I_inj_NAME = "IS_I_inj.asc"
str IS_I_Na_NAME = "IS_I_Na.asc",       IS_I_K_DR_NAME  = "IS_I_K_DR.asc"
 
str S_Vm_NAME 	 = "S_Vm.asc", 		S_Im_NAME 	= "S_Im.asc" 
str S_I_inj_NAME = "S_I_inj.asc"
str S_I_Na_NAME  = "S_I_Na.asc", 	S_I_K_DR_NAME	= "S_I_K_DR.asc"
str S_I_AHP_NAME = "S_I_AHP.asc",	S_I_K_A_NAME	= "S_I_K_A.asc"
str S_I_h_NAME	 = "S_I_h.asc",	 	S_I_Ca_T_NAME	= "S_I_Ca_T.asc"
str S_I_Ca_N_NAME= "S_I_Ca_N.asc",	S_I_Ca_L_NAME	= "S_I_Ca_L.asc"

str D_Vm_NAME    = "D_Vm.asc",          D_Im_NAME       = "D_Im.asc"  
str D_I_inj_NAME = "D_I_inj.asc"
str D_I_Na_NAME  = "D_I_Na.asc",        D_I_K_DR_NAME   = "D_I_K_DR.asc"
str D_I_AHP_NAME = "D_I_AHP.asc",       D_I_K_A_NAME    = "D_I_K_A.asc" 
str D_I_h_NAME   = "D_I_h.asc",         D_I_Ca_T_NAME   = "D_I_Ca_T.asc"
str D_I_Ca_N_NAME= "D_I_Ca_N.asc",      D_I_Ca_L_NAME   = "D_I_Ca_L.asc"

//=======================  colors for display ===========================

str IS_Vm_color   = "blue",	IS_Im_color      = "pink"
str IS_I_inj_color = "blue"
str IS_I_Na_color = "dark gray",IS_I_K_DR_color  = "black"


str S_Vm_color    = "black",  	S_Im_color       = "red"
str S_I_inj_color = "blue"
str S_I_Na_color  = "orange",   S_I_K_DR_color   = "brown"
str S_I_AHP_color = "green",	S_I_K_A_color    = "blue"  
str S_I_h_color   = "black",	S_I_Ca_T_color   = "pink"
str S_I_Ca_N_color= "yellow",	S_I_Ca_L_color   = "purple"


str D_Vm_color    = "green",    D_Im_color       = "pink"
str D_I_inj_color = "blue"

str D_I_Na_color  = "red",      D_I_K_DR_color   = "pink"
str D_I_AHP_color = "white",    D_I_K_A_color    = "blue" 
str D_I_h_color   = "dark gray",D_I_Ca_T_color   = "dark green"
str D_I_Ca_N_color= "green",    D_I_Ca_L_color   = "cyan"

//=======================  Initial Values for Gk  ===========================


float ax_GNa = 1200, ax_GK_DR =400,  ax_GK_AHP =0,   ax_GK_A =0
float ax_Gh  = 0,    ax_GCa_T =0,    ax_GCa_N  =0,   ax_GCa_L=0,   ax_Gleak=0


float IS_GNa = 2400, IS_GK_DR =1100, IS_GK_AHP =0,   IS_GK_A =0 
float IS_Gh  = 0,    IS_GCa_T =0,    IS_GCa_N  =0,   IS_GCa_L=0,   IS_Gleak=0 

float sm_GNa = 2000, sm_GK_DR =350,  sm_GK_AHP =80,  sm_GK_A =55
float sm_Gh  = 60,   sm_GCa_T =40,   sm_GCa_N  =120, sm_GCa_L=20,  sm_Gleak=3.5

float pd_GNa = 0,    pd_GK_DR =0,    pd_GK_AHP =30,   pd_GK_A =0
float pd_Gh  = 0,    pd_GCa_T =0,    pd_GCa_N  =15,   pd_GCa_L=3.3, pd_Gleak=3.0


//======================   Max G_leak  ==========================
// These data are used in main program (scm.g) to create leak conductances

float ax_max_Gleak = Axon_A * ax_Gleak 
float IS_max_Gleak = IS_A   * IS_Gleak
float sm_max_Gleak = SOMA_A * sm_Gleak
float pd_max_Gleak = dend_A * pd_Gleak


/*  =============== Parameters in Initial Segment (I.S.) ==============*/

float IS_m_shift = 0.005  //
float IS_h_shift = 0.005  //
float IS_n_shift =-0.000  //

/*  =============  Parameters in Soma =================== */

float m_shift = 0.000 //
float h_shift = 0.000 //
float n_shift = -0.00  //
float km_shift = 0.00 //
float Am_shift = -0.020 //
float Ah_shift = -0.020 //
float Hm_shift = 0.00	//


float mT_shift = 0.000  //
float hT_shift = 0.000  //
float mN_shift = -0.010  //
float hN_shift = -0.010  //
float mL_shift = -0.010  //

float Kd = 80

/*  ==============  Parameters in dendrite ================ */

float D_m_shift = 0.000 //
float D_h_shift = 0.000 //
float D_n_shift = -0.000  //
float D_Am_shift = -0.020 //
float D_Ah_shift = -0.020 //
float D_Hm_shift = 0.00	//

float D_mT_shift = 0.000  //
float D_hT_shift = 0.000  //
float D_mN_shift = -0.010  //
float D_hN_shift = -0.010  //
float D_mL_shift = -0.020  //

float D_GNa =0
float D_GK  = 0      
float D_GK_AHP = 2
float D_GK_A =0
float D_Gh = 0	
float D_GCa_T = 0  
float D_GCa_N = 3
float D_GCa_L = 3.3
float D_gNMDA =0.1
