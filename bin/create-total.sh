#!/bin/bash

[[ ! -d total ]] && mkdir total

find -E sub -regex ".*\.rules?" -print0 | \
    tr -d '\n' | \
    xargs -0 cat > total/total.rules

dos2unix total/total.rules 2>&1 | grep -v "dos2unix: converting file" > /dev/null

if [[ $(uname) == "Darwin" ]]; then
    sed -i "" '/^$/d' total/total.rules
else
    sed -i '/^$/d' total/total.rules
fi

