#!/bin/bash


fhome=/usr/share/covenant_bot/
fPID=$fhome"trbot_pid.txt"
ftb=$fhome
cuf=$fhome
home_trbot=$fhome
lev_log="1"
starten=1


function Init2() 
{
[ "$lev_log" == "1" ] && logger "Start Init"
chat_id1=$(sed -n 2"p" $ftb"settings.conf" | tr -d '\r')
echo $chat_id1 | tr " " "\n" > $ftb"chats.txt"
chat_id1=$(sed -n 1"p" $ftb"chats.txt" | tr -d '\r')

timeout_covenant=$(sed -n 3"p" $ftb"settings.conf" | sed 's/\://g' | tr -d '\r')
echo $regim > $ftb"amode.txt"
sec4=$(sed -n 4"p" $ftb"settings.conf" | tr -d '\r')
sec4=$((sec4/1000))
sec=$(sed -n 6"p" $ftb"settings.conf" | tr -d '\r')
bui=$(sed -n 7"p" $ftb"settings.conf" | tr -d '\r')
last_id=0
day_of_cleaning_month=$(sed -n 8"p" $ftb"settings.conf" | sed 's/^0*//' | tr -d '\r')
vs=$(sed -n 9"p" $ftb"settings.conf" | tr -d '\r')
ppreconf1=$(sed -n 10"p" $ftb"settings.conf" | tr -d '\r')

birth1=$(sed -n 11"p" $ftb"settings.conf" | tr -d '\r')
birth2=$(sed -n 12"p" $ftb"settings.conf" | sed 's/\://g' | tr -d '\r')

birth3=$(sed -n 13"p" $ftb"settings.conf" | tr -d '\r')
birth4=$(sed -n 14"p" $ftb"settings.conf" | tr -d '\r')

enable_cross=$(sed -n 15"p" $ftb"settings.conf" | tr -d '\r')

find $fhome -maxdepth 1 -type f -name 'p*.txt' > $fhome"birthd_congr2.txt"

switch1="off"
switch2="off"
}


function logger()
{
local date1=`date '+ %Y-%m-%d %H:%M:%S'`
echo $date1" trbot_"$bui": "$1
}




send1 () 
{

[ "$lev_log" == "1" ] && logger "send1 start"

echo $chat_id > $cuf"send.txt"
echo $otv >> $cuf"send.txt"

rm -f $cuf"out.txt"
file=$cuf"out.txt";
$ftb"cucu2.sh" &
pauseloop;

if [ -f $cuf"out.txt" ]; then
	if [ "$(cat $cuf"out.txt" | grep ":true,")" ]; then	
		logger "send OK"
	else
		logger "send file+, timeout.."
		cat $cuf"out.txt"
		sleep 2
	fi
else	
	logger "send FAIL"
	if [ -f $cuf"cu2_pid.txt" ]; then
		logger "send kill cucu2"
		cu_pid=$(sed -n 1"p" $cuf"cu2_pid.txt" | tr -d '\r')
		killall cucu2.sh
		kill -9 $cu_pid
		rm -f $cuf"cu2_pid.txt"
	fi
fi

[ "$lev_log" == "1" ] && logger "send1 exit"

}

send ()
{
[ "$lev_log" == "1" ] && logger "send start"
rm -f $cuf"send.txt"

chat_id=$(sed -n 2"p" $ftb"settings.conf" | sed 's/z/-/g' | tr -d '\r')
[ "$lev_log" == "1" ] && logger "send chat_id="$chat_id

dl=$(wc -m $otv | awk '{ print $1 }')
echo "dl="$dl
if [ "$dl" -gt "4000" ]; then
	sv=$(echo "$dl/4000" | bc)
	echo "sv="$sv
	$ftb"rex.sh" $otv
	
	for (( i=1;i<=$sv;i++)); do
		otv=$fhome"rez"$i".txt"
		send1;
		rm -f $fhome"rez"$i".txt"
	done
	
else
	send1;
fi



[ "$lev_log" == "1" ] && logger "send exit"
}

pauseloop ()  		
{
sec1=0
rm -f $file
again0="yes"
while [ "$again0" = "yes" ]
do
sec1=$((sec1+1))
sleep 1
if [ -f $file ] || [ "$sec1" -eq "$sec" ]; then
	again0="go"
	[ "$lev_log" == "1" ] && logger "pauseloop sec1="$sec1
fi
done
}



sacrament_of_choice ()
{
logger "sacrament_of_choice"

str_col1=$(grep -cv "^#" $fhome"Covenants.txt")
logger "str_col1="$str_col1
str_col2=$(grep -cv "^#" $fhome"cov.txt")
logger "str_col2="$str_col2

pz=$((str_col2/str_col1))
pz=$((pz*100))
logger "pz="$pz

if [ "$pz" -gt "90" ]; then
	echo "" > $fhome"cov.txt"
	logger "Cleaning cov.txt"
fi


again1="yes"
while [ "$again1" = "yes" ]
do

RANDOM=$(date +%s%N | cut -b10-19 | sed -e 's/^0*//;s/^$/0/'); socn=$(( $RANDOM % $str_col1 + 1 ));
logger "socn="$socn
if ! [ "$(grep $socn":" $fhome"cov.txt")" ]; then
	again1="no"
	echo $socn":" >> $fhome"cov.txt"
fi
done
#shuf -i 6-30 -n 1
}


day_of_the_week ()
{
mdt3=$(date '+%A' | tr -d '\r')
if [ "$mdt3" == "Sunday" ] || [ "$mdt3" == "Воскресенье" ]; then
	switch2="on"
else
	switch2="off"
fi

}


constr_otb_birthdays ()
{
	logger "constr_otb_birthdays"
	pz=$((str_col3/str_col2));	pz=$((pz*100)); logger "constr_otb_birthdays pz="$pz
	if [ "$pz" -gt "98" ]; then
		echo "" > $fhome"br"$b1".txt"
		logger "constr_otb_birthdays Cleaning1 "$fhome"br"$b1".txt"
	fi
	
	ftor=0
	again1="yes"
	while [ "$again1" = "yes" ]
	do
	ftor=$((ftor+1))
	RANDOM=$(date +%s%N | cut -b10-19 | sed -e 's/^0*//;s/^$/0/'); rara=$(( $RANDOM % $str_col2 + 1 ));
	logger "constr_otb_birthdays rara="$rara
	if ! [ "$(grep $rara":" $fhome"br"$b1".txt")" ]; then
		again1="no"
		echo $rara":" >> $fhome"br"$b1".txt"
		
		if [ "$b1" == "1" ] || [ "$b1" == "0" ]; then
			b2=$(sed -n $rara"p" $fhome"birthd_congr"$b1".txt" | tr -d '\r')
			echo $b2 >> $fhome"botv.txt"
		fi
		if [ "$b1" == "2" ]; then
			b2=$(sed -n $rara"p" $fhome"birthd_congr"$b1".txt" | tr -d '\r')
			$fhome"bdstootv.sh" $b2
		fi
		if [ "$b1" == "3" ]; then
			b2=$(sed -n $rara"p" $fhome"flowers.txt" | tr -d '\r')
			echo $b2 >> $fhome"botv.txt"
		fi
	fi
	str_col22=$((str_col2*2))
	[ "$ftor" -gt "$str_col22" ] && logger "constr_otb_birthdays Cleaning2 "$fhome"br"$b1".txt" && ftor=0 && echo "" > $fhome"br"$b1".txt"
	done

}



birthdays ()
{
logger "birthdays"
mdt3=$(date '+%d.%m' | tr -d '\r')
echo "" > $fhome"bds.txt"
bids="off"

str_col1=$(grep -cv "^#" $fhome"birthdays.txt")
logger "birthdays str_col1="$str_col1

if [ "$str_col1" -gt "0" ]; then

for (( i=1;i<=$str_col1;i++)); do
	test=$(sed -n $i"p" $fhome"birthdays.txt" | tr -d '\r')
	if [ "$(echo $test | grep $mdt3)" ]; then
		echo $test | awk -F":" '{print $2}' >> $fhome"bds.txt"
		logger "birthday test="$test
		bids="on"
	fi
done

if [ "$bids" == "on" ]; then
	logger "birthday ON board0"
	str_col2=$(grep -cv "^#" $fhome"birthd_congr0.txt")
	logger "birthday str_col2="$str_col2
	str_col3=$(grep -cv "^#" $fhome"br0.txt")
	logger "birthday str_col3="$str_col3
	echo "" > $fhome"botv.txt"
	b1="0"
	constr_otb_birthdays;
	otv=$fhome"botv.txt"
	send;
	
	logger "birthday ON board1"
	str_col2=$(grep -cv "^#" $fhome"birthd_congr1.txt")
	logger "birthday str_col2="$str_col2
	str_col3=$(grep -cv "^#" $fhome"br1.txt")
	logger "birthday str_col3="$str_col3
	echo "" > $fhome"botv.txt"
	b1="1"
	constr_otb_birthdays;
	$fhome"bdstootv.sh" $fhome"bds.txt"
	
	if [ "$birth3" == "1" ]; then
	logger "birthday birthday ON board2"
	str_col2=$(grep -cv "^#" $fhome"birthd_congr2.txt")
	logger "birthday str_col2="$str_col2
	str_col3=$(grep -cv "^#" $fhome"br2.txt")
	logger "birthday str_col3="$str_col3
	b1="2"
	echo " " >> $fhome"botv.txt"
	echo " " >> $fhome"botv.txt"
	constr_otb_birthdays;
	fi
	
	otv=$fhome"botv.txt"
	send;
	
	if [ "$birth4" == "1" ]; then
	echo "" > $fhome"botv.txt"
	logger "birthday flowers"
	str_col2=$(grep -cv "^#" $fhome"flowers.txt")
	logger "birthday str_col2="$str_col2
	str_col3=$(grep -cv "^#" $fhome"br3.txt")
	logger "birthday str_col3="$str_col3
	b1="3"
	constr_otb_birthdays;
	fi
	
	otv=$fhome"botv.txt"
	send;
fi



fi
}



if ! [ -f $fPID ]; then
PID=$$
echo $PID > $fPID

logger ""
logger "Start covenant_bot"
Init2;
echo $startid > $fhome"id.txt"
logger "chat_id1="$chat_id1


ppreconf=0


while true
do
ppreconf=$((ppreconf+1))

sleep $sec4
mdt1=$(date '+%H:%M' | sed 's/\://g' | tr -d '\r')
mdt2=$(date '+%d' | sed 's/^0*//' | tr -d '\r')
[ "$vs" == "0" ] && day_of_the_week;
logger "mdt1="$mdt1" "$timeout_covenant"   mdt2="$mdt2" "$day_of_cleaning_month"   switch2="$switch2"    birth2="$birth2

if [ "$mdt2" == "$day_of_cleaning_month" ]; then
	if [ "$switch1" == "off" ]; then
	echo "0" > $fhome"cov.txt"
	switch1="on"
	fi
	else
	switch1="off"
fi

if [ "$mdt1" == "$timeout_covenant" ] && [ "$switch2" == "off" ]; then
	sacrament_of_choice;
	cove=$(sed -n $socn"p" $fhome"Covenants.txt" | tr -d '\r')
	logger "cove="$cove
	[ "$enable_cross" == "1" ] && cove1=$(sed -n "1p" $fhome"cross.txt" | tr -d '\r') && cove=$cove1" "$cove
	echo $cove > $fhome"send_coven.txt"
	otv=$fhome"send_coven.txt"
	send;
fi

[ "$mdt1" == "$birth2" ] && [ "$birth1" == "1" ] && birthdays;

if [ "$ppreconf" -gt "$ppreconf1" ]; then
	ppreconf=0
	Init2;
fi

done



else 
	logger "pid up exit"

fi


rm -f $fPID




