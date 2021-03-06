#!/bin/zsh

function gac() {
  if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    # displays help with
    # gac | gac -h | gac --help
    echo "------"
    echo "Cannot commit without comments. Semantic reminder:"
    echo "chore(๐ฆ):        c" 
    echo "docs(๐):         d" 
    echo "feat(โ):         f" 
    echo "refactor(๐ช):     r" 
    echo "style(๐จ):        s"
    echo "test(๐งช):         t" 
    echo "fix(๐):          x"
    echo "------"
    return 1
  fi  

  SHORTCUT=$1
  shift ;
  COMMENT=$@

  # Chore
  if [ "$SHORTCUT" = "c" ]; then
    SHORTCUT="chore(๐ฆ):"

  # Write or edit existing documentation
  elif [ "$SHORTCUT" = "d" ]; then
    SHORTCUT="docs(๐):"

  # Add new feature
  elif [ "$SHORTCUT" = "f" ]; then
    SHORTCUT="feat(โ):"

  # Refator your code base
  elif [ "$SHORTCUT" = "r" ]; then
    SHORTCUT="refactor(๐ช):"

  # Styling actions
  elif [ "$SHORTCUT" = "s" ]; then 
    SHORTCUT="style(๐จ):"

  # Test your code
  elif [ "$SHORTCUT" = "t" ]; then 
    SHORTCUT="test(๐งช):"

  # Working on a feature
  elif [ "$SHORTCUT" = "x" ]; then 
    SHORTCUT="fix(๐):"
  fi
  
  # res with or without semantic
  git add -A && git commit -m "$SHORTCUT $COMMENT"
  return 1
}