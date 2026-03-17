#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"
# Ask for username
echo "Enter your username:"
read USERNAME

# Check if username is already in database
GET_USERNAME="$($PSQL "SELECT games_played, best_game FROM users WHERE username = '$USERNAME';")"
if [[ -z $GET_USERNAME ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_NEW_USER="$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")"
else
  echo $GET_USERNAME | while IFS='|' read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# Generate a random number between 1 and 1000
NUMBER=$(( RANDOM % 1000 +1 ))

# Declare variable to count number of guesses
TRIES=0

# Get the user's guess
echo "Guess the secret number between 1 and 1000:"
while [[ ! $GUESS || $NUMBER != $GUESS ]]
do
  read GUESS
  TRIES=$(( TRIES + 1 ))
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS > $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS < $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
    fi
  else
    echo "That is not an integer, guess again:"
  fi  
done

# Update games_played 
OLD_GAMES_PLAYED="$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME';")"
NEW_GAMES_PLAYED=$(( OLD_GAMES_PLAYED + 1 ))
UPDATE_GAMES_PLAYED="$($PSQL "UPDATE users SET games_played = $NEW_GAMES_PLAYED WHERE username = '$USERNAME';")"

# Update best_game
OLD_BEST_GAME="$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME';")"
if [[ $TRIES < $OLD_BEST_GAME || -z $OLD_BEST_GAME ]]
then
  UPDATE_BEST_GAME="$($PSQL "UPDATE users SET best_game = $TRIES WHERE username = '$USERNAME';")"
fi