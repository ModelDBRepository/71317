 
//  New version of spp.g
// 
//  programmed by Yue Dai, November 11, 1999
//  modified by YD on April 13, 2000


// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001




//===============================
//         Initialization
//===============================

include  protodefs.g
include  variables.g
include  control_panel.g
include  Make_Panels.g
include  display_def.g
include  Current_injections.g
include  Write_out.g

setclock  0  {dt}		// set the simulation clock


//===============================
//         Main Script
//===============================

// create the neuron "/cell"

	readcell cell.p /cell

	setfield /cell/axon inject 0.0
        setfield /cell/soma inject 0.0
        setfield /cell/dend inject 0.0

        make_K_leak cell/axon {ax_max_Gleak}
        addmsg cell/axon/K_leak         cell/axon CHANNEL Gk Ek
        addmsg cell/axon                cell/axon/K_leak VOLTAGE Vm

        make_K_leak cell/IS {IS_max_Gleak}
        addmsg cell/IS/K_leak         cell/IS CHANNEL Gk Ek
        addmsg cell/IS                cell/IS/K_leak VOLTAGE Vm

        make_K_leak cell/soma {sm_max_Gleak} //fn "make_K_leak" in Active.g
        addmsg cell/soma/K_leak         cell/soma CHANNEL Gk Ek
        addmsg cell/soma                cell/soma/K_leak VOLTAGE Vm   

        make_K_leak cell/dend {pd_max_Gleak} //fn "make_K_leak" is in Active.g 
        addmsg cell/dend/K_leak         cell/dend CHANNEL Gk Ek
        addmsg cell/dend                cell/dend/K_leak VOLTAGE Vm   

	display_default  //initializing Vm, Im and Ik display in "display_def.g"

        make_current_inj_panel

        I_injection /cell  //create a current injection object
        addmsg /cell/Iinjection /cell/soma INJECT output
        addmsg /cell/soma /fig/current PLOT inject *I_inj_Soma *blue

        Pulse_injection /cell  //create a pulse injection object
        addmsg /cell/pulse1 /cell/axon INJECT output
        addmsg /cell/axon /fig/current PLOT inject *I_pulse_Axon *cyan

check
reset
