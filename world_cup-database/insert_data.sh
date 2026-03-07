#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Add each unique team to the teams table (24)

# Read in the csv file
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    WINNER_IN_LIST=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER';")
    if [[ -z $WINNER_IN_LIST ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$WINNER');"
    fi
    OPPONENT_IN_LIST=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT';")
    if [[ -z $OPPONENT_IN_LIST ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');"
    fi
    WINNER_ID_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_ID_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID_RESULT, $OPPONENT_ID_RESULT, $WINNER_GOALS, $OPPONENT_GOALS);"
  fi  
done

