#!/bin/zsh

function gac() {
  if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    # displays help with
    # gac | gac -h | gac --help
    echo "------"
    echo "Cannot commit without comments. Semantic reminder:"
    echo "chore:        c" 
    echo "docs:         d" 
    echo "feat:         f" 
    echo "refactor:     r" 
    echo "style:        s"
    echo "test:         t" 
    echo "fix:          x"
    echo "------"
    return 1
  fi  

  SHORTCUT=$1
  shift ;
  COMMENT=$@

  # Chore
  if [ "$SHORTCUT" = "c" ]; then
    SHORTCUT="chore:"

  # Write or edit existing documentation
  elif [ "$SHORTCUT" = "d" ]; then
    SHORTCUT="docs:"

  # Add new feature
  elif [ "$SHORTCUT" = "f" ]; then
    SHORTCUT="feat:"

  # Refator your code base
  elif [ "$SHORTCUT" = "r" ]; then
    SHORTCUT="refactor:"

  # Styling actions
  elif [ "$SHORTCUT" = "s" ]; then 
    SHORTCUT="style:"

  # Test your code
  elif [ "$SHORTCUT" = "t" ]; then 
    SHORTCUT="test:"

  # Working on a feature
  elif [ "$SHORTCUT" = "x" ]; then 
    SHORTCUT="fix:"
  fi
  
  # res with or without semantic
  git add -A && git commit -m "$SHORTCUT $COMMENT"
  return 1
}
