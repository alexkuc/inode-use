#!/bin/sh
function inode_use() { \
echo -e "\\nINODE USE\\n"; \
shopt -s dotglob; \
unset c; \
for folder in */; \
do \
    if [ ! -L "${folder%/}" ]; \
        then out="$(find $folder | echo `expr $(wc -l) - 1`)"; \
        c+="$(echo "$(printf "%-05s" $out)   $folder\\n")"; \
    fi; \
done; \
shopt -u dotglob; \
c="$(echo -e "$c" | sort -rn)"; \
echo -e "$c"; \
echo -e ""; \
}

export -f inode_use;
