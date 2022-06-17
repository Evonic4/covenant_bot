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

timeout_covenant=$(sed -n 3"p" $ftb"settings.conf" | tr -d '\r')
echo $regim > $ftb"amode.txt"
sec4=$(sed -n 4"p" $ftb"settings.conf" | tr -d '\r')
sec4=$((sec4/1000))
sec=$(sed -n 6"p" $ftb"settings.conf" | tr -d '\r')
bui=$(sed -n 7"p" $ftb"settings.conf" | tr -d '\r')
last_id=0
kkik=0
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
		cat $cuf"out.txt" >> $log
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
echo "str_col1="$str_col1
str_col2=$(grep -cv "^#" $fhome"cov.txt")
echo "str_col2="$str_col2

again1="yes"
while [ "$again1" = "yes" ]
do

socn=$(date +%s%N | cut -b10-19 | sed -e 's/^0*//;s/^$/0/'); echo $(( $RANDOM % $str_col1 + 1 ));
if ! [ "$(grep $socn $fhome"cov.txt")" ]; then
	again1="no"
fi

#prolog=$(sed -n 6"p" $ftb"settings.conf" | tr -d '\r')
done


#shuf -i 6-30 -n 1


}



if ! [ -f $fPID ]; then
PID=$$
echo $PID > $fPID

logger ""
logger "Start covenant_bot"
Init2;
echo $startid > $fhome"id.txt"
logger "chat_id1="$chat_id1

kkik=0



while true
do
sleep $sec4
mdt1=$(date '+%H:%M' | sed 's/\://g' | tr -d '\r')
if [ "$mdt1" == "$timeout_covenant" ]; then
	sacrament_of_choice;
	cove=$(sed -n $socn"p" $fhome"Covenants.txt" | tr -d '\r')
	echo $cove >> $fhome"send_coven.txt"
	otv=$fhome"send_coven.txt"
	send;
fi
done



else 
	logger "pid up exit"

fi


rm -f $fPID




