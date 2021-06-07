#!/bin/zsh

function gac() {
  
  if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    # displays help with
    # gac | gac -h | gac --help
    echo "------"
    echo "Cannot commit without comments. Semantic reminder:"
    echo "🐛 BUG FIX:       b" 
    echo "📦 CHORE:         c" 
    echo "📖 DOCS:          d" 
    echo "➕ FEAT:          f" 
    echo "🚀 NEW REALSE:    n" 
    echo "👌 IMPROVE:       i"
    echo "🪚 REFACTOR:      r" 
    echo "🎨 STYLE:         s"
    echo "🧪 TEST:          t"
    echo "🛠  WORKING ON:    w"
    echo "------"
    return 1
  fi 


  SHORTCUT=$1
  shift ;
  COMMENT=$@

  # Fix a bug
  if [ "$SHORTCUT" = "b" ]; then
    SHORTCUT="🐛 BUG FIX:"

  # Chore
  elif [ "$SHORTCUT" = "c" ]; then
    SHORTCUT="📦 CHORE:"

  # Write or edit existing documentation
  elif [ "$SHORTCUT" = "d" ]; then
    SHORTCUT="📖 DOCS:"

  # Add new feature
  elif [ "$SHORTCUT" = "f" ]; then
    SHORTCUT="➕ FEAT:"

  # Deploy in production
  elif [ "$SHORTCUT" = "n" ]; then
    SHORTCUT="🚀 NEW REALSE:"
  
  # Improve your code base
  elif [ "$SHORTCUT" = "i" ]; then
    SHORTCUT="👌 IMPROVE:"

  # Refator your code base
  elif [ "$SHORTCUT" = "r" ]; then
    SHORTCUT="🪚 REFACTOR:"

  # Styling actions
  elif [ "$SHORTCUT" = "s" ]; then 
    SHORTCUT="🎨 STYLE:"

  # Test your code
  elif [ "$SHORTCUT" = "t" ]; then 
    SHORTCUT="🧪 TEST:"

  # Working on a feature
  elif [ "$SHORTCUT" = "w" ]; then 
    SHORTCUT="🛠  WORKING ON:"
 
  else
    # ask confirmation if you miss a semantic above
    echo "⚠️  You are about to commit without semantic. Continue? [Y/n]"
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