#!/bin/bash

ftb=/usr/share/covenant_bot/
f_text=$1

IFS=$'\x10'
text=`cat $f_text`

echo $text >> $ftb"botv.txt"
