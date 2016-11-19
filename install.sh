#!/bin/bash

ZSH_RC=".zshrc"
ZSH_RC_PATH=$HOME"/"$ZSH_RC
COMMON_RC_FILE=".commonrc"

cp ./$COMMON_RC_FILE $HOME
echo "Searching for $ZSH_RC_PATH"
if [ -e "$ZSH_RC_PATH" ]
then
  echo "$ZSH_RC file has been found, checking if it already includes $COMMON_RC_FILE"
  if grep -Fxq "$ZSH_RC_PATH" "$COMMON_RC_FILE"
  then
   echo "looks like $COMMON_RC_FILE need to be added. Adding."
   echo "source ~/$COMMON_RC_FILE" >> ~/$ZSH_RC_PATH
   echo "file $COMMON_RC_FILE has been added to the $ZSH_RC"
   echo "$COMMON_RC_FILE has been added to the $ZSH_RC"
  else
   echo "$ZSH_RC already has the $COMMON_RC_FILE"
  fi
else
  echo "no $ZSH_RC file has been found."
fi
