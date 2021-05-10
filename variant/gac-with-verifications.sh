#!/bin/zsh

function gac() {
  
  if [ $# -eq 0 ]; then 
    # throw err if no arguments
    echo "------"
    echo "⛔️ Cannot commit without message."
    echo "⭐️ Need help: gac --help"
    echo "------"
    return 1
  fi  

  if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    # gac -h or --help, displays help
    echo "------"
    echo "Semantic reminder:"
    echo "📖 DOC:       d"
    echo "🐛 FIX:       f"
    echo "👌 IMPROVE:   i"
    echo "✅ NEW FEAT:  n"
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
 
  else
    # ask confirmation if you miss a semantic above
    echo "⚠️  You are about to commit without semantic. Continue? [Y/n]"
    read RESPONSE  
   
    RESPONSE=${RESPONSE:l} # response tolowercase
    if [[ $RESPONSE =~ ^(yes|y| ) ]] || [ -z $RESPONSE ]; then
      # commit anyway
      git add -A && git commit -m "$SEMANTIC $COMMENT"
      return 1
    else 
      echo "Not Commited"
      return 1
    fi
  fi
 
  git add -A && git commit -m "$SEMANTIC $COMMENT"
  return 1
}