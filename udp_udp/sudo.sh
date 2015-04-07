rm output.tr

awk -f cal_udp.awk out.tr > output.dat

gnuplot << EOF
	set term png
	set output "abc.png"
	plot "output.txt"
EOF

gnuplot << EOF
	set term png
	set output "bcd.png"
	plot "output.dat"
EOF


exec xgraph output.txt -t "Number of attack packets" -x "time" -y "Attack" > attack.ps 
