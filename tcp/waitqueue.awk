BEGIN {
time=0;
}
#body
{
    total = $9
	sent = $10
	dropped = $11
	time = $1
	print time,((total-sent-dropped)/(0.3*131072))

} #body
END {
;
}
#============================= Ends ============================

