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
    
    cd $1 
    
    echo -e "$GREEN---------$ENDCOLOR START $GREEN--------------->  $ENDCOLOR"
    echo -e "|>\n------------------------------>"
    echo -e "$RED PATH $GREEN $(pwd) $ENDCOLOR"
    echo -e "------------------------------>"
    
      #рекурсивный обход  каталогов до 5 уровня по названиям расширениям
      find * -maxdepth 5 -type f  -name '*.mp4' -o -name '*.avi' -o -name '*.TS' -o -name '*.mkv'   | while read line; do
            
            echo -e "\n------------------------------>"
            echo -e "| $GREEN*$RED NAME: $ENDCOLOR $line "
            
            
             path_name=$(echo $line | rev | cut -d '/' -f2- | rev)
             tmp_filename=$(echo $line | rev | cut -d '/' -f 1 | rev)
             
             filename=$(crow -s "zh-TW" -e "google" -t "en" -b $tmp_filename | tail -c 1950)
                  
                  
             sleep 10
             
             echo $filename > tmp_file.txt
             sed -i 's/,//g' tmp_file.txt
             sed -i 's/【/[/g' tmp_file.txt
             sed -i 's/】/]/g' tmp_file.txt
             sed -i 's/\s/_/g' tmp_file.txt
             
             new_name=$(cat tmp_file.txt )
 
             echo -e "| $GREEN*$RED RENAME $GREEN $new_name $ENDCOLOR"
             echo -e "------------------------------>"
             echo -e "\n$RED---------$ENDCOLOR notify $RED------------->$ENDCOLOR"
              if [ "$path_name" == "$tmp_filename" ] ; then 
                          mv -vf "$tmp_filename" "$new_name"
              else
                          mv -vf "$line" "$new_name"
              fi
             
             mv -v  $new_name /home/hdd/torrent/$random_dir
             echo -e "$RED ------------------------------> $ENDCOLOR\n"

            done
            
            

else 
    echo -e "$RED укажи каталог !! $ENDCOLOR"
    exit 2

fi
