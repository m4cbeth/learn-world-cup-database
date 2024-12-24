#!/bin/bash
if [[ $1 == "save" ]]; then
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
elif [[ $1 == "load" ]]; then
echo loading
else
echo Pick save or load
fi
