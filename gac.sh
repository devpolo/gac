#!/bin/zsh

function gac() {

  if [ $# -eq 0 ] || [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    # displays help with
    # gac | gac -h | gac --help
    echo "------"
    echo "Cannot commit without comments. Semantic reminder:"
    echo "🐛 BUG FIX:       b" 
    echo "📖 DOCS:          d" 
    echo "➕ FEAT:          f" 
    echo "🚀 NEW REALSE:    n" 
    echo "👌 IMPROVE:       i"
    echo "🔧 REFACTOR:      r" 
    echo "🎨 STYLE:         s"
    echo "🧪 TEST:          t"
    echo "⚙️  WORKING ON:    w"
    echo "------"
    return 1
  fi  

  SHORTCUT=$1
  shift ;
  COMMENT=$@


  # Fix a bug
  if [ "$SHORTCUT" = "b" ]; then
    SHORTCUT="🐛 BUG FIX:"

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
    SHORTCUT="🔧 REFACTOR:"

  # Styling actions
  elif [ "$SHORTCUT" = "s" ]; then 
    SHORTCUT="🎨 STYLE:"

  # Test your code
  elif [ "$SHORTCUT" = "t" ]; then 
    SHORTCUT="🧪 TEST:"

  # Working on a feature
  elif [ "$SHORTCUT" = "w" ]; then 
    SHORTCUT="⚙️  WORKING ON:"
  fi
  
  # res with or without semantic
  git add -A && git commit -m "$SHORTCUT $COMMENT"
  return 1
}