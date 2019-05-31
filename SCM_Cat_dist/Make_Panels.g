// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001

include Write_out.g
include variables.g 
include write_sub_fn.g

function make_Vmgraph
    float vmin = -0.090 //-0.090
    float vmax = 0.040  // 0.030
    create xform /data [4,0,590,220]
    create xgraph /data/voltage  -hgeom 90%  -title "Membrane Potential"
    setfield ^ XUnits sec YUnits Volts
    setfield ^ xmax {tmax} ymin {vmin} ymax {vmax}
    xshow /data
end

function make_Igraph
    float Imax = 4e-8
    float Imin = -3e-8
    create xform /fig [4,248,590,220]
    create xgraph /fig/current  -hgeom 90%  -title "Currents"
    setfield ^ XUnits sec YUnits Amp
    setfield ^ xmax {tmax} ymin {Imin} ymax {Imax}
    xshow /fig
end

function graph_cond 
    create xform /cond [4,495,590,180]
    pushe /cond
    create xgraph channel_Gk -hgeom 100% -title " Channel Conductance"
    setfield channel_Gk xmin 0 xmax {tmax} ymin 0 ymax 1e-6  
    setfield channel_Gk XUnits "sec" YUnits "Gk (Siemen)"
    pope
    xshow /cond
end


function make_Ca_graph
    float Camin = 0
    float Camax = 3e+2
    create xform /Cafig [4,565,590,180] 
    create xgraph /Cafig/Ca  -hgeom 90%  -title "Ca Concentration"
    setfield ^ XUnits sec YUnits [Ca]
    setfield ^ xmax {tmax} ymin {Camin} ymax {Camax}
    xshow /Cafig
end

function make_write_out

  create xform /write-out [695,0,320,700]

//======================== IS Panels =====================================

  create xlabel /write-out/label1 [0,  0,100,25]   -bg red -label "Display"
  create xlabel /write-out/label2 [100,0, 60,25]  -bg red -label "Write"
  create xlabel /write-out/label3 [160,0,140,25] -bg red -label "Filename"

  create xlabel /write-out/label4 [0,25,300,25] -bg cyan \
                                  -label "Output of Initial Segment (IS) Data"

panel_bars  IS_Vm_dis  IS_Vm_wrt IS_Vm_Nm \
            show_V_I IS_Vm_write IS_Vm_filename\
            IS_Vm.asc "Vm : No" "Vm : Yes" {IS_Vm_color}\
            1 0 50

panel_bars  IS_Im_dis IS_Im_wrt IS_Im_Nm \
            show_V_I IS_Im_write IS_Im_filename\
            IS_Im.asc "Im : No" "Im : Yes" {IS_Im_color}\
            1 0 75

panel_bars  IS_I_Na_dis IS_I_Na_wrt IS_I_Na_Nm \
            show_V_I IS_I_Na_write IS_I_Na_filename\
            IS_I_Na.asc "I_Na : No" "I_Na : Yes" {IS_I_Na_color}\
            1 0 100

panel_bars  IS_I_K_DR_dis IS_I_K_DR_wrt IS_I_K_DR_Nm \
            show_V_I IS_I_K_DR_write IS_I_K_DR_filename\
            IS_I_K_DR.asc "I_K_DR : No" "I_K_DR : Yes" {IS_I_K_DR_color}\
            1 0 125

//======================== Soma Panels =====================================

create xlabel /write-out/label5 [0,150,300,25] -bg cyan \
                                  -label "Output of Soma Data"

panel_bars  S_Vm_dis  S_Vm_wrt S_Vm_Nm \
            show_V_I S_Vm_write S_Vm_filename\
            S_Vm.asc "Vm : No" "Vm : Yes" {S_Vm_color}\
	    0 1 175

panel_bars  S_Im_dis S_Im_wrt S_Im_Nm \
            show_V_I S_Im_write S_Im_filename\
            S_Im.asc "Im : No" "Im : Yes" {S_Im_color}\
	    1 0 200

panel_bars  S_I_inj_dis S_I_inj_wrt S_I_inj_Nm \
            show_V_I S_I_inj_write S_I_inj_filename\
            S_I_inj.asc "I_inj : YES" "I_inj : YES" {S_I_inj_color}\
            0 1 225

panel_bars  S_I_Na_dis S_I_Na_wrt S_I_Na_Nm \
            show_V_I S_I_Na_write S_I_Na_filename\
            S_I_Na.asc "I_Na : No" "I_Na : Yes" {S_I_Na_color}\ 
	    0 1 250

panel_bars  S_I_K_DR_dis S_I_K_DR_wrt S_I_K_DR_Nm \
            show_V_I S_I_K_DR_write S_I_K_DR_filename\
            S_I_K_DR.asc "I_K_DR : No" "I_K_DR : Yes" {S_I_K_DR_color}\ 
	    0 1 275

panel_bars  S_I_AHP_dis S_I_AHP_wrt S_I_AHP_Nm \
            show_V_I S_I_AHP_write S_I_AHP_filename\
            S_I_AHP.asc "I_AHP : No" "I_AHP : Yes" {S_I_AHP_color}\
	    0 1 300

panel_bars  S_I_K_A_dis S_I_K_A_wrt S_I_K_A_Nm \
            show_V_I S_I_K_A_write S_I_K_A_filename\
            S_I_K_A.asc "I_K_A : No" "I_K_A : Yes" {S_I_K_A_color}\
	    1 0 325

panel_bars  S_I_h_dis S_I_h_wrt S_I_h_Nm \
            show_V_I S_I_h_write S_I_h_filename\
            S_I_h.asc "I_h : No" "I_h : Yes" {S_I_h_color}\
            1 0 350

panel_bars  S_I_Ca_T_dis S_I_Ca_T_wrt S_I_Ca_T_Nm \   
            show_V_I S_I_Ca_T_write S_I_Ca_T_filename\
            S_I_Ca_T.asc "I_Ca_T : No" "I_Ca_T : Yes" {S_I_Ca_T_color}\
            1 0 375

panel_bars  S_I_Ca_L_dis S_I_Ca_L_wrt S_I_Ca_L_Nm \
            show_V_I S_I_Ca_L_write S_I_Ca_L_filename\
            S_I_Ca_L.asc "I_Ca_L : No" "I_Ca_L : Yes" {S_I_Ca_L_color}\
            1 0 400

panel_bars  S_I_Ca_N_dis S_I_Ca_N_wrt S_I_Ca_N_Nm \
            show_V_I S_I_Ca_N_write S_I_Ca_N_filename\
            S_I_Ca_N.asc "I_Ca_N : No" "I_Ca_N : Yes" {S_I_Ca_N_color}\
            1 0 425

//=======================  denedrite Panels ==============================

create xlabel /write-out/label9 [0,450,300,25] -bg cyan \
                                -label "Output of Proximal Dendrite Data" 
//create xlabel /write-out/label10 [0,475,100,25]   -bg cyan -label "Display"  
//create xlabel /write-out/label11 [100,475,80,25]  -bg cyan -label "Write out"
//create xlabel /write-out/label12 [180,475,184,25] -bg cyan -label "Filename for writing"

panel_bars  D_Vm_dis  D_Vm_wrt D_Vm_Nm \
            show_V_I D_Vm_write D_Vm_filename\
            D_Vm.asc "Vm : No" "Vm : Yes" {D_Vm_color}\
            1 0 475

panel_bars  D_Im_dis D_Im_wrt D_Im_Nm \
            show_V_I D_Im_write D_Im_filename\
            D_Im.asc "Im : No" "Im : Yes" {D_Im_color}\
            1 0 500
panel_bars  D_I_AHP_dis D_I_AHP_wrt D_I_AHP_Nm \
            show_V_I D_I_AHP_write D_I_AHP_filename\
            D_I_AHP.asc "I_AHP : No" "I_AHP : Yes" {D_I_AHP_color}\
            1 0 525

panel_bars  D_I_Ca_L_dis D_I_Ca_L_wrt D_I_Ca_L_Nm \
            show_V_I D_I_Ca_L_write D_I_Ca_L_filename\
            D_I_Ca_L.asc "I_Ca_L : No" "I_Ca_L : Yes" {D_I_Ca_L_color}\
            1 0 550

panel_bars  D_I_Ca_N_dis D_I_Ca_N_wrt D_I_Ca_N_Nm \
            show_V_I D_I_Ca_N_write D_I_Ca_N_filename\
            D_I_Ca_N.asc "I_Ca_N : No" "I_Ca_N : Yes" {D_I_Ca_N_color}\
            1 0 575

panel_bars  D_I_Ca_T_dis D_I_Ca_T_wrt D_I_Ca_T_Nm \
            show_V_I D_I_Ca_T_write D_I_Ca_T_filename\ 
            D_I_Ca_T.asc "I_Ca_T : No" "I_Ca_T : Yes" {D_I_Ca_T_color}\
            1 0 600

panel_bars  D_I_Na_dis D_I_Na_wrt D_I_Na_Nm \
            show_V_I D_I_Na_write D_I_Na_filename\ 
            D_I_Na.asc "I_Na : No" "D_I_Na : Yes" {D_I_Na_color}\
            1 0 625

panel_bars  D_I_h_dis D_I_h_wrt D_I_h_Nm \
            show_V_I D_I_h_write D_I_h_filename\   
            D_I_h.asc "I_h : No" "D_I_h : Yes" {D_I_h_color}\  
            1 0 650

	xshow /write-out
end 

function panel_bars (out1,      	out2,           out3,\
                     show_fn,   	write_fn,       name_fn,\
                     name_dflt, 	dsply_No,	dsply_Yes,\
		     dsply_color,	dsply_S0,  	dsply_S1, y_geom)

str out1,out2,out3,show_fn,write_fn,name_fn,name_dflt,dsply_No,dsply_Yes,dsply_color
int y_geom,dsply_S0,dsply_S1

create xtoggle /write-out/{out1} [0,{y_geom},100,25] \
				-script {show_fn} \
				-onfg {dsply_color} -offfg black

        setfield /write-out/{out1} offlabel {dsply_No}  state {dsply_S0} \
                                   onlabel  {dsply_Yes} state {dsply_S1}

create xtoggle /write-out/{out2} [100,{y_geom},60,25] \
				-script {write_fn}\
				-onfg white -offfg black

        setfield /write-out/{out2} onlabel "Yes" state 1 \ 
                                   offlabel  "No" state 0

create xdialog /write-out/{out3} [160,{y_geom},140,25] -label ""\
                                -value {name_dflt} \
                                -script {name_fn} <w>
end


function show_V_I
           
        delete /data
        delete /fig
        delete /cond
        delete /Cafig

        make_Ca_graph
        make_Vmgraph
        make_Igraph
        graph_cond

//--------------------------    IS    ----------------------------
           
        if ({getfield /write-out/IS_Vm_dis state} == 1)
        addmsg /cell/IS     /data/voltage PLOT Vm *IS_Vm *{IS_Vm_color}
        end
        
        if ({getfield /write-out/IS_Im_dis state} == 1)
        addmsg /cell/IS /fig/current PLOT Im *IS_Im *{IS_Im_color}
        end
        
        if ({getfield /write-out/IS_I_Na_dis state} == 1)
        addmsg /cell/IS/IS_Na /fig/current PLOT Ik *IS_Na *{IS_I_Na_color}
        end

        if ({getfield /write-out/IS_I_K_DR_dis state} == 1)
        addmsg /cell/IS/IS_K_DR /fig/current PLOT Ik *IS_I_K_DR *{IS_I_K_DR_color}
        end
           
//--------------------------  Soma  -----------------------------

        if ({getfield /write-out/S_Vm_dis state} == 1)   
        addmsg /cell/soma   /data/voltage PLOT Vm *Soma_Vm *{S_Vm_color}  
        end

        if ({getfield /write-out/S_Im_dis state} == 1) 
        addmsg /cell/soma /fig/current PLOT Im *Im *{S_Im_color}
        end

        if ({getfield /write-out/S_I_Na_dis state} == 1)  
        addmsg /cell/soma/Na /fig/current PLOT Ik *I_Na *{S_I_Na_color}
        end

        if ({getfield /write-out/S_I_K_DR_dis state} == 1)
        addmsg /cell/soma/K_DR /fig/current PLOT Ik *I_K(DR) *{S_I_K_DR_color}
        end

        if ({getfield /write-out/S_I_AHP_dis state} == 1)
        addmsg /cell/soma/K_AHP /fig/current PLOT Ik *I_AHP *{S_I_AHP_color}
        end
        if ({getfield /write-out/S_I_K_A_dis state} == 1)
        addmsg /cell/soma/K_A /fig/current PLOT Ik *I_K_A *{S_I_K_A_color}
        end

        if ({getfield /write-out/S_I_h_dis state} == 1)
        addmsg /cell/soma/H /fig/current PLOT Ik *I_h *{S_I_h_color}
        end

        if ({getfield /write-out/S_I_Ca_T_dis state} == 1)
        addmsg /cell/soma/Ca_T /fig/current PLOT Ik *Ca_T *{S_I_Ca_T_color}
        end

        if ({getfield /write-out/S_I_Ca_N_dis state} == 1)
        addmsg /cell/soma/Ca_N /fig/current PLOT Ik *Ca_N *{S_I_Ca_N_color}   
        end

        if ({getfield /write-out/S_I_Ca_L_dis state} == 1)
        addmsg /cell/soma/Ca_L /fig/current PLOT Ik *Ca_L *{S_I_Ca_L_color} 
        end
//-------------------- Proximal Dendrite ---------------------

           
        if ({getfield /write-out/D_Vm_dis state} == 1)
        addmsg /cell/dend   /data/voltage PLOT Vm *Dend_Vm *{D_Vm_color}
        end
           
        if ({getfield /write-out/D_Im_dis state} == 1)
        addmsg /cell/dend /fig/current PLOT Im *D_Im *{D_Im_color}
        end

        if ({getfield /write-out/D_I_AHP_dis state} == 1)
        addmsg /cell/dend/D_K_AHP /fig/current PLOT Ik *D_I_AHP *{D_I_AHP_color}
        end
           
        if ({getfield /write-out/D_I_Ca_N_dis state} == 1)
        addmsg /cell/dend/D_Ca_N /fig/current PLOT Ik *D_I_Ca_N *{D_I_Ca_N_color}
        end
           
        if ({getfield /write-out/D_I_Ca_L_dis state} == 1)
        addmsg /cell/dend/D_Ca_L /fig/current PLOT Ik *D_I_Ca_L *{D_I_Ca_L_color}
        end

        if ({getfield /write-out/D_I_Ca_T_dis state} == 1)
        addmsg /cell/dend/D_Ca_T /fig/current PLOT Ik *D_I_Ca_T *{D_I_Ca_T_color}
        end

        if ({getfield /write-out/D_I_Na_dis state} == 1)
        addmsg /cell/dend/D_Na /fig/current PLOT Ik *D_I_Na *{D_I_Na_color}
        end

        if ({getfield /write-out/D_I_h_dis state} == 1)
        addmsg /cell/dend/D_H /fig/current PLOT Ik *D_I_h *{D_I_h_color}
        end



//===============  Resume the display for I injection  ============

    if ({getfield /I_injection/Dend_or_Soma state} == 1)
        addmsg /cell/soma /fig/current PLOT inject *I_inj_Soma *blue
    else
        addmsg /cell/dend /fig/current PLOT inject *I_inj_Dend *white
    end
           
//===============  Resume the display for I pulse injection  ============

    if ({getfield /I_injection/Axon_or_Soma_pulse state} == 0)
        addmsg /cell/soma /fig/current PLOT inject *I_Pulse_Soma *blue
    else
        addmsg /cell/axon /fig/current PLOT inject *I_Pulse_Axon *cyan
    end

//========= Resume the displays for Conductance and Ca_Concen =========

//---------------------  Conductances ----------------------

  addmsg /cell/soma/K_AHP /cond/channel_Gk PLOT Gk *Soma_Gk_AHP *{S_I_AHP_color}
  addmsg /cell/dend/D_K_AHP /cond/channel_Gk PLOT Gk *Dend_Gk_AHP *{D_I_AHP_color}

//------------------- Ca concentration --------------------
  addmsg /cell/soma/Ca_conc /Cafig/Ca PLOT Ca *Soma_Ca_concen *{S_I_AHP_color}
  addmsg /cell/dend/D_Ca_conc /Cafig/Ca PLOT Ca *Dend_Ca_concen *{D_I_AHP_color}


	xshow /Cafig
	xshow /cond
        xshow /data
        xshow /fig
        reset
end        

//========================  Make current injection panel ==================


function make_current_inj_panel

    create xform /I_injection [603,173,310,450]
    create xlabel /I_injection/label1 -hgeom 20 -bg cyan -label "Current Injection"
    create xtoggle /I_injection/Dend_or_Soma  -script Dend_Soma_inj \
					      -onfg blue -offfg white
    setfield /I_injection/Dend_or_Soma \
		 offlabel "Inject to P-Dendrite or Soma ? -- Dend." state 0\
                 onlabel  "Inject to P-Dendrite or Soma ? -- Soma"  state 1

    create xdialog /I_injection/Mode -label "0=Sin; 1=Sq; 2=Tri; 3=Const"\
                        -value {md} -script "I_md <widget>"
                        
    create xdialog /I_injection/Amplitude -label "Amplitude (Amp)"  -value {amp} \
                                -script "I_amp <widget>"
                                
    create xdialog /I_injection/Dc_offset -label "Dc_offset (Amp)"  -value {dc_off} \
                                -script "I_dc_off <widget>"
                                
    create xdialog /I_injection/Phase -label "Phase (degree)"  -value {phs} \
                                -script "I_phs <widget>"
                                
    create xdialog /I_injection/Frequency -label "Frequency (Hz)"\
				-value {f} -script "I_f <widget>"

//-------------------------------  Pulse  injection -----------------------------

    create xlabel /I_injection/label2 -hgeom 20 -bg cyan -label "Dual Pulse Injection"
    create xtoggle /I_injection/Axon_or_Soma_pulse  -script Axon_Soma_pulse \
						    -onfg cyan -offfg blue
    setfield /I_injection/Axon_or_Soma_pulse \
		offlabel "Pulses to Axon or Soma ? -- SOMA" state 0\
		onlabel  "Pulses to Axon or Soma ? -- AXON" state 1

    create xdialog /I_injection/Trig_mode \
			-label "0=free; 1=ext_trig; 2=ext_gate"\
                        -value {trig} -script "Pulse_mode <widget>"
   
    create xdialog /I_injection/level1 -label "Amplitude_1 (A) [e.g. 10e-9]"\
			  	-value {level_1} -script "Pulse_level1 <widget>"
   
    create xdialog /I_injection/width1 -label "width_1 (Sec) [e.g. 0.02]"\  
				-value {width_1} -script "Pulse_width1 <widget>"
   
    create xdialog /I_injection/delay1 -label "delay_1 (Sec) [e.g. 0.02]"\ 
				 -value {delay_1}  -script "Pulse_delay1 <widget>"

    create xdialog /I_injection/level2 -label "Amplitude_2 (A)"  -value {level_2} \
                                -script "Pulse_level2 <widget>"

    create xdialog /I_injection/width2 -label "width_2 (Sec)"  -value {width_2} \
                                -script "Pulse_width2 <widget>"
                                
    create xdialog /I_injection/delay2 -label "delay_2 (Sec)"  -value {delay_2} \
                                -script "Pulse_delay2 <widget>"
    xshow /I_injection           

end


function I_md (path)
        str path
        setfield /cell/Iinjection mode {getfield {path} value}
end                     

function I_amp (path)
        str path
        setfield /cell/Iinjection amplitude {getfield {path} value}
end
                                
function I_dc_off (path)
        str path
        setfield /cell/Iinjection dc_offset {getfield {path} value}
end
                                
function I_phs (path)
        str path
        setfield /cell/Iinjection phase {getfield {path} value}
end
   
function I_f (path) 
        str path
        setfield /cell/Iinjection frequency {getfield {path} value}
end

function Dend_Soma_inj
        deletemsg  /cell/Iinjection 0  -outgoing 
        setfield /cell/soma inject 0.0
        setfield /cell/axon inject 0.0
        setfield /cell/dend inject 0.0
    if ({getfield /I_injection/Dend_or_Soma state} == 1)
       	addmsg /cell/Iinjection /cell/soma INJECT output
    else
        addmsg /cell/Iinjection /cell/dend INJECT output
    end
    show_V_I	//in "display_def.g". Renew displays for all currents
end

function Axon_Soma_pulse
        deletemsg  /cell/pulse1 0  -outgoing
        setfield /cell/soma inject 0.0
        setfield /cell/axon inject 0.0
        setfield /cell/dend inject 0.0
    if ({getfield /I_injection/Axon_or_Soma_pulse state} == 0)
        addmsg /cell/pulse1 /cell/soma INJECT output                                
    else
        addmsg /cell/pulse1 /cell/axon INJECT output
    end 
	show_V_I  // in "display_def.g". Renew displays for all currents.
end


function Pulse_mode (path)

        str path

//fixing the trig mode by defualt value (0) because at present time 
//other two trig modes (ext. trig and ext. gate) are not programmed yet.

	setfield /cell/pulse1 trig_mode {trig} 
        setfield /I_injection/Trig_mode value  {trig}
        xshow /I_injection


//      setfield /cell/pulse1 trig_mode {getfield {path} value}

end


function Pulse_level1 (path)
        str path
        setfield /cell/pulse1 level1 {getfield {path} value}
end

function Pulse_width1 (path)
        str path
        setfield /cell/pulse1 width1 {getfield {path} value}
end

function Pulse_delay1 (path)
        str path
        setfield /cell/pulse1 delay1 {getfield {path} value}
end

function Pulse_level2 (path)
        str path
        setfield /cell/pulse1 level2 {getfield {path} value}
end
        
function Pulse_width2 (path)
        str path
        setfield /cell/pulse1 width2 {getfield {path} value}
end
       
function Pulse_delay2 (path)
        str path
        setfield /cell/pulse1 delay2 {getfield {path} value}
end     



//================= Make Conduactance Input Panels  ================

function gk_bars (y,compt_name,g0, g1, g_dflt_1, g_fn_1,\
                                   g2, g_dflt_2, g_fn_2,\ 
                                   g3, g_dflt_3, g_fn_3,\
                                   g4, g_dflt_4, g_fn_4,\
                                   g5, g_dflt_5, g_fn_5,\
                                   g6, g_dflt_6, g_fn_6,\ 
                                   g7, g_dflt_7, g_fn_7,\
                                   g8, g_dflt_8, g_fn_8,\
                                   g9, g_dflt_9, g_fn_9 )

  int y
  str compt_name, g0,g1,g2,g3,g4,g5,g6,g7,g8,g9 
  str g_fn_1,g_fn_2,g_fn_3,g_fn_4,g_fn_5,g_fn_6,g_fn_7,g_fn_8,g_fn_9
  float g_dflt_1,g_dflt_2,g_dflt_3,g_dflt_4
  float g_dflt_5,g_dflt_6,g_dflt_7,g_dflt_8,g_dflt_9
                                
  create xlabel /max_cond/{g0} [0,{y},100,25]  -label {compt_name}

  create xdialog /max_cond/{g1} [100,{y},80,25] -label ""\
                                -value {g_dflt_1} \
                                -script {g_fn_1} 
  create xdialog /max_cond/{g2} [180,{y},80,25] -label ""\
                                -value {g_dflt_2} \
                                -script {g_fn_2}   
  create xdialog /max_cond/{g3} [260,{y},80,25] -label ""\
                                -value {g_dflt_3} \
                                -script {g_fn_3} 
  create xdialog /max_cond/{g4} [340,{y},80,25] -label ""\
                                -value {g_dflt_4} \
                                -script {g_fn_4} 
  create xdialog /max_cond/{g5} [420,{y},80,25]  -label ""\
                                -value {g_dflt_5} \
                                -script {g_fn_5} 
  create xdialog /max_cond/{g6} [500,{y},80,25]  -label ""\
                                -value {g_dflt_6} \
                                -script {g_fn_6} 
  create xdialog /max_cond/{g7} [580,{y},80,25] -label ""\
                                -value {g_dflt_7} \
                                -script {g_fn_7} 
  create xdialog /max_cond/{g8} [660,{y},80,25] -label ""\
                                -value {g_dflt_8} \
                                -script {g_fn_8} 
  create xdialog /max_cond/{g9} [740,{y},80,25] -label ""\
                                -value {g_dflt_9} \
                                -script {g_fn_9} 
end
                                

function make_gk_panel

  create xform /max_cond [70,545,838,168]

  create xlabel /max_cond/label1 -wgeom 836 -hgeom 25 -bg cyan \
          -label "Density of Max. Conductances (Siemen/m^2)"

  create xlabel /max_cond/label2 [0,25,100,25] -bg cyan \
                                -label "Compartments"
  create xlabel /max_cond/label3 [100,25,80,25] -bg cyan \
                                -label "gNa"
  create xlabel /max_cond/label4 [180,25,80,25] -bg cyan \
                                -label "gK_DR"         
  create xlabel /max_cond/label5 [260,25,80,25] -bg cyan \
                                -label "gK_AHP"         
  create xlabel /max_cond/label6 [340,25,80,25] -bg cyan \
                                -label "gK_A"         
  create xlabel /max_cond/label7 [420,25,80,25] -bg cyan \
                                -label "gh"         
  create xlabel /max_cond/label8 [500,25,80,25] -bg cyan \
                                -label "gCa_T"         
  create xlabel /max_cond/label9 [580,25,80,25] -bg cyan \
                                -label "gCa_N"         
  create xlabel /max_cond/label11 [660,25,80,25] -bg cyan \
                                -label "gCa_L"         
  create xlabel /max_cond/label12 [740,25,80,25] -bg cyan \
                                -label "gleak"

gk_bars 50  Axon ax0 ax1 {ax_GNa} 	gk_fn_set\
                     ax2 {ax_GK_DR}	gk_fn_set\
                     ax3 {ax_GK_AHP} 	gk_fn_0\
                     ax4 {ax_GK_A} 	gk_fn_0\
                     ax5 {ax_Gh}	gk_fn_0\
                     ax6 {ax_GCa_T} 	gk_fn_0\
                     ax7 {ax_GCa_N} 	gk_fn_0\
                     ax8 {ax_GCa_L} 	gk_fn_0\
                     ax9 {ax_Gleak} 	gk_fn_set


gk_bars 75  I.S. IS0 IS1  {IS_GNa}	gk_fn_set\
		     IS2  {IS_GK_DR}	gk_fn_set\
		     IS3  {IS_GK_AHP}	gk_fn_0\
		     IS4  {IS_GK_A}	gk_fn_0\
		     IS5  {IS_Gh}	gk_fn_0\
		     IS6  {IS_GCa_T}	gk_fn_0\
		     IS7  {IS_GCa_N}	gk_fn_0\
		     IS8  {IS_GCa_L}	gk_fn_0\
                     IS9  {IS_Gleak}	gk_fn_set 


gk_bars 100  Soma sm0 sm1 {sm_GNa}	gk_fn_set\
                      sm2 {sm_GK_DR} 	gk_fn_set\
                      sm3 {sm_GK_AHP} 	gk_fn_set\
                      sm4 {sm_GK_A} 	gk_fn_set\
                      sm5 {sm_Gh} 	gk_fn_set\
                      sm6 {sm_GCa_T} 	gk_fn_set\
                      sm7 {sm_GCa_N} 	gk_fn_set\
                      sm8 {sm_GCa_L} 	gk_fn_set\
                      sm9 {sm_Gleak} 	gk_fn_set

gk_bars 125  P-Dendrite pd0 pd1   {pd_GNa} 	gk_fn_set\
                     	    pd2   {pd_GK_DR} 	gk_fn_set\
                            pd3   {pd_GK_AHP} 	gk_fn_set\
                            pd4   {pd_GK_A} 	gk_fn_set\
                            pd5   {pd_Gh} 	gk_fn_set\
                            pd6   {pd_GCa_T} 	gk_fn_set\
                            pd7   {pd_GCa_N} 	gk_fn_set\
                            pd8   {pd_GCa_L}  	gk_fn_set\
                            pd9   {pd_Gleak}	gk_fn_set
 	xshow /max_cond

end


function gk_fn_0 

	setfield /max_cond/ax3 value N/A
        setfield /max_cond/ax4 value N/A
        setfield /max_cond/ax5 value N/A
        setfield /max_cond/ax6 value N/A
        setfield /max_cond/ax7 value N/A
        setfield /max_cond/ax8 value N/A

        setfield /max_cond/IS3 value N/A
        setfield /max_cond/IS4 value N/A
        setfield /max_cond/IS5 value N/A
        setfield /max_cond/IS6 value N/A
        setfield /max_cond/IS7 value N/A
        setfield /max_cond/IS8 value N/A

end


// Reset the data for all conductances according to keyboard input

function gk_fn_set

// Re-setting the max. conductance (Gbar) for all currents according to
// the input values from keyboard.

//========================  Axon ==============================

setfield /cell/axon/Na Gbar   {Axon_A * {getfield /max_cond/ax1 value}}
setfield /cell/axon/K_DR Gbar {Axon_A * {getfield /max_cond/ax2 value}}
setfield /cell/axon/K_leak Gk {Axon_A * {getfield /max_cond/ax9 value}}

ax_GNa	 = {getfield /max_cond/ax1 value}
ax_GK_DR = {getfield /max_cond/ax2 value}
ax_Gleak = {getfield /max_cond/ax9 value}

//========================  IS  ==============================

setfield /cell/IS/IS_Na   Gbar   {IS_A * {getfield /max_cond/IS1 value}}
setfield /cell/IS/IS_K_DR Gbar   {IS_A * {getfield /max_cond/IS2 value}}
setfield /cell/IS/K_leak  Gk     {IS_A * {getfield /max_cond/IS9 value}}

IS_GNa   = {getfield /max_cond/IS1 value}
IS_GK_DR = {getfield /max_cond/IS2 value}
IS_Gleak = {getfield /max_cond/IS9 value}

//========================  soma  ==============================
 
setfield /cell/soma/Na     Gbar   {SOMA_A * {getfield /max_cond/sm1 value}}
setfield /cell/soma/K_DR   Gbar   {SOMA_A * {getfield /max_cond/sm2 value}}
setfield /cell/soma/K_AHP  Gbar   {SOMA_A * {getfield /max_cond/sm3 value}}
setfield /cell/soma/K_A    Gbar   {SOMA_A * {getfield /max_cond/sm4 value}}
setfield /cell/soma/H 	   Gbar   {SOMA_A * {getfield /max_cond/sm5 value}}
setfield /cell/soma/Ca_T   Gbar   {SOMA_A * {getfield /max_cond/sm6 value}}
setfield /cell/soma/Ca_N   Gbar   {SOMA_A * {getfield /max_cond/sm7 value}}
setfield /cell/soma/Ca_L   Gbar   {SOMA_A * {getfield /max_cond/sm8 value}}
setfield /cell/soma/K_leak Gk     {SOMA_A * {getfield /max_cond/sm9 value}}

sm_GNa    = {getfield /max_cond/sm1 value}
sm_GK_DR  = {getfield /max_cond/sm2 value}
sm_GK_AHP = {getfield /max_cond/sm3 value}
sm_GK_A   = {getfield /max_cond/sm4 value}
sm_Gh     = {getfield /max_cond/sm5 value}
sm_GCa_T  = {getfield /max_cond/sm6 value}
sm_GCa_N  = {getfield /max_cond/sm7 value}
sm_GCa_L  = {getfield /max_cond/sm8 value}
sm_Gleak  = {getfield /max_cond/sm9 value}

//======================== Proximal dendrite  ==============================

setfield /cell/dend/D_Na    Gbar  {dend_A * {getfield /max_cond/pd1 value}}
setfield /cell/dend/D_K_DR  Gbar  {dend_A * {getfield /max_cond/pd2 value}}
setfield /cell/dend/D_K_AHP Gbar  {dend_A * {getfield /max_cond/pd3 value}}
setfield /cell/dend/D_K_A   Gbar  {dend_A * {getfield /max_cond/pd4 value}}
setfield /cell/dend/D_H     Gbar  {dend_A * {getfield /max_cond/pd5 value}}
setfield /cell/dend/D_Ca_T  Gbar  {dend_A * {getfield /max_cond/pd6 value}}
setfield /cell/dend/D_Ca_N  Gbar  {dend_A * {getfield /max_cond/pd7 value}}
setfield /cell/dend/D_Ca_L  Gbar  {dend_A * {getfield /max_cond/pd8 value}}
setfield /cell/dend/K_leak  Gk    {dend_A * {getfield /max_cond/pd9 value}}

pd_GNa    = {getfield /max_cond/pd1 value}
pd_GK_DR  = {getfield /max_cond/pd2 value}
pd_GK_AHP = {getfield /max_cond/pd3 value}
pd_GK_A   = {getfield /max_cond/pd4 value}
pd_Gh     = {getfield /max_cond/pd5 value}
pd_GCa_T  = {getfield /max_cond/pd6 value}
pd_GCa_N  = {getfield /max_cond/pd7 value}
pd_GCa_L  = {getfield /max_cond/pd8 value}
pd_Gleak  = {getfield /max_cond/pd9 value}

reset

end

