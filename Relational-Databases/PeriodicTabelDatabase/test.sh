#!/bin/bash

set -e

check_output() {
  expected="$1"
  shift

  actual=$("$@")

  if [[ "$actual" != "$expected" ]]; then
    echo "FAIL: $*"
    echo "Expected: $expected"
    echo "Actual:   $actual"
    exit 1
  fi

  echo "PASS: $*"
}

check_output \
  "Please provide an element as an argument." \
  ./element.sh

check_output \
  "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius." \
  ./element.sh 1

check_output \
  "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius." \
  ./element.sh H

check_output \
  "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius." \
  ./element.sh Hydrogen

check_output \
  "I could not find that element in the database." \
  ./element.sh 999

echo "All script tests passed."