// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001

include Write_out.g  

//-----------------------------  IS Vm  ------------------------------


function  IS_Vm_write
    
    if ({getfield /write-out/IS_Vm_wrt state} == 0)

        delete /output/{IS_Vm_NAME}
    else
        IS_Vm_NAME = {getfield /write-out/IS_Vm_Nm value}
        ASC_out {IS_Vm_NAME}  /cell/IS Vm
    end  
    reset
end 
    
function IS_Vm_filename (path)

        str path

        if ({getfield /write-out/IS_Vm_wrt state} == 1)
                delete /output/{IS_Vm_NAME}
                IS_Vm_NAME = {getfield /write-out/IS_Vm_Nm value}
                ASC_out {IS_Vm_NAME}  /cell/IS Vm
                reset
        end
end     
    
//-----------------------------  IS Im  ------------------------------


function  IS_Im_write

    if ({getfield /write-out/IS_Im_wrt state} == 0)
                
        delete /output/{IS_Im_NAME}
    else
        IS_Im_NAME = {getfield /write-out/IS_Im_Nm value}
        ASC_out {IS_Im_NAME}  /cell/IS Im
    end
    reset
    
end

function IS_Im_filename (path)
        
        str path
    
        if ({getfield /write-out/IS_Im_wrt state} == 1)
                delete /output/{IS_Im_NAME}
                IS_Im_NAME = {getfield /write-out/IS_Im_Nm value}
                ASC_out {IS_Im_NAME}  /cell/IS Im   
                reset
        end
end


//-----------------------------  IS I_Na  ------------------------------

function  IS_I_Na_write
    if ({getfield /write-out/IS_I_Na_wrt state} == 0)
        delete /output/{IS_I_Na_NAME}
    else
        IS_I_Na_NAME = {getfield /write-out/IS_I_Na_Nm value}
        ASC_out {IS_I_Na_NAME}  /cell/IS/IS_Na Ik
    end
    reset
end

function IS_I_Na_filename (path)
        str path
        if ({getfield /write-out/IS_I_Na_wrt state} == 1)
                delete /output/{IS_I_Na_NAME}
                IS_I_Na_NAME = {getfield /write-out/IS_I_Na_Nm value}
                ASC_out {IS_I_Na_NAME}  /cell/IS/IS_Na Ik
                reset
        end
end
//-----------------------------  IS I_K_DR  ------------------------------
    
function  IS_I_K_DR_write
    if ({getfield /write-out/IS_I_K_DR_wrt state} == 0)
        delete /output/{IS_I_K_DR_NAME}
    else
        IS_I_K_DR_NAME = {getfield /write-out/IS_I_K_DR_Nm value}
        ASC_out {IS_I_K_DR_NAME}  /cell/IS/IS_K_DR Ik
    end
    reset
end
        
function IS_I_K_DR_filename (path)
        str path
        if ({getfield /write-out/IS_I_K_DR_wrt state} == 1)
                delete /output/{IS_I_K_DR_NAME}
                IS_I_K_DR_NAME = {getfield /write-out/IS_I_K_DR_Nm value}
                ASC_out {IS_I_K_DR_NAME}  /cell/IS/IS_K_DR Ik
                reset
        end
end

//-----------------------------  Soma Vm  ------------------------------


function  S_Vm_write


    if ({getfield /write-out/S_Vm_wrt state} == 0)

// delete the writing file: /output/{S_Vm_NAME} created by
// function ASC_out in file Write-out.g 

	delete /output/{S_Vm_NAME}
    else
        S_Vm_NAME = {getfield /write-out/S_Vm_Nm value}
        ASC_out {S_Vm_NAME}  /cell/soma Vm
    end
    reset

end         


function S_Vm_filename (path)

	str path

                
        if ({getfield /write-out/S_Vm_wrt state} == 1)
        	delete /output/{S_Vm_NAME}
                S_Vm_NAME = {getfield /write-out/S_Vm_Nm value}
                ASC_out {S_Vm_NAME}  /cell/soma Vm
		reset
	end
end 


//-----------------------------  Soma Im  ------------------------------


function  S_Im_write


    if ({getfield /write-out/S_Im_wrt state} == 0)

        delete /output/{S_Im_NAME}
    else
        S_Im_NAME = {getfield /write-out/S_Im_Nm value}
        ASC_out {S_Im_NAME}  /cell/soma Im
    end
    reset

end


function S_Im_filename (path)

        str path

        if ({getfield /write-out/S_Im_wrt state} == 1)
                delete /output/{S_Im_NAME}
                S_Im_NAME = {getfield /write-out/S_Im_Nm value}
                ASC_out {S_Im_NAME}  /cell/soma Im
                reset
        end
end


//-----------------------------  Soma I_inj  ------------------------------
        
    
function  S_I_inj_write
        

    if ({getfield /write-out/S_I_inj_wrt state} == 0)
    
        
        delete /output/{S_I_inj_NAME}
    else
        S_I_inj_NAME = {getfield /write-out/S_I_inj_Nm value}
        ASC_out {S_I_inj_NAME}  /cell/soma inject
    end
    reset
           
end


function S_I_inj_filename (path)

        str path

        if ({getfield /write-out/S_I_inj_wrt state} == 1)
                delete /output/{S_I_inj_NAME}
                S_I_inj_NAME = {getfield /write-out/S_I_inj_Nm value}
                ASC_out {S_I_inj_NAME}  /cell/soma inject
                reset
        end
end     

//-----------------------------  Soma I_Na  ------------------------------

function  S_I_Na_write
    if ({getfield /write-out/S_I_Na_wrt state} == 0)   
        delete /output/{S_I_Na_NAME}
    else
        S_I_Na_NAME = {getfield /write-out/S_I_Na_Nm value}
        ASC_out {S_I_Na_NAME}  /cell/soma/Na Ik
    end
    reset  
end

function S_I_Na_filename (path)
        str path
        if ({getfield /write-out/S_I_Na_wrt state} == 1)
                delete /output/{S_I_Na_NAME}
                S_I_Na_NAME = {getfield /write-out/S_I_Na_Nm value}
                ASC_out {S_I_Na_NAME}  /cell/soma/Na Ik
                reset
        end
end    

//-----------------------------  Soma I_K_DR  ------------------------------

function  S_I_K_DR_write
    if ({getfield /write-out/S_I_K_DR_wrt state} == 0)
        delete /output/{S_I_K_DR_NAME}  
    else
        S_I_K_DR_NAME = {getfield /write-out/S_I_K_DR_Nm value}
        ASC_out {S_I_K_DR_NAME}  /cell/soma/K_DR Ik
    end
    reset
end 
        
function S_I_K_DR_filename (path)
        str path
        if ({getfield /write-out/S_I_K_DR_wrt state} == 1)
                delete /output/{S_I_K_DR_NAME}
                S_I_K_DR_NAME = {getfield /write-out/S_I_K_DR_Nm value}
                ASC_out {S_I_K_DR_NAME}  /cell/soma/K_DR Ik
                reset
        end
end

//-----------------------------  Soma I_AHP  ------------------------------

function  S_I_AHP_write
    if ({getfield /write-out/S_I_AHP_wrt state} == 0)
        delete /output/{S_I_AHP_NAME}
    else        
        S_I_AHP_NAME = {getfield /write-out/S_I_AHP_Nm value}
        ASC_out {S_I_AHP_NAME}  /cell/soma/K_AHP Ik
    end 
    reset
end             
                
function S_I_AHP_filename (path)
        str path
        if ({getfield /write-out/S_I_AHP_wrt state} == 1)
                delete /output/{S_I_AHP_NAME}
                S_I_AHP_NAME = {getfield /write-out/S_I_AHP_Nm value}
                ASC_out {S_I_AHP_NAME}  /cell/soma/K_AHP Ik
                reset
        end
end

//-----------------------------  Soma I_K_A  ------------------------------

function  S_I_K_A_write
    if ({getfield /write-out/S_I_K_A_wrt state} == 0)
        delete /output/{S_I_K_A_NAME}
    else
        S_I_K_A_NAME = {getfield /write-out/S_I_K_A_Nm value}
        ASC_out {S_I_K_A_NAME}  /cell/soma/K_A Ik
    end
    reset
end
   
function S_I_K_A_filename (path)
        str path
        if ({getfield /write-out/S_I_K_A_wrt state} == 1)
                delete /output/{S_I_K_A_NAME}
                S_I_K_A_NAME = {getfield /write-out/S_I_K_A_Nm value}
                ASC_out {S_I_K_A_NAME}  /cell/soma/K_A Ik
                reset
        end
end

//-----------------------------  Soma I_h  ------------------------------

function  S_I_h_write
    if ({getfield /write-out/S_I_h_wrt state} == 0)
        delete /output/{S_I_h_NAME}
    else
        S_I_h_NAME = {getfield /write-out/S_I_h_Nm value}
        ASC_out {S_I_h_NAME}  /cell/soma/H Ik
    end
    reset
end
        
function S_I_h_filename (path)
        str path
        if ({getfield /write-out/S_I_h_wrt state} == 1)
                delete /output/{S_I_h_NAME}
                S_I_h_NAME = {getfield /write-out/S_I_h_Nm value}
                ASC_out {S_I_h_NAME}  /cell/soma/H Ik
                reset
        end
end

//-----------------------------  Soma I_Ca_T  ------------------------------

function  S_I_Ca_T_write
    if ({getfield /write-out/S_I_Ca_T_wrt state} == 0)
        delete /output/{S_I_Ca_T_NAME}
    else
        S_I_Ca_T_NAME = {getfield /write-out/S_I_Ca_T_Nm value}
        ASC_out {S_I_Ca_T_NAME}  /cell/soma/Ca_T Ik
    end
    reset
end
        
function S_I_Ca_T_filename (path)
        str path
        if ({getfield /write-out/S_I_Ca_T_wrt state} == 1)
                delete /output/{S_I_Ca_T_NAME}
                S_I_Ca_T_NAME = {getfield /write-out/S_I_Ca_T_Nm value}
                ASC_out {S_I_Ca_T_NAME}  /cell/soma/Ca_T Ik
                reset
        end
end

//-----------------------------  Soma I_Ca_L  ------------------------------

function  S_I_Ca_L_write
    if ({getfield /write-out/S_I_Ca_L_wrt state} == 0)
        delete /output/{S_I_Ca_L_NAME}
    else
        S_I_Ca_L_NAME = {getfield /write-out/S_I_Ca_L_Nm value}
        ASC_out {S_I_Ca_L_NAME}  /cell/soma/Ca_L Ik
    end
    reset
end
   
function S_I_Ca_L_filename (path)
        str path
        if ({getfield /write-out/S_I_Ca_L_wrt state} == 1)
                delete /output/{S_I_Ca_L_NAME}
                S_I_Ca_L_NAME = {getfield /write-out/S_I_Ca_L_Nm value}
                ASC_out {S_I_Ca_L_NAME}  /cell/soma/Ca_L Ik
                reset
        end
end

//-----------------------------  Soma I_Ca_N  ------------------------------

function  S_I_Ca_N_write
    if ({getfield /write-out/S_I_Ca_N_wrt state} == 0)
        delete /output/{S_I_Ca_N_NAME}
    else
        S_I_Ca_N_NAME = {getfield /write-out/S_I_Ca_N_Nm value}
        ASC_out {S_I_Ca_N_NAME}  /cell/soma/Ca_N Ik
    end
    reset
end
   
function S_I_Ca_N_filename (path)
        str path
        if ({getfield /write-out/S_I_Ca_N_wrt state} == 1)
                delete /output/{S_I_Ca_N_NAME}
                S_I_Ca_N_NAME = {getfield /write-out/S_I_Ca_N_Nm value}
                ASC_out {S_I_Ca_N_NAME}  /cell/soma/Ca_N Ik
                reset
        end
end


//-----------------------------  P-Dendrite Vm  ------------------------------
        

function  D_Vm_write


    if ({getfield /write-out/D_Vm_wrt state} == 0)
                
        delete /output/{D_Vm_NAME}
    else   
        D_Vm_NAME = {getfield /write-out/D_Vm_Nm value}
        ASC_out {D_Vm_NAME}  /cell/dend Vm
    end
    reset
        
end 

        
function D_Vm_filename (path)

        str path

        if ({getfield /write-out/D_Vm_wrt state} == 1) 
                delete /output/{D_Vm_NAME}
                D_Vm_NAME = {getfield /write-out/D_Vm_Nm value}
                ASC_out {D_Vm_NAME}  /cell/dend Vm
                reset
        end
end        



//-----------------------------  P-Dendrite Im  ------------------------------


function  D_Im_write


    if ({getfield /write-out/D_Im_wrt state} == 0)

        delete /output/{D_Im_NAME}
    else
        D_Im_NAME = {getfield /write-out/D_Im_Nm value}
        ASC_out {D_Im_NAME}  /cell/dend Im
    end
    reset

end

function D_Im_filename (path)
        
        str path
    
        if ({getfield /write-out/D_Im_wrt state} == 1)
                delete /output/{D_Im_NAME}
                D_Im_NAME = {getfield /write-out/D_Im_Nm value}
                ASC_out {D_Im_NAME}  /cell/dend Im
                reset
        end
end


//----------------------------- P-Dendrite I_AHP  ------------------------------

function  D_I_AHP_write
    if ({getfield /write-out/D_I_AHP_wrt state} == 0)
        delete /output/{D_I_AHP_NAME}
    else
        D_I_AHP_NAME = {getfield /write-out/D_I_AHP_Nm value}
        ASC_out {D_I_AHP_NAME}  /cell/dend/D_K_AHP Ik
    end  
    reset
end 

function D_I_AHP_filename (path)
        str path
        if ({getfield /write-out/D_I_AHP_wrt state} == 1)
                delete /output/{D_I_AHP_NAME}
                D_I_AHP_NAME = {getfield /write-out/D_I_AHP_Nm value}
                ASC_out {D_I_AHP_NAME}  /cell/dend/D_K_AHP Ik
                reset
        end
end


//----------------------------- P-Dendrite I_Ca_L  ------------------------------

function  D_I_Ca_L_write
    if ({getfield /write-out/D_I_Ca_L_wrt state} == 0)
        delete /output/{D_I_Ca_L_NAME}
    else
        D_I_Ca_L_NAME = {getfield /write-out/D_I_Ca_L_Nm value}
        ASC_out {D_I_Ca_L_NAME}  /cell/dend/D_Ca_L Ik
    end
    reset
end
        
function D_I_Ca_L_filename (path)
        str path
        if ({getfield /write-out/D_I_Ca_L_wrt state} == 1)
                delete /output/{D_I_Ca_L_NAME}
                D_I_Ca_L_NAME = {getfield /write-out/D_I_Ca_L_Nm value}
                ASC_out {D_I_Ca_L_NAME}  /cell/dend/D_Ca_L Ik
                reset
        end
end

//----------------------------- P_Dendrite I_Ca_N  ------------------------------

function  D_I_Ca_N_write
    if ({getfield /write-out/D_I_Ca_N_wrt state} == 0)
        delete /output/{D_I_Ca_N_NAME}
    else
        D_I_Ca_N_NAME = {getfield /write-out/D_I_Ca_N_Nm value}
        ASC_out {D_I_Ca_N_NAME}  /cell/dend/D_Ca_N Ik
    end
    reset
end
        
function D_I_Ca_N_filename (path)
        str path
        if ({getfield /write-out/D_I_Ca_N_wrt state} == 1)
                delete /output/{D_I_Ca_N_NAME}
                D_I_Ca_N_NAME = {getfield /write-out/D_I_Ca_N_Nm value}
                ASC_out {D_I_Ca_N_NAME}  /cell/dend/D_Ca_N Ik
                reset
        end
end

//----------------------------- P_Dendrite I_Ca_T  ------------------------------
        
function  D_I_Ca_T_write
    if ({getfield /write-out/D_I_Ca_T_wrt state} == 0)
        delete /output/{D_I_Ca_T_NAME}
    else   
        D_I_Ca_T_NAME = {getfield /write-out/D_I_Ca_T_Nm value}
        ASC_out {D_I_Ca_T_NAME}  /cell/dend/D_Ca_T Ik
    end         
    reset
end             

function D_I_Ca_T_filename (path)
        str path
        if ({getfield /write-out/D_I_Ca_T_wrt state} == 1)
                delete /output/{D_I_Ca_T_NAME}
                D_I_Ca_T_NAME = {getfield /write-out/D_I_Ca_T_Nm value}
                ASC_out {D_I_Ca_T_NAME}  /cell/dend/D_Ca_T Ik
                reset
        end
end

//----------------------------- P_Dendrite I_Na  ------------------------------
        
function  D_I_Na_write
    if ({getfield /write-out/D_I_Na_wrt state} == 0)
        delete /output/{D_I_Na_NAME}
    else   
        D_I_Na_NAME = {getfield /write-out/D_I_Na_Nm value}
        ASC_out {D_I_Na_NAME}  /cell/dend/D_Na Ik
    end         
    reset
end             

function D_I_Na_filename (path)
        str path
        if ({getfield /write-out/D_I_Na_wrt state} == 1)
                delete /output/{D_I_Na_NAME}
                D_I_Na_NAME = {getfield /write-out/D_I_Na_Nm value}
                ASC_out {D_I_Na_NAME}  /cell/dend/D_Na Ik
                reset
        end
end

//----------------------------- P_Dendrite I_h  ------------------------------
        
function  D_I_h_write
    if ({getfield /write-out/D_I_h_wrt state} == 0)
        delete /output/{D_I_h_NAME}
    else   
        D_I_h_NAME = {getfield /write-out/D_I_h_Nm value}
        ASC_out {D_I_h_NAME}  /cell/dend/D_H Ik
    end         
    reset
end             

function D_I_h_filename (path)
        str path
        if ({getfield /write-out/D_I_h_wrt state} == 1)
                delete /output/{D_I_h_NAME}
                D_I_h_NAME = {getfield /write-out/D_I_h_Nm value}
                ASC_out {D_I_h_NAME}  /cell/dend/D_H Ik
                reset
        end
end

