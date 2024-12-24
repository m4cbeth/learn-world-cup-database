#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# Do not change code above this line. Use the PSQL variable above to query your database.

cat gamestest.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != 'year' ]]; then
    # Team Table First
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")
    if [[ -z $TEAM_ID ]]; then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO")
    fi
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name ='$opponent'")
    if [[ -z $TEAM_ID ]]; then
      echo $TEAM_ID
    fi

  fi

done