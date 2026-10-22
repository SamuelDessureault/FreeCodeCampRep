#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ -z "$1" ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ "$1" =~ ^[0-9]+$ ]]; then
  QUERY_RESULT=$($PSQL "SELECT
      e.atomic_number,
      e.name,
      e.symbol,
      t.type,
      p.atomic_mass,
      p.melting_point_celsius,
      p.boiling_point_celsius
    FROM elements AS e
    JOIN properties AS p USING (atomic_number)
    JOIN types AS t USING (type_id)
    WHERE e.atomic_number = $1;")
else
  QUERY_RESULT=$($PSQL "SELECT
      e.atomic_number,
      e.name,
      e.symbol,
      t.type,
      p.atomic_mass,
      p.melting_point_celsius,
      p.boiling_point_celsius
    FROM elements AS e
    JOIN properties AS p USING (atomic_number)
    JOIN types AS t USING (type_id)
    WHERE LOWER(e.symbol) = LOWER('$1')
       OR LOWER(e.name) = LOWER('$1');")
fi

if [[ -z "$QUERY_RESULT" ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING <<< "$QUERY_RESULT"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."