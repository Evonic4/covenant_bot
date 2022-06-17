#!/bin/bash

ftb=/usr/share/covenant_bot/
fPID=$ftb"cu2_pid.txt"


directly () {

IFS=$'\x10'
text=`cat $f_text`
echo "token="$token
echo "chat_id="$chat_id
echo $text

if ! [ -z "$text" ]; then
if [ -z "$proxy" ]; then
curl -k -m 13 -L -X POST https://api.telegram.org/bot$token/sendMessage -d chat_id="$chat_id" -d 'parse_mode=HTML' --data-urlencode "text="$text 2>&1 > $ftb"out0.txt"
else
curl -k -m 13 --proxy $proxy -L -X POST https://api.telegram.org/bot$token/sendMessage -d chat_id="$chat_id" -d 'parse_mode=HTML' --data-urlencode "text="$text 2>&1 > $ftb"out0.txt"
fi

cat $ftb"out0.txt"
mv $ftb"out0.txt" $ftb"out.txt"
fi


}


if ! [ -f $fPID ]; then		#----------------------- старт------------------
PID=$$
echo $PID > $fPID
#echo "start"
token=$(sed -n "1p" $ftb"settings.conf" | tr -d '\r')

f_text=$(sed -n "2p" $ftb"send.txt" | tr -d '\r')
proxy=$(sed -n 5"p" $ftb"settings.conf" | tr -d '\r')

str_col=$(grep -cv "^#" $ftb"chats.txt")
#echo "str_col="$str_col
if [ "$str_col" -gt "0" ]; then
for (( i=1;i<=$str_col;i++)); do
	chat_id=$(sed -n $i"p" $ftb"chats.txt" | sed 's/z/-/g' | tr -d '\r')
	directly;
done
fi





fi #----------------------- конец старт------------------
rm -f $fPID
