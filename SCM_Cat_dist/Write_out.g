// =========================  Write-out ===================================


// 	This program was developed by
// 	Yue Dai
// 	Dept of Physiology
// 	University of Manitoba
// 	Winnipeg, Manitoba
// 	Canada R3E 3J7
//
//	Upgraded on Feb. 16, 2001



// Write out file in ASC format to disk which can be read by xgraph
        
function ASC_out (filename, source_path, data)
        
   str filename, source_path, data

   create asc_file /output/{filename}
   setfield /output/{filename} flush 1 leave_open 1
   addmsg {source_path} /output/{filename} SAVE {data}
   
 setclock 1 {dt} // set a clock numbered to 1, org time step is 0.00005
 useclock /output/{filename} 1 // using clock 1 for ASC_out

end

