// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001

include variables.g
include Make_Panels.g

function display_default

// the following fn's are included in "Make_Panels.g" except make_control
// which is in "Make_Panels.g"

        make_write_out
        make_control
        make_Ca_graph
        make_Vmgraph
        make_Igraph
        graph_cond   

// ===================  Conductances  ====================

  addmsg /cell/soma/K_AHP /cond/channel_Gk PLOT Gk *Soma_Gk_AHP *{S_I_AHP_color}
  addmsg /cell/dend/D_K_AHP /cond/channel_Gk PLOT Gk *Dend_Gk_AHP *{D_I_AHP_color}

//==================  Ca concentration =======================

 addmsg /cell/soma/Ca_conc /Cafig/Ca PLOT Ca *Soma_Ca_concen *{S_I_AHP_color}
 addmsg /cell/dend/D_Ca_conc /Cafig/Ca PLOT Ca *Dend_Ca_concen *{D_I_AHP_color}

//====================  Vm Im and Ik  =========================


   addmsg /cell/soma   /data/voltage PLOT Vm *Soma_Vm *{S_Vm_color}
   addmsg /cell/soma/Na /fig/current PLOT Ik *I_Na *{S_I_Na_color}
   addmsg /cell/soma/K_DR /fig/current PLOT Ik *I_K(DR) *{S_I_K_DR_color}
   addmsg /cell/soma/K_AHP /fig/current PLOT Ik *I_AHP *{S_I_AHP_color}

	xshow /data
	xshow /fig
	reset
end
