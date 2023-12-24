#!/usr/bin/tag.bash

LAST_ID=$(git tag -l |  sort -V | tail -n 1)
if [[ -n "${LAST_ID}" ]] ; then
    LAST_IDX=$(echo "${LAST_ID}" | sed -E "'s/^v\([0-9]\+\)\.\([0-9]\+\)-\([0-9]\+\)/\3/'")
    NEXT_ID=$(( LAST_IDX + 1 ))
else
    NEXT_ID=0
fi

echo $NEXT_ID