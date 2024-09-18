#!/bin/bash


array="$(findmnt -lo target -n -t nfs,nfs4)"

comma=""
printf '%s' '{"data":['

while IFS= read -r line ; do
        printf '%s' "$comma{\"{#MOUNT_POINT}\":\"$line\"}"
        comma=","
done <<< "$array"

printf '%s' ']}'
