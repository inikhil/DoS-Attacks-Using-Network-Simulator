BEGIN {
recv=0;
gotime = 1;
time = 0;
time_interval=1;
}
#body
{
    event = $1
    time = $2
    node_id = $4
    pktsize = $6
    pktType = $5
	if(time > gotime)
	{
		print var, gotime, recv; 
 		gotime+= time_interval;
  		recv=0;
  	}
	if (( event == "d") && ( pktType == "udp" ) && (node_id == 3))
	{
 		recv++;
	}

} #body
END {
;
}
#============================= Ends ============================

