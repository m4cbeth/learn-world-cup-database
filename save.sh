#!/bin/bash
if [[ $1 == "save" ]]; then
pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql
echo "dumped sql"
elif [[ $1 == "load" ]]; then
psql -U postgres < worldcup.sql
echo "rebuilt database"
else
echo Pick save or load
fi
