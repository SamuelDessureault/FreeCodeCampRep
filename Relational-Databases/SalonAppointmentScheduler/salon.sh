#! /bin/bash

# Crucial: Added --tuples-only (-t) and --no-align (-A) to ensure clean variable data
PSQL="psql --username=freecodecamp --dbname=salon -t -A -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

ENTER_TIME(){
  local SERVICE_ID_SELECTED=$1
  local SERVICE_TYPE=$2
  local CUSTOMER_ID=$3
  local CUSTOMER_NAME=$4

  echo -e "\nWhat time would you like your $SERVICE_TYPE, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(time, service_id, customer_id) VALUES('$SERVICE_TIME', $SERVICE_ID_SELECTED, $CUSTOMER_ID)")
  echo -e "\nI have put you down for a $SERVICE_TYPE at $SERVICE_TIME, $CUSTOMER_NAME."
}

ENTER_DATA(){
  local MESSAGE=$1
  local SERVICE_ID_SELECTED=$2
  local SERVICE_TYPE=$3

  echo -e "$MESSAGE"
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z "$CUSTOMER_ID" ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  fi

  ENTER_TIME $SERVICE_ID_SELECTED $SERVICE_TYPE $CUSTOMER_ID "$CUSTOMER_NAME"
}

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  echo "$AVAILABLE_SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  SERVICE_TYPE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  if [[ -z "$SERVICE_TYPE" ]]
  then
    MAIN_MENU "I do not offer that service. What can I do for you today?"
  else
    ENTER_DATA "" $SERVICE_ID_SELECTED $SERVICE_TYPE
  fi
}

MAIN_MENU "Welcome to my salon, how can I help you?"