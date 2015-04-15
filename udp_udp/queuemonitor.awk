BEGIN {
time=0;
}
#body
{
    total = $6
	sent = $7
	dropped = $8
	time = $1
	print time,(total-sent-dropped)

} #body
END {
;
}
#============================= Ends ============================

