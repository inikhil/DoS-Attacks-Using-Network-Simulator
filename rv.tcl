set count 3

for {set i 0} {$i<3} {incr i} {

	puts "i = $i"
	
	set MyRng1 [new RNG]
	$MyRng1 seed $i

	set MyRng2 [new RNG]
	$MyRng2 seed $i	
	
	set r1 [new RandomVariable/Pareto]
	$r1 use-rng $MyRng1
	$r1 set avg_ 10
	$r1 set shape_ 1.2
	puts stdout "Testing Pareto Distribution, avg = [$r1 set avg_] shape= [$r1 set shape_]"
	$r1 test $count

	set r2 [new RandomVariable/Pareto]
	$r2 use-rng $MyRng2
	$r2 set avg_ 10
	$r2 set shape_ 1.2
	puts stdout "Testing Pareto Distribution, avg = [$r2 set avg_] shape= [$r2 set shape_]"
	$r2 test $count

	set MyRng3 [new RNG]
	$MyRng3 seed 0

	set r3 [new RandomVariable/Uniform]
	$r3 use-rng $MyRng3
	$r3 set min_ 0
	$r3 set max_ 3
	puts stdout "Testing Uniform Random Variable"
	$r3 test 5 

	proc Random_Generator {} {
		set MyRng4 [new RNG]
		$MyRng4 seed 0
		set r4 [new RandomVariable/Uniform]
		$r4 use-rng $MyRng4
		$r4 set min_ 0
		$r4 set max_ 3
		puts stdout "Testing Uniform Random Variable inside function"
		puts "[$r4 value]"
		global r5
	 	set r5 [$r4 value]
		puts " $r5 "
		return r5
	}
	Random_Generator
	puts "$r5"

}

