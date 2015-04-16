BEGIN {
time=0;
}
#body
{
    total = $6
	sent = $7
	dropped = $8
	time = $1
	print var,time,(total-sent-dropped)

} #body
END {
;
}
#============================= Ends ============================

