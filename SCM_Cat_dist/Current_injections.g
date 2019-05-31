// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001
//

function I_injection(path)
        str path
        if ({exists {path}/Iinjection})  
                return
        end
        create funcgen {path}/Iinjection 
        setfield ^\
                mode           {md}     \Sin=0, Sq=1, Tri=2,Const=3   
                amplitude      {amp}     \
                dc_offset      {dc_off} \ Constant to be added to output
                phase          {phs}    \ phase in degree   
                frequency      {f}      \
                output         {out}
end

                
//----------------------------------------------------------------------
// Pulse Generator

function Pulse_injection(path)
        str path
        if ({exists {path}/pulse1})  
                return
        end

create pulsegen {path}/pulse1
setfield ^      level1 {level_1}          \
                width1 {width_1}          \
                delay1 {delay_1}          \
                level2 {level_2}          \
                width2 {width_2}          \
                delay2 {delay_2}          \
                baselevel {base}          \
                trig_mode {trig}   //0=free run, 1=ext. trig, 2=ext. gate
end

