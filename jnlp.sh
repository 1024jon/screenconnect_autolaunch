#!/bin/bash
LASTFILE=none
everyother=1
inotifywait -m ~/Downloads -e close_nowrite |
    while read directory action file; do
        if [[ "$file" =~ .*jnlp$ ]]; then # Does the file end with .xml?
        filecreatedtime=$(stat -c '%w' ~/Downloads/$file)
        echo $filecreatedtime
            if [[ $LASTFILE != $filecreatedtime ]]; then
              if [[ $everyother == 1 ]]; then
                 javaws ~/Downloads/"$file"
                 rm ~/Downloads/"$file"
                 everyother=0
              else
                 everyother=1
              fi
              LASTFILE=$filecreatedtime
            fi
        fi
    done
