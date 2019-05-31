// function for making cylind compartment
//
// By Yue Dai
// Department of Physiology
// University of Manitoba
// Winnipeg, MB R3E 3J7
// Canada

function make_cylind_compartment
	float RM = 0.7
	float CM = 0.01
	float RA = 0.2
	float EREST_ACT = -0.060 
	float l = 360.0e-6
	float d = 10.0e-6
	float PI = 3.14159
	float surf_area = l*d*PI

	if (!{exists compartment})
		create	compartment compartment
	end
	setfield compartment \
		Cm		{CM * surf_area} \
		Ra		{4.0*RA*l/(d*d*PI)} \
		Em  		{EREST_ACT} \
		Rm		{RM/surf_area} \
                dia             {d} \
		len		{l} \	
		inject		0.0
end

