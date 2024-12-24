#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

TRUNCATE=$($PSQL "TRUNCATE games")
echo $TRUNCATE
echo truncated tables

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != 'year' ]]; then
    # Insert Winner Team
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    if [[ -z $TEAM_ID ]]; then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]; then
        echo "Inserted team: $WINNER"
      fi
    fi

    # Insert Opponent Team
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    if [[ -z $TEAM_ID ]]; then
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]; then
        echo "Inserted team: $OPPONENT"
      fi
    fi

    # Insert Games
    # INSERT_GAME_RESULT=$($PSQL "INSERT INTO 
    # games(year, round, winner_goals, opponent_goals) 
    # VALUES($YEAR, '$ROUND', $WGOALS, $OGOALS)")
    # echo $INSERT_GAME_RESULT
  fi
done 