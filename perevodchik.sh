#!/bin/bash
RED="\e[31m"
GREEN="\e[32m"
ENDCOLOR="\e[0m"

if [[ -z $1 ]] ; then

echo -e "$RED Пустая строка !! $ENDCOLOR"
exit 1

elif [[ -d $1 ]] ; then

  random_dir=$RANDOM
    mkdir /home/hdd/torrent/$random_dir

 for i in $(find $1 -depth -type d) ; do
    
    cd $i 
    
    
    echo -e "$GREEN \n ^^^^^^^^^^^^^^^^^^^  $ENDCOLOR"
    echo -e "$RED PATH $(pwd)"
    echo -e "$GREEN  ^^^^^^^^^^^^^^^^^^^ \n $ENDCOLOR"
    
    
      find * -maxdepth 0 -type f  -name '*.mp4' -o -name '*.avi' -o -name '*.TS' -o -name '*.mkv'   | while read line; do
            
            
            echo -e "$GREEN*$RED NAME: $ENDCOLOR $line "
            
            filename=$(crow -s "zh-TW" -e "google" -t "en" -b $line | tail -c 1950)
            
            sleep 10
            
            echo $filename > tmp_file.txt
            sed -i 's/,//g' tmp_file.txt
            sed -i 's/【/[/g' tmp_file.txt
            sed -i 's/】/]/g' tmp_file.txt
            sed -i 's/\s/_/g' tmp_file.txt
            
            new_name=$(cat tmp_file.txt )

            echo -e "$GREEN*$RED RENAME $GREEN $new_name $ENDCOLOR\n"

            
            
            mv -vf "$line" "$new_name"
           # mv -v  $new_name /home/hdd/torrent/$random_dir
            echo -e "$RED _________________ $ENDCOLOR\n"

            done
  done
echo -e "$GREEN \n ^^^^^^^^^^^^^^^^^^^ \n $ENDCOLOR"

else 
    echo -e "$RED укажи каталог !! $ENDCOLOR"
    exit 2

fi
