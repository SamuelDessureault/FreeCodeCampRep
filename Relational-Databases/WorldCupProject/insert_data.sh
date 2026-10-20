#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
CSV="games.csv"
MAX_STRING_LENGTH=20

ADD_TEAM_IF_MISSING(){
  if [[ ${#1} -ge $MAX_STRING_LENGTH ]]
  then
    echo "$1 is too long of a name!"
    return 1; # Exit with error.
  fi

  ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$1'")
  if [[ -z $ID ]]
  then
    RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$1')")
    if [[ $? -eq 0 ]]
    then
      echo "New team was added to the database: $1"
    fi
  fi
}

tail -n +2 "$CSV" | while IFS=, read -r YEAR ROUND WINNER OPPONENT WINGOALS OPPGOALS
do
  echo $YEAR $ROUND $WINNER $OPPONENT $WINGOALS $OPPGOALS

  if [[ "$YEAR" =~ ^[0-9]{4}$ && "${#ROUND}" -lt $MAX_STRING_LENGTH && "$WINGOALS" =~ ^[0-9]+$ && "$OPPGOALS" =~ ^[0-9]+$ ]];
  then
    ADD_TEAM_IF_MISSING "$WINNER"
    ADD_TEAM_IF_MISSING "$OPPONENT"

    WINNERID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
    OPPONENTID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
    RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNERID, $OPPONENTID, $WINGOALS, $OPPGOALS)")
  fi
done