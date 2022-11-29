
#!/bin/sh
for i in {0..63}
do
  grep -inr "system.ruby.l2_cntrl0.L2cache.totalGroupWriteBacks::$i " black_HotReRAM_Periodic.txt | awk '{print $2}' > print$i.txt
done

paste print0.txt print1.txt > black_WBCount2.txt
rm print0.txt
rm print1.txt

for k in {2..63}
do
  sum=$(($k + 1))
  paste black_WBCount$k.txt print$k.txt > black_WBCount$sum.txt
  rm black_WBCount$k.txt
  rm print$k.txt
done


for i in {0..63}
do
  grep -inr "system.ruby.l2_cntrl0.L2cache.totalGroupreadSet::$i " black_HotReRAM_Periodic.txt | awk '{print $2}' > print$i.txt
done

paste print0.txt print1.txt > black_RDCount2.txt
rm print0.txt
rm print1.txt

for k in {2..63}
do
  sum=$(($k + 1))
  paste black_RDCount$k.txt print$k.txt > black_RDCount$sum.txt
  rm black_RDCount$k.txt
  rm print$k.txt
done


for i in {0..63}
do
  grep -inr "system.ruby.l2_cntrl0.L2cache.totalGroupwriteAllocate::$i " black_HotReRAM_Periodic.txt | awk '{print $2}' > print$i.txt
done

paste print0.txt print1.txt > black_WRCount2.txt
rm print0.txt
rm print1.txt

for k in {2..63}
do
  sum=$(($k + 1))
  paste black_WRCount$k.txt print$k.txt > black_WRCount$sum.txt
  rm black_WRCount$k.txt
  rm print$k.txt
done


