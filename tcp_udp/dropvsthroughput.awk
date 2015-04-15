BEGIN {
recv=0;
dropped = 0;
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
		print dropped, (pktsize * recv * 8.0)/1000; #packet size * ... gives results in kbps
 		gotime+= time_interval;
  		recv=0;
		dropped=0;
  	}
	if (( event == "r") && (( pktType == "tcp" )||(pktType == "udp")) && (node_id == 3))
	{
 		recv++;
	}
	if (( event == "d") && (( pktType == "tcp" )||(pktType == "udp")) && (node_id == 3))
	{
 		dropped++;
	}

} #body
END {
;
}
#============================= Ends ============================

