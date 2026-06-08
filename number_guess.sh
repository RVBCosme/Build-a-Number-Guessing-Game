#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

# Check if username exists in database
USER_QUERY=$($PSQL "SELECT user_id, games_played, best_game FROM number_guess WHERE username='$USERNAME';")

if [[ -z $USER_QUERY ]]
then
  # New User
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert new user into database
  INSERT_USER=$($PSQL "INSERT INTO number_guess(username, games_played, best_game) VALUES('$USERNAME', 0, NULL);")
else
  # Existing user
  IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_QUERY"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random secret number between 1 and 1000
SECRET_NUMBER=$((RANDOM % 1000 + 1))

echo -e "\nGuess the secret number between 1 and 1000:"

# Initialize guess counter
NUMBER_OF_GUESSES=0

while true
do
  read GUESS
  
  # Check if input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
  
  # Increment guess counter
  ((NUMBER_OF_GUESSES++))
  
  # Compare guess with secret number
  if (( GUESS < SECRET_NUMBER ))
  then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER ))
  then
    echo "It's lower than that, guess again:"
  else
    # Correct guess
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Update database with new game
    if [[ -z $USER_QUERY ]]
    then
      # New user, set first game stats
      UPDATE_RESULT=$($PSQL "UPDATE number_guess SET games_played=1, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME';")
    else
      # Existing user, increment games and update best if applicable
      NEW_GAMES_PLAYED=$((GAMES_PLAYED + 1))
      if [[ -z $BEST_GAME ]] || (( NUMBER_OF_GUESSES < BEST_GAME ))
      then
        BEST_GAME=$NUMBER_OF_GUESSES
      fi
      UPDATE_RESULT=$($PSQL "UPDATE number_guess SET games_played=$NEW_GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';")
    fi
    
    break
  fi
done