#!/bin/bash

##Extract string between 'left' and 'right'
#grep -Po '(?<=(left)).*(?=(right))'
##change strings containing slashes
#sed 's,{some_path},{other_path},'
##change strings not containing slashes
#sed 's/tausch_das/mit_dem/g'

# 1. Preparation: extract all relevant lines
#grep '    <DL\|        <DT' ./Lesezeichen.html | tee output.html

# 2. Extract only the lines of each chapter, result e.g. BBK.html


# 3. ./convert_html_2_csv.sh BBK
TABLE=$1

cat "${TABLE}.html" | grep -Po '(?<=(        <DT><A HREF=")).*(?=(/A>))' | sed 's/" target="_blank"/*/g' | sed 's/>//g' | sed 's/<//g' > "${TABLE}"

IFS='/'
text=$(cat "${TABLE}")

while read line
do
  read -ra newarr <<< "${line}"
  echo "${line}*${newarr[2]}*${TABLE}" | tee -a "${TABLE}.csv"
done <<< "$text"

# 4. import CSV to sqlite
#sqlite3 lzdatabase.db
#.mode csv
#.separator "*"
#.import BBK.csv entries

