#!/bin/bash
LASTFILE=none
inotifywait -m ~/Downloads -e close_nowrite |
    while read directory action file; do
        if [[ "$file" =~ .*jnlp$ ]]; then # Does the file end with .xml?
            if [[ $LASTFILE != $file ]]; then
              javaws ~/Downloads/"$file"
              rm ~/Downloads/"$file"
              LASTFILE=$file
            fi
        fi
    done
