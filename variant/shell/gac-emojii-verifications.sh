#!/bin/zsh

function gac() {
  
  if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    # displays help with
    # gac | gac -h | gac --help
    echo "------"
    echo "Cannot commit without comments. Semantic reminder:"
    echo "๐ BUG FIX:       b" 
    echo "๐ฆ CHORE:         c" 
    echo "๐ DOCS:          d" 
    echo "โ FEAT:          f" 
    echo "๐ NEW RELEASE:   n" 
    echo "๐ IMPROVE:       i"
    echo "๐ช REFACTOR:      r" 
    echo "๐จ STYLE:         s"
    echo "๐งช TEST:          t"
    echo "๐   WORKING ON:    w"
    echo "------"
    return 1
  fi 


  SHORTCUT=$1
  shift ;
  COMMENT=$@

  # Fix a bug
  if [ "$SHORTCUT" = "b" ]; then
    SHORTCUT="๐ BUG FIX:"

  # Chore
  elif [ "$SHORTCUT" = "c" ]; then
    SHORTCUT="๐ฆ CHORE:"

  # Write or edit existing documentation
  elif [ "$SHORTCUT" = "d" ]; then
    SHORTCUT="๐ DOCS:"

  # Add new feature
  elif [ "$SHORTCUT" = "f" ]; then
    SHORTCUT="โ FEAT:"

  # Deploy in production
  elif [ "$SHORTCUT" = "n" ]; then
    SHORTCUT="๐ NEW RELEASE:"
  
  # Improve your code base
  elif [ "$SHORTCUT" = "i" ]; then
    SHORTCUT="๐ IMPROVE:"

  # Refator your code base
  elif [ "$SHORTCUT" = "r" ]; then
    SHORTCUT="๐ช REFACTOR:"

  # Styling actions
  elif [ "$SHORTCUT" = "s" ]; then 
    SHORTCUT="๐จ STYLE:"

  # Test your code
  elif [ "$SHORTCUT" = "t" ]; then 
    SHORTCUT="๐งช TEST:"

  # Working on a feature
  elif [ "$SHORTCUT" = "w" ]; then 
    SHORTCUT="๐   WORKING ON:"
 
  else
    # ask confirmation if you miss a semantic above
    echo "โ ๏ธ  You are about to commit without semantic. Continue? [Y/n]"
    read RESPONSE  
   
    RESPONSE=${RESPONSE:l} # response tolowercase
    if [[ $RESPONSE =~ ^(yes|y| ) ]] || [ -z $RESPONSE ]; then
      # commit anyway
      git add -A && git commit -m "$SHORTCUT $COMMENT"
      return 1
    else 
      echo "Not Commited"
      return 1
    fi
  fi
 
  git add -A && git commit -m "$SHORTCUT $COMMENT"
  return 1
}