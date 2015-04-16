
rm *.tr *.out throughput.* prdrop.* pacdrop.* queuelen.* waittime.*


for i in `seq 1 100`;
    do
		j=$(($i * 5))
		k="$i kb"
        ns attack3.tcl "$i.tr" "$i.out" $k
		awk -v var=$j -f systhroughput.awk $i.tr > throughput.$i
		awk -v var=$j -f drop.awk $i.tr > prdrop.$i
		awk -v var=$j -f packetdrop.awk $i.tr > pacdrop.$i
		awk -v var=$j -f queuemonitor.awk $i.out > queuelen.$i
		awk -v var=$j -f waitqueue.awk $i.out > waittime.$i

		cat throughput.$i >> throughput3.dat
		cat prdrop.$i >> prdrop3.dat
		cat pacdrop.$i >> pacdrop3.dat
		cat queuelen.$i >> queuelen3.dat
		cat waittime.$i >> waittime3.dat
		
		#echo $j 
		#ns attack3.tcl "$i.tr" $j
		#awk -f packetdro.awk $i.tr > packetdrop.$i
		#awk -f drop.awk $i.tr > probabilitydrop.$i
		#awk -v var=$j -f abc.awk $i.tr > packetdropserv.$i
		#awk -v var=$j -f drop.awk $i.tr > probabilitydropserv.$i
		#pr -m -t -s\ packetdrop.dat  packetdrop.$i  | gawk '{print $2}' 
		#cat packetdrop.$i >> packetdrop.dat
		#cat probabilitydropserv.$i >> packetdropserv.dat
		#cat probabilitydropserv.$i >> probabilitydropserv.dat
		#awk -v var=$j -f abc.awk > aa.dat
    done 

#awk '{ sum[$1]+=$2; cnt[$1]++ } END { for (i in sum) print i, sum[i]/cnt[i] | "sort -n" }' *.dat > output.dat
#paste *.dat | awk '{ for(i=2;i<=NF;i+=2) array[$1]+=$i; if (i = NF) print $1, array[$1]/NF }' > output1.dat

#awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=FNR;i++)print i,a[i]/b[i];}' throughput.* > throughput.dat
#awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=FNR;i++)print i,a[i]/b[i];}' prdrop.* > prdrop.dat
#awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=FNR;i++)print i,a[i]/b[i];}' pacdrop.* > pacdrop.dat
#awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=FNR;i++)print i,a[i]/b[i];}' queuelen.* > queuelen.dat
#awk '{a[FNR]+=$2;b[FNR]++;}END{for(i=1;i<=100;i++)print i,a[i]/b[i];}' waittime.* > waiting.dat

#pr -m -t -s\  file1 file2 | gawk '{print $4,$5,$6,$1}'

