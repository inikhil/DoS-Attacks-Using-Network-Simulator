# Create a simulator object
set ns [new Simulator]

# Define different colors for data flows (for NAM)
$ns color 1 Blue
$ns color 2 Red

# open the trace file
set filename [lindex $argv 0]
set tracefile1 [open $filename w]
$ns trace-all $tracefile1

# Open the NAM trace file
set namfile [open out.nam w]
set windowVsTime2 [open windowvstime.dat w]
$ns namtrace-all $namfile

# Define a 'finish' procedure
proc finish {} {
	global ns tracefile1 namfile
	$ns flush-trace
	close $tracefile1
	close $namfile
	#exec nam out.nam &
	exit 0
}

set lamda 50.0
set mu   20.0

set MyRng [new RNG]
$MyRng seed 0
set iat_udp [new RandomVariable/Exponential]
$iat_udp set avg_ [expr 1.0/$lamda]
$iat_udp use-rng $MyRng


set MyRng1 [new RNG]
$MyRng1 seed 0
set iat_tcp [new RandomVariable/Exponential]
$iat_tcp use-rng $MyRng1 
$iat_tcp set avg_ [expr 1.0/$lamda]

set MyRng2 [new RNG]
$MyRng2 seed 0
set pktsize [new RandomVariable/Exponential]
$pktsize use-rng $MyRng2
$pktsize set avg_ [expr 10000.0/($mu)]

set MyRng3 [new RNG]
$MyRng3 seed 0
set prob [new RandomVariable/Uniform]
$prob use-rng $MyRng3

# Create 6 nodes
set n0 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

# Create links between nodes
set band [lindex $argv 2]
$ns duplex-link $n0 $n2 0.5Mb 100ms DropTail
$ns duplex-link $n2 $n3 $band 100ms DropTail
$ns duplex-link $n3 $n4 0.2Mb 100ms DropTail
$ns duplex-link $n3 $n5 0.2Mb 100ms DropTail


# Setting node positions
$ns duplex-link-op $n0 $n2 orient right
$ns duplex-link-op $n2 $n3 orient right
$ns duplex-link-op $n3 $n4 orient right-up
$ns duplex-link-op $n3 $n5 orient right-down


# Set Queue positions
$ns simplex-link-op $n2 $n3 queuePos 0.5
$ns duplex-link-op $n0 $n2 queuePos 0.5
# Set Queue Sizes
$ns queue-limit $n0 $n2 10
$ns queue-limit $n2 $n3 10
$ns queue-limit $n3 $n4 5

# Labelling

$ns at 0.0 "$n2 label server"
$ns at 0.0 "$n3 label router"
$ns at 0.0 "$n0 label client"
$ns at 0.0 "$n4 label client"
$ns at 0.0 "$n5 label client"

# Shape

$n2 shape hexagon
$n3 shape square

# Monitoring queue

set filenam [lindex $argv 1]
set qmon [$ns monitor-queue $n2 $n3 [open $filenam w] 1.0];
[$ns link $n2 $n3] queue-sample-timeout; 



# Defining a Random Uniform Generator
proc Random_Generator_Uniform {} {
	set MyRng4 [new RNG]
	$MyRng4 seed 0
	set r4 [new RandomVariable/Uniform]
	$r4 use-rng $MyRng4
	$r4 set min_ 0
	$r4 set max_ 4
	puts stdout "Testing Uniform Random Variable inside function"
	global x
	set x [$r4 value]
	return x
}

proc Random_Generator_Exponential {} {
	set MyRng5 [new RNG]
	$MyRng5 seed 0
	set r5 [new RandomVariable/Exponential]
	$r5 use-rng $MyRng5
	$r5 set avg_ 100
	puts stdout "Testing Exponantial Random Variable inside function"
	global y
	set y [$r5 value]
	return y
}

# Setup a TCP connection
set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink
$ns connect $tcp $sink
$tcp set fid_ 1
#$tcp set packetsize_ 552

set tcp2 [new Agent/TCP]
$ns attach-agent $n0 $tcp2
set sink2 [new Agent/TCPSink]
$ns attach-agent $n5 $sink2
$ns connect $tcp2 $sink2
$tcp2 set fid_ 1

proc sendpacket_udp {} {
	global ns tcp iat_udp pktsize prob tcp2
	set time [$ns now]
	$ns at [ expr $time + [$iat_udp value]] "sendpacket_udp"
	set bytes [expr round ([$pktsize value])]
	if [expr [$prob value] < 0.5] {
		$tcp send $bytes
	} else {
		$tcp2 send $bytes
	} 
}

proc sendpacket_tcp {tm} {
	global ns tcp1 iat_tcp tcp3 prob sendtime
	set time [$ns now]
	set sendtime [ expr $time + [$iat_tcp value]]
	if { $tm > $sendtime } {
		$ns at $sendtime "sendpacket_tcp $tm"
		set bytes 512
		if [expr [$prob value] < 0.5] {
			$tcp1 send $bytes
		} else {
			$tcp3 send $bytes
		}
	}	 
}

proc plotWindow {tcpSource file} {
	global ns
	set time 0.01
	set now [$ns now]
	set cwnd [$tcpSource set cwnd_]
	puts $file "$now $cwnd"
	$ns at [expr $now+$time] "plotWindow $tcpSource $file"
}    



$ns at 0.0001 "sendpacket_udp"
$ns at 0.0001 "plotWindow $tcp $windowVsTime2"

#Call the finish procedure after 5 seconds of simulation time
$ns at 100.0 "finish"



#Run the simulation
$ns run



