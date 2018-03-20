read x
s=0
for i in $(seq 1 1 $x)
do
read a
s=$(bc -l <<< $s+$a)
done
printf "%.3f" $(echo "$(bc -l <<< "scale=4;$s/$x")")  
