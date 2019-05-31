// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001


include variables.g

//******************  Channels in  Initial Segment (IS) *******************



//========================================================================
//  IS:           Tabchannel IS_Na cat cell channel  (from Traub 1977)
//========================================================================

function make_IS_Na
        if ({exists IS_Na})
                return
        end
        
        create  tabchannel      IS_Na
                setfield        ^       \
                Ek              {ENA}   \            //  V
                Gbar            { IS_GNa * IS_A } \  //  S 
                Ik              0       \            //  A
                Gk              0       \            //  S
                Xpower  3       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0


        setupalpha IS_Na X \
		{1e6*(4e-3 + 0.4*EREST_ACT - 0.4 * IS_m_shift)}\ //alpha_A
                -0.4e6 	\					//alpha_B
		-1.0	\ 					//alpha_C
		{-10e-3 - EREST_ACT +  IS_m_shift }\ 		//alpha_D
		-0.005  \					//alpha_F
               	{1e6 *(-14e-3 - 0.4*EREST_ACT + 0.4*IS_m_shift) }\ //Beta_A
                 0.4e6 	\					//Beta_B
		-1.0 	\					//Beta_C
		{-0.035 - EREST_ACT + IS_m_shift } 	\	//Beta_D
		0.005						//Beta_F

        setupalpha IS_Na Y 280.0	\ 			//alpha_A
			0.0 	\				//alpha_B
			0.0	\				//alpha_C
                	{-0.030 - EREST_ACT + IS_h_shift}\ 	//alpha_D
			0.020 	\				//alpha_F
                	4.0e3	\				//Beta_A
			0.0	\				//Beta_B
			1.0	\				//Beta_C
			{-0.030 - EREST_ACT + IS_h_shift }\ 	//Beta_D
			-1.0e-2					//Beta_F

end


//========================================================================
//  IS:              Tabchannel IS_K(DR) Cat cell channel (from Traub 1977)
//========================================================================


function make_IS_K_DR
        if ({exists IS_K_DR})
                return
        end
                
        create  tabchannel      IS_K_DR
                setfield        ^       \
                Ek              {EK}    \         // V
                Gbar            {IS_GK_DR*IS_A} \ // S
                Ik              0       \         // A
                Gk              0       \         // S
                Xpower  4       \
                Ypower  0       \
                Zpower  0

        setupalpha IS_K_DR X \
		{1e6*(0.2e-3 + 0.02*EREST_ACT - 0.02*IS_n_shift)}\ // alpha_A
		-0.02e6 	\				// alpha_B
		-1.0 		\				// alpha_C
		{-0.010 - EREST_ACT + IS_n_shift }\		// alpha_D
		-1.0e-2 	\				// alpha_F
                250 		\				// Beta_A
		0.0 		\				// Beta_B
		0.0 		\				// Beta_C
		{0.0 - EREST_ACT + IS_n_shift }	\		// Beta_D
		0.080						// Beta_F

end



//========================================================================
// IS:  Tabchannel K(AHP) Cat cell channel from Traub (1977), NOT Use !
//========================================================================


function make_IS_AHP
        if ({exists IS_K_AHP})
                return
        end

        create  tabchannel      IS_K_AHP
                setfield        ^       \
                Ek              {EK}    \                  //      V
                Gbar            { IS_GK_AHP * IS_A } \ // S (org =50)
                Ik              0       \                  //      A
                Gk              0       \                  //      S
                Xpower  2       \
                Ypower  0       \
                Zpower  0

        setupalpha K_AHP X 	{3.5*1e3}		\	// alpha_A
				0.0 			\	// alpha_B
				1.0 			\	// alpha_C
				{-1.0*(0.055 + EREST_ACT)} \	// alpha_D
				-0.004			\	// alpha_F
				{0.006*1e3} 		\	// Beta_A
				0.0 			\	// Beta_B
				0.0 			\	// Beta_C
				{ 0.0 - EREST_ACT} 	\	// Beta_D
				1e20				// Beta_F


//Jones' dara for bata:	0.015e3 0.0 -1.0 {0.050 - EREST_ACT} -1e-6//

end




// ===================     Conductancs in Soma     =====================


//========================================================================
// soma:               Tabchannel Na cat cell channel  (from Traub (1977))
//========================================================================
function make_Na
        if ({exists Na})
                return
        end
        
        create  tabchannel      Na
                setfield        ^       \
                Ek              {ENA}   \               //  V
                Gbar            {sm_GNa * SOMA_A }   \  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  3       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0


        setupalpha Na X \
		{1e6*(7e-3 + 0.4*EREST_ACT - 0.4 * m_shift)}\ 	//alpha_A
                -0.4e6 	\					//alpha_B
		-1.0	\ 					//alpha_C
		{-17.5e-3 - EREST_ACT +  m_shift }\ 		//alpha_D
		-0.005  \					//alpha_F
               	{1e6 *(-18e-3 - 0.4*EREST_ACT + 0.4*m_shift) }\ //Beta_A
                 0.4e6 	\					//Beta_B
		-1.0 	\					//Beta_C
		{-0.045 - EREST_ACT + m_shift } 	\	//Beta_D
		0.005						//Beta_F

        setupalpha Na Y 280.0	\ 				//alpha_A
			0.0 	\				//alpha_B
			0.0	\				//alpha_C
                	{-0.025 - EREST_ACT + h_shift}\ 	//alpha_D
			0.020 	\				//alpha_F
                	4.0e3	\				//Beta_A
			0.0	\				//Beta_B
			1.0	\				//Beta_C
			{-0.040 - EREST_ACT + h_shift }\ 	//Beta_D
			-1.0e-2					//Beta_F

end


//========================================================================
// soma:         Tabchannel K(DR) Cat cell channel (from Traub 1977)
//========================================================================


function make_K_DR
        if ({exists K_DR})
                return
        end
                
        create  tabchannel      K_DR
                setfield        ^       \
                Ek              {EK}    \      //      V
                Gbar            {sm_GK_DR*SOMA_A} \ // (org=350) S
                Ik              0       \      //      A
                Gk              0       \      //      S
                Xpower  4       \
                Ypower  0       \
                Zpower  0

        setupalpha K_DR X \
		{1e6*(0.4e-3 + 0.02*EREST_ACT - 0.02*n_shift)}\ // alpha_A
		-0.02e6 	\				// alpha_B
		-1.0 		\				// alpha_C
		{-0.020 - EREST_ACT + n_shift }\		// alpha_D
		-1.0e-2 	\				// alpha_F
                250 		\				// Beta_A
		0.0 		\				// Beta_B
		0.0 		\				// Beta_C
		{-0.01 - EREST_ACT + n_shift }	\		// Beta_D
		0.080						// Beta_F

end



 
//  ******************************************************************


//========================================================================
// Soma: Tabchannel K(AHP) Cat cell channel from Traub (1977) i.e. Iks
//========================================================================
        
   
function make_AHP
        if ({exists K_AHP})
                return
        end

        create  tabchannel      K_AHP
                setfield        ^       \
                Ek              {EK}    \                  // V
                Gbar            { sm_GK_AHP * SOMA_A } \   // S 
                Ik              0       \                  // A
                Gk              0       \                  // S
                Xpower  2       \
                Ypower  0       \
                Zpower  0
                
        setupalpha K_AHP X      {3.5*1e3}               \    // alpha_A
                                0.0                     \    // alpha_B
                                1.0                     \    // alpha_C
                                {-1.0*(0.055 + EREST_ACT)} \ // alpha_D
                                -0.004                  \    // alpha_F
                                {0.02*1e3}             \    // Beta_A !!!
                                0.0                     \    // Beta_B
                                0.0                     \    // Beta_C
                                { 0.0 - EREST_ACT}      \    // Beta_D
                                1e20                         // Beta_F
                
//Jones' dara for bata: 0.015e3 0.0 -1.0 {0.050 - EREST_ACT} -1e-6//
// which doesn't work//                

end
 
// ********************************************************************** 



//========================================================================
// soma:        Tabchannel K(A) current cat cell channel from KE Jones
//========================================================================
function make_K_A
        if ({exists K_A})
                return
        end

        create  tabchannel      K_A
                setfield        ^       \
                Ek              {EK}   \               //  V
                Gbar            { sm_GK_A * SOMA_A }    \  //  S 
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  4       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0
           
        setupalpha K_A X \
                {-1e6*(2.048e-3 +0.032 * Am_shift)}\ //alpha_A
                -0.032e6  \                                     //alpha_B
                -1.0    \                                       //alpha_C
                {64e-3 +  Am_shift }\  		                //alpha_D
                -0.006  \                                       //alpha_F
                 0.203e3 \ 					//Beta_A
                 0  	\                                       //Beta_B
                 0      \                                       //Beta_C
                {0.040 +Am_shift }\				//Beta_D
                0.024                                           //Beta_F
                
        setupalpha K_A Y 50.0   \                               //alpha_A
                        0.0     \                               //alpha_B
                        1.0     \                               //alpha_C
                        {86e-3  + Ah_shift}\		        //alpha_D
                        0.010   \                               //alpha_F
                        50.0   \                                //Beta_A
                        0.0     \                               //Beta_B  
                        1.0     \                               //Beta_C 
                        {86e-3 + Ah_shift }\			//Beta_D 
                        -0.010                                  //Beta_F 
end
                
                
//========================================================================
// soma:        Tabchannel I_h current   
//========================================================================

function make_H
        if ({exists H})
                return
        end
                
        create  tabchannel      H
                setfield        ^       \
                Ek              {Eh}   \               //  V
                Gbar            { sm_Gh * SOMA_A }  \  //  S
                Ik              0       \              //  A
                Gk              0       \              //  S
                Xpower  1       \ // X=m
                Ypower  0       \ // Y=h
                Zpower  0
                
        setupalpha H X \
                60                                      \       //alpha_A
                0       \                                       //alpha_B
                1.0     \                                       //alpha_C
                { 0.075 +  Hm_shift }\                          //alpha_D
                0.005  \                                       //alpha_F
                60                                      \       //Beta_A   
                0       \                                       //Beta_B
                1.0     \                                       //Beta_C
                { 0.075 +  Hm_shift }   \                       //Beta_D
                -0.005                                           //Beta_F  
end


// ==========  Ca & K(AHP) channels in Soma ==============================
// ======================= T-type Ca++ channel ===========================
// From  J. Tegner et al., (1997) J. Neurophysiol. 77: 1795 - 1812


function make_Ca_T
        if ({exists Ca_T})
                return
        end
   
        create  tabchannel      Ca_T
                setfield        ^       \
                Ek              {ECA}   \               //  V
                Gbar            { sm_GCa_T * SOMA_A }\  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  3       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0

        setupalpha Ca_T X \
                {-1160 - 20000*mT_shift}\ 		//alpha_A
                -20000.0  \                             //alpha_B
                -1.0    \                               //alpha_C
                {0.058 + mT_shift }\  		        //alpha_D
                -0.0045  \                              //alpha_F
                {3050 + 50000*mT_shift}\ 		//Beta_A
                 50000.0  \                             //Beta_B
                -1.0    \                               //Beta_C
                {0.061 + mT_shift } \     		//Beta_D
                0.0045                                  //Beta_F

        setupalpha Ca_T Y \
		{6.3 + 100*hT_shift}\   		//alpha_A
                100.0	\                               //alpha_B
               -1.0	\                               //alpha_C
                {0.063 + hT_shift}\		        //alpha_D
                0.0078	\                               //alpha_F
                30.0	\                               //Beta_A
                0.0	\                               //Beta_B
                1.0	\                               //Beta_C
                {0.061 + hT_shift }\    		//Beta_D
               -0.0048                                  //Beta_F
end
                

// =========== Ca channels (N and L type) & Ca-dependent K(AHP) ===========



//========================================================================
// soma:           Ca_N channel: N type chennal from V. Booth 1997
//========================================================================

function make_Ca_N

        if ({exists Ca_N})
                return
        end
        
        create  tabchannel      Ca_N
                setfield        ^       \
                Ek              {ECA}   \               //  V
                Gbar            { sm_GCa_N * SOMA_A }    \  //  S 
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  2       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0

        setupalpha Ca_N X \
		250	\				 	//alpha_A
                0.0 	\					//alpha_B
		1.0	\ 					//alpha_C
		{ 0.030 +  mN_shift }\ 				//alpha_D
		-0.005  \					//alpha_F
               	250	\				 	//Beta_A
                0.0 	\					//Beta_B
		1.0 	\					//Beta_C
		{ 0.030 +  mN_shift } 	\			//Beta_D
		0.005						//Beta_F

        setupalpha Ca_N Y \
			25	\ 				//alpha_A
			0.0 	\				//alpha_B
			1.0	\				//alpha_C
                	{ 0.045 + hN_shift }\ 			//alpha_D
			0.005 	\				//alpha_F
                	25	\				//Beta_A
			0.0	\				//Beta_B
			1.0	\				//Beta_C
			{ 0.045 + hN_shift }\ 			//Beta_D
			-0.005					//Beta_F
end




//========================================================================
//  soma:            Ca_L channel: L type chennal from V. Booth 1997
//========================================================================
function make_Ca_L
        if ({exists Ca_L})
                return
        end

        create  tabchannel      Ca_L
                setfield        ^       \
                Ek              {ECA}   \               //  V
                Gbar            { sm_GCa_L * SOMA_A }\  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  1       \ // X=m
                Ypower  0       \ // Y=h
                Zpower  0

                        
        setupalpha Ca_L X \
                25                                      \       //alpha_A
                0       \                                       //alpha_B
                1.0     \                                       //alpha_C
                { 0.040 +  mL_shift }\                          //alpha_D
                -0.007  \                                       //alpha_F
                25                                      \       //Beta_A  
                0       \                                       //Beta_B
                1.0     \                                       //Beta_C  
                { 0.040 +  mL_shift }   \                       //Beta_D
                0.007                                           //Beta_F
end



//========================================================================
//  soma:                    Ca conc
//========================================================================

function make_Ca_conc
        if ({exists Ca_conc})
                return
        end
        create Ca_concen Ca_conc
        setfield Ca_conc \
                tau     0.01333   \
                B       17.402e12 \
                Ca_base 0
        addfield Ca_conc addmsg1
        setfield Ca_conc \
                addmsg1        "../Ca_N . I_Ca Ik"

end



//========================================================================
//  soma:           Tabulated Ca-dependent K AHP Channel
//========================================================================
        
function make_K_AHP
        if ({exists K_AHP})
                return
        end
                
        create  tabchannel      K_AHP
                setfield        ^       \
                Ek              {EK}   \               //      V
                Gbar            { sm_GK_AHP * SOMA_A }    \//     S
                Ik              0       \              //      A
                Gk              0       \              //      S
                Xpower  0       \
                Ypower  0       \
                Zpower  1
        float   xmin = 0.0
        float   xmax = 1000.0 

        int     xdivs = 50
                
        call K_AHP TABCREATE Z {xdivs} {xmin} {xmax}
        int i
        float x,dx,y
        dx = (xmax - xmin)/xdivs
        x = xmin
        for (i = 0 ; i <= {xdivs} ; i = i + 1)

		y = x

        setfield K_AHP Z_A->table[{i}] {y}
        setfield K_AHP Z_B->table[{i}] {y + Kd}
        x = x + dx
        end
        addfield K_AHP addmsg1
        setfield K_AHP \
                addmsg1        "../Ca_conc . CONCEN Ca"
end


//*************************************************************************


// ===================     Conductancs in Dendrite     =====================


//========================================================================
// dendrite:           Tabchannel Na cat cell channel  (from Traub (1977))
//========================================================================
function make_D_Na
        if ({exists D_Na})
                return
        end
        
        create  tabchannel      D_Na
                setfield        ^       \
                Ek              {ENA}   \               //  V
                Gbar            { pd_GNa * dend_A }  \  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  3       \ //
                Ypower  1       \ //
                Zpower  0


        setupalpha D_Na X \
		{1e6*(7e-3 + 0.4*EREST_ACT - 0.4 * D_m_shift)}\ //alpha_A
                -0.4e6 	\					//alpha_B
		-1.0	\ 					//alpha_C
		{-17.5e-3 - EREST_ACT +  D_m_shift }\ 		//alpha_D
		-0.005  \					//alpha_F
               	{1e6 *(-18e-3 - 0.4*EREST_ACT + 0.4*D_m_shift) }\ //Beta_A
                 0.4e6 	\					//Beta_B
		-1.0 	\					//Beta_C
		{-0.045 - EREST_ACT + D_m_shift } 	\	//Beta_D
		0.005						//Beta_F

        setupalpha D_Na Y 280.0	\ 				//alpha_A
			0.0 	\				//alpha_B
			0.0	\				//alpha_C
                	{-0.025 - EREST_ACT + D_h_shift}\ 	//alpha_D
			0.020 	\				//alpha_F
                	4.0e3	\				//Beta_A
			0.0	\				//Beta_B
			1.0	\				//Beta_C
			{-0.040 - EREST_ACT + D_h_shift }\ 	//Beta_D
			-1.0e-2					//Beta_F

end


//========================================================================
// dendrite:         Tabchannel K(DR) Cat cell channel (from Traub 1977)
//========================================================================


function make_D_K_DR
        if ({exists D_K_DR})
                return
        end
                
        create  tabchannel      D_K_DR
                setfield        ^       \
                Ek              {EK}    \      //      V
                Gbar            {pd_GK_DR*dend_A} \ //     S
                Ik              0       \      //      A
                Gk              0       \      //      S
                Xpower  4       \
                Ypower  0       \
                Zpower  0

        setupalpha D_K_DR X \
		{1e6*(0.4e-3 + 0.02*EREST_ACT - 0.02*D_n_shift)}\ // alpha_A
		-0.02e6 	\				// alpha_B
		-1.0 		\				// alpha_C
		{-0.020 - EREST_ACT + D_n_shift }\		// alpha_D
		-1.0e-2 	\				// alpha_F
                250 		\				// Beta_A
		0.0 		\				// Beta_B
		0.0 		\				// Beta_C
		{-0.01 - EREST_ACT + D_n_shift }	\	// Beta_D
		0.080						// Beta_F

end



//========================================================================
// dendrite:        Tabchannel K(A) current cat cell channel from KE Jones
//========================================================================
function make_D_K_A
        if ({exists D_K_A})
                return
        end

        create  tabchannel      D_K_A
                setfield        ^       \
                Ek              {EK}   \               //  V
                Gbar            { pd_GK_A * dend_A }    \  //  S 
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  4       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0
           
        setupalpha D_K_A X \
                {-1e6*(2.048e-3 +0.032 * D_Am_shift)}\ //alpha_A
                -0.032e6  \                            //alpha_B
                -1.0    \                                       //alpha_C
                {64e-3 +  D_Am_shift }\  		        //alpha_D
                -0.006  \                                       //alpha_F
                 0.203e3 \ 					//Beta_A
                 0  	\                                       //Beta_B
                 0      \                                       //Beta_C
                {0.040 +D_Am_shift }\				//Beta_D
                0.024                                           //Beta_F
                
        setupalpha D_K_A Y 50.0   \                             //alpha_A
                        0.0     \                               //alpha_B
                        1.0     \                               //alpha_C
                        {86e-3  + D_Ah_shift}\		        //alpha_D
                        0.010   \                               //alpha_F
                        50.0   \                                //Beta_A
                        0.0     \                               //Beta_B  
                        1.0     \                               //Beta_C 
                        {86e-3 + D_Ah_shift }\			//Beta_D 
                        -0.010                                  //Beta_F 
end
                
                
//========================================================================
// dendrite:        Tabchannel I_h current   
//========================================================================

function make_D_H
        if ({exists D_H})
                return
        end
                
        create  tabchannel      D_H
                setfield        ^       \
                Ek              {Eh}   \               //  V
                Gbar            { pd_Gh * dend_A }    \  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  1       \ // X=m
                Ypower  0       \ // Y=h
                Zpower  0
                
        setupalpha D_H X \
                60                                      \       //alpha_A
                0       \                                       //alpha_B
                1.0     \                                       //alpha_C
                { 0.075 +  D_Hm_shift }\                          //alpha_D
                0.005  \                                       //alpha_F
                60                                      \       //Beta_A   
                0       \                                       //Beta_B
                1.0     \                                       //Beta_C
                { 0.075 +  D_Hm_shift }   \                       //Beta_D
                -0.005                                           //Beta_F  
end

// ======================= T-type Ca++ channel ===========================
// From  J. Tegner et al., (1997) J. Neurophysiol. 77: 1795 - 1812

function make_D_Ca_T
        if ({exists D_Ca_T})
                return
        end
   
        create  tabchannel      D_Ca_T
                setfield        ^       \
                Ek              {ECA}   \               //  V
                Gbar            { pd_GCa_T * dend_A }\  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  3       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0

        setupalpha D_Ca_T X \
                {-1160 - 20000*D_mT_shift}\             //alpha_A
                -20000.0  \                             //alpha_B
                -1.0    \                               //alpha_C
                {0.058 + D_mT_shift }\                  //alpha_D
                -0.0045  \                              //alpha_F
                {3050 + 50000*D_mT_shift}\              //Beta_A
                 50000.0  \                             //Beta_B
                -1.0    \                               //Beta_C
                {0.061 + D_mT_shift } \                 //Beta_D
                0.0045                                  //Beta_F
           
        setupalpha D_Ca_T Y \
                {6.3 + 100*D_hT_shift}\                 //alpha_A
                100.0   \                               //alpha_B
               -1.0     \                               //alpha_C
                {0.063 + D_hT_shift}\                   //alpha_D
                0.0078  \                               //alpha_F
                30.0    \                               //Beta_A
                0.0     \                               //Beta_B
                1.0     \                               //Beta_C
                {0.061 + D_hT_shift }\                  //Beta_D
               -0.0048                                  //Beta_F
end
                


// =================  Ca & AHP channels  in  Dendrite compartment =========

// =========== Ca channels (N and L type) & Ca-dependent K(AHP) ===========
                        
                        
                        
//========================================================================
// dendrite:           Ca_N channel: N type chennal from V. Booth 1997
//========================================================================
function make_D_Ca_N
        if ({exists D_Ca_N})
                return
        end

        create  tabchannel      D_Ca_N
                setfield        ^       \
                Ek              {ECA}   \               //  V
                Gbar            { pd_GCa_N * dend_A }    \  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  2       \ // X=m
                Ypower  1       \ // Y=h
                Zpower  0
                
        
        setupalpha D_Ca_N X \
                250     \                                       //alpha_A
                0.0     \                                       //alpha_B
                1.0     \                                       //alpha_C
                { 0.030 +  D_mN_shift }\                          //alpha_D
                -0.005  \                                       //alpha_F
                250     \                                       //Beta_A
                0.0     \                                       //Beta_B
                1.0     \                                       //Beta_C  
                { 0.030 +  D_mN_shift }   \                       //Beta_D
                0.005                                           //Beta_F  

        setupalpha D_Ca_N Y \
                        25      \                               //alpha_A
                        0.0     \                               //alpha_B
                        1.0     \                               //alpha_C
                        { 0.045 + D_hN_shift }\                   //alpha_D
                        0.005   \                               //alpha_F
                        25      \                               //Beta_A
                        0.0     \                               //Beta_B
                        1.0     \                               //Beta_C
                        { 0.045 + D_hN_shift }\                   //Beta_D
                        -0.005                                  //Beta_F
end





//========================================================================
// dendrite:           Ca_L channel: L type chennal from V. Booth 1997
//========================================================================
function make_D_Ca_L
        if ({exists D_Ca_L})
                return
        end
                
        create  tabchannel      D_Ca_L
                setfield        ^       \
                Ek              {ECA}   \               //  V
                Gbar            { pd_GCa_L * dend_A }    \  //  S
                Ik              0       \               //  A
                Gk              0       \               //  S
                Xpower  1       \ // X=m
                Ypower  0       \ // Y=h
                Zpower  0
                
        setupalpha D_Ca_L X \
                25                                      \       //alpha_A 
                0       \                                       //alpha_B
                1.0     \                                       //alpha_C 
                { 0.040 +  D_mL_shift }\                          //alpha_D
                -0.007  \                                       //alpha_F
                25                                      \       //Beta_A
                0       \                                       //Beta_B
                1.0     \                                       //Beta_C
                { 0.040 +  D_mL_shift }   \                       //Beta_D
                0.007                                           //Beta_F
end
        

//========================================================================
// dendrite"                     Ca conc
//========================================================================

function make_D_Ca_conc
        if ({exists D_Ca_conc})
                return
        end
        create Ca_concen D_Ca_conc
        setfield D_Ca_conc \
                tau     0.01333   \      // sec
                B       17.402e12 \      // Curr to conc for soma   
                Ca_base 0		// org =0.0

        addfield D_Ca_conc addmsg1
        setfield D_Ca_conc \
                addmsg1        "../D_Ca_N . I_Ca Ik"
end


//========================================================================
//  dendrite:           Tabulated Ca-dependent K AHP Channel
//========================================================================

function make_D_K_AHP
        if ({exists D_K_AHP})
		return
        end
        
        create  tabchannel      D_K_AHP
                setfield        ^       \
                Ek              {EK}   \               //      V
                Gbar            { pd_GK_AHP * dend_A }\ //      S
                Ik              0       \              //      A
                Gk              0       \              //      S
                Xpower  0       \
                Ypower  0       \
                Zpower  1
        float   xmin = 0.0
        float   xmax = 1000.0
        
        int     xdivs = 50
           
        call D_K_AHP TABCREATE Z {xdivs} {xmin} {xmax}
        int i
        float x,dx,y
        dx = (xmax - xmin)/xdivs
        x = xmin
        for (i = 0 ; i <= {xdivs} ; i = i + 1)
        
        y = 0.1*x
        setfield D_K_AHP Z_A->table[{i}] {y}
        setfield D_K_AHP Z_B->table[{i}] {y + Kd}
        x = x + dx
        end
        setfield D_K_AHP Z_A->calc_mode 0   Z_B->calc_mode 0
        call D_K_AHP TABFILL Z 3000 0
        addfield D_K_AHP addmsg1
        setfield D_K_AHP \
                addmsg1        "../D_Ca_conc . CONCEN Ca"
end
           
//=================================  leakage channel =====================
        
function make_K_leak (path, gleak)

        str path
//	float gleak

        if ({exists /{path}/K_leak})
                return
        end
             
        create  leakage     {path}/K_leak
                setfield        ^ \
                Ek             {EK}    \       //  V
                Gk             {gleak}\       //  S
                activation     {gleak}        //  S
end
             
