#!/bin/zsh

function gac() {

  if [ $# -eq 0 ]; then 
    # res without any word after "gac" command
    git add -A && git commit -m "🔧 REFACTOR: no comments"
    return 1
  fi  

  if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "------"
    echo "Semantic reminder:"
    echo "📖 DOC:       d"
    echo "🐛 FIX:       f"
    echo "👌 IMPROVE:   i"
    echo "✅ NEW FEAT:  n"
    echo "🔧 REFACTOR:  null"
    echo "🚀 RELEASE:   r"
    echo "🧪 TEST:      t"
    echo "------"
    return 1
  fi  


  SEMANTIC=$1
  shift ;
  COMMENT=$@

  # Write or edit existing documentation
  if [ "$SEMANTIC" = "d" ]; then
    SEMANTIC="📖 DOC:"

  # Fix a bug
  elif [ "$SEMANTIC" = "f" ]; then
    SEMANTIC="🐛 FIX:"
  
  # Refator your code base
  elif [ "$SEMANTIC" = "i" ]; then
    SEMANTIC="👌 IMPROVE:"

  # Add new features
  elif [ "$SEMANTIC" = "n" ]; then
    SEMANTIC="✅ NEW FEAT:"

  # Ready for production
  elif [ "$SEMANTIC" = "r" ]; then 
    SEMANTIC="🚀 RELEASE:"

  # Test your code
  elif [ "$SEMANTIC" = "t" ]; then 
    SEMANTIC="🧪 TEST:"
  fi
  
  # res with or without semantic
  git add -A && git commit -m "$SEMANTIC $COMMENT"
  return 1
}