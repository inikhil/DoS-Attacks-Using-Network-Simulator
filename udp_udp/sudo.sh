rm output.dat
rm output.txt

awk -f drop.awk out.tr > output.dat
awk -f drop.awk out.tr > output.txt

gnuplot << EOF
	set term png
	set output "abc.png"
	set xlabel "Time"
	set ylabel "Probability"
	set title "Probability of packet being dropped"
	set xrange [0:100]
	set yrange [0:0.25]
	plot "output.txt" lt 3 lc 3 
EOF

gnuplot << EOF
	set term png
	set output "bcd.png"
	plot "output.dat"
EOF


exec xgraph output.txt -t "Number of attack packets" -x "time" -y "Attack" > attack.ps 
