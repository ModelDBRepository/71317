// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001

include Make_Panels.g

function make_control
    create xform /control [604,0,310,145]
    create xlabel /control/label -hgeom 20 -bg cyan -label "CONTROL PANEL"
    create xbutton /control/RESET -wgeom 33%       -script reset
    create xbutton /control/RUN  -xgeom 0:RESET -ygeom 0:label -wgeom 33% \
				         -script step_tmax
    create xbutton /control/QUIT -xgeom 0:RUN -ygeom 0:label -wgeom 34% \
       					 -script quit
    create xdialog /control/t_max  -label "Simulation Time (Sec)"\
               			-value {tmax} -script "t_max <widget>" 
    create xdialog /control/t_step -label "Time Step (Sec)"\  
				-value {dt} -script "t_step <widget>"

    create xtoggle /control/Gk_input  -script Gk_input_panel \
                                      -onfg blue -offfg blue
    setfield /control/Gk_input \
                 offlabel "Set g_max ? Click --> Yes" state 1\
                 onlabel  "Done with g_max setting ? Click --> Yes"  state 0

    xshow /control
end


function Gk_input_panel

    if ({getfield /control/Gk_input state} == 1)
	make_gk_panel
    else
	delete /max_cond
    end


end

function step_tmax
        step {tmax} -time
end

function t_max (path)

        str path
        tmax = {getfield {path} value}

	show_V_I
	reset
end

function t_step (path)
        str path
        setclock 0 {getfield {path} value}
	dt =  {getfield {path} value}
end

