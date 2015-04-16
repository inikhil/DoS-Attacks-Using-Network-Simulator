
gnuplot << EOF
	set term png
	set output "systhroughput.png"
	set xlabel "Time"
	set ylabel "Expected Throughput (kbps)"
	set title "Expected Throughput vs Time"
	#set xrange [0:100]
	#set yrange [0:170]
	set style data linespoints
	plot "throughput.dat" smooth sbezier
EOF

gnuplot << EOF
	set term png
	set output "prdrop.png"
	set xlabel "Time"
	set ylabel "Expected probability of packet being dropped"
	set title "Expected probability vs Time"
	#set xrange [0:100]
	#set yrange [0:170]
	set style data linespoints
	plot "prdrop.dat" smooth sbezier
EOF

gnuplot << EOF
	set term png
	set output "pacdrop.png"
	set xlabel "Time"
	set ylabel "Expected number of packet being dropped"
	set title "Expected packet loss vs Time"
	#set xrange [0:100]
	#set yrange [0:170]
	set style data linespoints
	plot "pacdrop.dat" smooth sbezier
EOF

gnuplot << EOF
	set term png
	set output "queuelen.png"
	set xlabel "Time"
	set ylabel "Expected number of packets in the queue"
	set title "Expected number of packets vs time"
	#set xrange [0:100]
	#set yrange [0:170]
	set style data linespoints
	plot "queuelen.dat" smooth sbezier
EOF

gnuplot << EOF
	set term png
	set output "waiting.png"
	set xlabel "Time"
	set ylabel "Expected waiting time in queue"
	set title "Expected waiting time in queue vs time"
	#set xrange [0:100]
	#set yrange [0:170]
	set style data linespoints
	plot "waiting.dat" smooth sbezier
EOF


gnuplot << EOF
	set term png
	set output "systhroughput1.png"
	set xlabel "Arrival rate"
	set zlabel "Expected Throughput (kbps)" offset -5
	set ylabel "Time"
	set title "Expected Throughput vs Time and Arrival Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "throughput1.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "prdrop1.png"
	set xlabel "Arrival Rate"
	set zlabel "Expected probability of packet being dropped" offset -5
	set ylabel "Time"
	set title "Expected probability of loss vs Time and Arrival Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "prdrop1.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "pacdrop1.png"
	set xlabel "Arrival Rate"
	set ylabel "Time"
	set zlabel "Expected number of packet being dropped" offset -5
	set title "Expected packet loss vs Time and Arrival Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "pacdrop1.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "queuelen1.png"
	set ylabel "Time"
	set zlabel "Expected number of packets in the queue" offset -5
	set title "Expected number of packets in queue vs time and Arrival Rate"
	set xlabel "Arrival Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "queuelen1.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "waiting1.png"
	set xlabel "Arrival Rate"
	set ylabel "Time"
	set zlabel "Expected waiting time in queue" offset -5
	set title "Expected waiting time in queue vs time"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "waittime1.dat" u 1:2:3 with lines
EOF


gnuplot << EOF
	set term png
	set output "systhroughput2.png"
	set xlabel "Service rate"
	set zlabel "Expected Throughput (kbps)" offset -5
	set ylabel "Time"
	set title "Expected Throughput vs Time and Service Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "throughput2.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "prdrop2.png"
	set xlabel "Service Rate"
	set zlabel "Expected probability of packet being dropped" offset -5
	set ylabel "Time"
	set title "Expected probability of loss vs Time and Service Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "prdrop2.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "pacdrop2.png"
	set xlabel "Service Rate"
	set ylabel "Time"
	set zlabel "Expected number of packet being dropped" offset -5
	set title "Expected packet loss vs Time and Service Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "pacdrop2.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "queuelen2.png"
	set ylabel "Time"
	set zlabel "Expected number of packets in the queue" offset -5
	set title "Expected number of packets in queue vs time and Service Rate"
	set xlabel "Service Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "queuelen2.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "waiting2.png"
	set xlabel "Service Rate"
	set ylabel "Time"
	set zlabel "Expected waiting time in queue" offset -5
	set title "Expected waiting time in queue vs time and Service Rate"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "waittime2.dat" u 1:2:3 with lines
EOF


gnuplot << EOF
	set term png
	set output "systhroughput3.png"
	set xlabel "Bandwidth (in kb)"
	set zlabel "Expected Throughput (kbps)" offset -5
	set ylabel "Time"
	set title "Expected Throughput vs Time and Bandwidth"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "throughput3.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "prdrop3.png"
	set xlabel "Bandwidth (in kb)"
	set zlabel "Expected probability of packet being dropped" offset -5
	set ylabel "Time"
	set title "Expected probability of loss vs Time and Bandwidth"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "prdrop3.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "pacdrop3.png"
	set xlabel "Bandwidth (in kb)"
	set ylabel "Time"
	set zlabel "Expected number of packet being dropped" offset -5
	set title "Expected packet loss vs Time and Bandwidth"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "pacdrop3.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "queuelen3.png"
	set ylabel "Time"
	set zlabel "Expected number of packets in the queue" offset -5
	set title "Expected number of packets in queue vs time and Bandwidth"
	set xlabel "Bandwidth (in kb)"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "queuelen3.dat" u 1:2:3 with lines
EOF

gnuplot << EOF
	set term png
	set output "waiting3.png"
	set xlabel "Bandwidth (in kb)"
	set ylabel "Time"
	set zlabel "Expected waiting time in queue" offset -5
	set title "Expected waiting time in queue vs time and Bandwidth"
	#set xrange [0:100]
	#set yrange [0:170]
	set dgrid3d 60,60
	set hidden3d
	splot "waittime3.dat" u 1:2:3 with lines
EOF








