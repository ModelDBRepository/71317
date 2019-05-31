//**********************  Table of variables  *****************************

float PI = 3.14159

float RM = 0.45 //org=0.25      // specific membrane resistance (ohms m^2)
float CM = 0.01 //org=0.01      // specific membrane capacitance (farads/m^2)
float RA = 0.2  //org=0.7       // specific axial resistance (ohms m)

float gmax = 3e-10              // maximum synaptic conductance (Siemen)
float tmax = 1.0                // simulation time in sec
float dt = 0.00005              // (0.00005)simulation time step in sec


float EREST_ACT = -0.060
float ENA = 0.115 + EREST_ACT // 0.055
float EK = -0.010 + EREST_ACT // -0.070
float ECA = 0.140 + EREST_ACT // 0.080
float Eh = -0.055 //-0.055, h current is Na and K mixed currents

float axon_l = 400e-6,  axon_d = 6e-6 //length and diameter
float IS_l   = 50e-6,   IS_d   = 4e-6
float soma_l = 200e-6,  soma_d = 8e-6
float dend_l = 500e-6,  dend_d = 20e-6

float Axon_A = axon_l * PI * axon_d // axon area
float IS_A   = IS_l   * PI * IS_d   // IS area
float SOMA_A = soma_l * PI * soma_d // soma area
float dend_A = dend_l * PI * dend_d // dendrite area



//=======================  Initial Values for Gk  ===========================


float ax_GNa = 1000, ax_GK_DR =380,  ax_GK_AHP =0,   ax_GK_A =0
float ax_Gh  = 0,    ax_GCa_T =0,    ax_GCa_N  =0,   ax_GCa_L=0,   ax_Gleak=0
float ax_GNaP = 0  

float IS_GNa = 2000, IS_GK_DR =900,  IS_GK_AHP =0,   IS_GK_A =0 
float IS_Gh  = 0,    IS_GCa_T =0,    IS_GCa_N  =0,   IS_GCa_L=0,   IS_Gleak=0 
float IS_GNaP = 100

float sm_GNa = 1800, sm_GK_DR =320,  sm_GK_AHP =190,  sm_GK_A =55
float sm_Gh  = 40,   sm_GCa_T =40,   sm_GCa_N  =140,  sm_GCa_L=20,  sm_Gleak=2.0
float sm_GNaP = 20

float pd_GNa = 0,    pd_GK_DR =0,    pd_GK_AHP =40,   pd_GK_A =0
float pd_Gh  = 0,    pd_GCa_T =0,    pd_GCa_N  =10,   pd_GCa_L=3, pd_Gleak=6.0
float pd_GNaP = 0

//======================   Max G_leak  ==========================
// These data are used in main program (mn.g) to create leak conductances
// leak conductance with K+ as reversal potential
float ax_max_Gleak = Axon_A * ax_Gleak
float IS_max_Gleak = IS_A   * IS_Gleak
float sm_max_Gleak = SOMA_A * sm_Gleak
float pd_max_Gleak = dend_A * pd_Gleak


// leak conductance with resting Em as reversal potential
float scaling_Em=3 //scaling factor 1~4
float ax_max_Gleak_Em = (Axon_A/RM)*scaling_Em
float IS_max_Gleak_Em = (IS_A/RM)*scaling_Em
float sm_max_Gleak_Em = (SOMA_A/RM)*scaling_Em
float pd_max_Gleak_Em = (dend_A/RM)*scaling_Em


/*  =============== Parameters in Initial Segment (I.S.) ==============*/

float IS_m_shift = 0.006 //voltage shift for state variable m:IS_I_Na
float IS_h_shift = 0.006 //voltage shift for state variable h:IS_I_Na
float IS_n_shift = -0.000  //voltage shift for state variable n:IS_I_K(DR)
float IS_NaPm_shift = 0.010 //voltage shift for state variable m:IS_I_NaP 

/*  =============  Parameters in Soma =================== */

float m_shift = 0.000 // voltage shift for state variable m : I_Na
float h_shift = 0.000 // voltage shift for state variable h : I_Na
float n_shift = -0.000  // voltage shift for state variable n: I_K(DR)
float km_shift = 0.00 //voltage shift for state variable km:M-current I_K(M)
float Am_shift = -0.020 //   ...... for A-current: m
float Ah_shift = -0.020 //   ...... for A-current: h
float Hm_shift = -0.005	//  V-shift for h current: m
float NaPm_shift = 0.010 // voltage shift for state variable m: I_NaP

float mT_shift = -0.020  // V- shift for Ca_T channel: m
float hT_shift = -0.020  // V- shift for Ca_T channel: h
float mN_shift = -0.010  // V- shift for Ca_N channel: m
float hN_shift = -0.010  // V- shift for Ca_N channel: h
float mL_shift = -0.010  // V- shift for Ca_L channel: m
float Kd = 300 

/*  ==============  Parameters in dendrite ================ */

float D_m_shift = 0.000 // voltage shift for state variable m : I_Na
float D_h_shift = 0.000 // voltage shift for state variable h : I_Na
float D_NaPm_shift = 0.010 // voltage shift for state variable m : I_NaP 
float D_n_shift = -0.000  // voltage shift for state variable n: I_K(DR)
float D_Am_shift = -0.020 //   ...... for A-current: m
float D_Ah_shift = -0.020 //   ...... for A-current: h
float D_Hm_shift = 0.00	//  V-shift for h current: m

float D_mT_shift = -0.020  // V- shift for Ca_T channel: m
float D_hT_shift = -0.020  // V- shift for Ca_T channel: h
float D_mN_shift = -0.010  // V- shift for Ca_N channel: m
float D_hN_shift = -0.010  // V- shift for Ca_N channel: h   
float D_mL_shift = -0.010  // V- shift for Ca_L channel: m

