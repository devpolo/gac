
# gac fucntion
function gac {
    if($args.length -eq 0 -or $args[0] -eq "--help" -or $args[0] -eq "-h") {
        Print-Gac-Help |
            ForEach {[PSCustomObject]$_} | 
            Format-Table -Property @{ e="Command"; width = 30 }, "Commit Message"
        return $null;
    }

    $commit_msg = switch ($args[0]) {
        "b" { "🐛 BUG FIX: " + $args[1..($args.length-1)] }
        "c" { "📦 CHORE: " + $args[1..($args.length-1)] }
        "d" { "📖 DOCS: " + $args[1..($args.length-1)] }
        "f" { "✅ FEAT: " + $args[1..($args.length-1)] }
        "n" { "🚀 NEW RELEASE: " + $args[1..($args.length-1)] }
        "i" { "👌 IMPROVE: " + $args[1..($args.length-1)] }
        "r" { "🥈 REFACTOR: " + $args[1..($args.length-1)] }
        "s" { "🎨 STYLE: " + $args[1..($args.length-1)] }
        "t" { "🧪 TEST: " + $args[1..($args.length-1)] }
        "w" { "🛠 WORKING ON: " + $args[1..($args.length-1)] }
        default { "" + $args }
    }

    git add -A;
    git commit -m $commit_msg;
    return $null
}

# Help fucntion to print all available gac commands
function Print-Gac-Help {
    echo "Available gac commands"

    $all_commands = @(
        @{Command="gac b <you message>"; "Commit Message"="🐛 BUG FIX: <you message>"}
        @{Command="gac c <you message>"; "Commit Message"="📦 CHORE: <you message>"}
        @{Command="gac d <you message>"; "Commit Message"="📖 DOCS: <you message>"}
        @{Command="gac f <you message>"; "Commit Message"="✅ FEAT: <you message>"}
        @{Command="gac n <you message>"; "Commit Message"="🚀 NEW RELEASE: <you message>"}
        @{Command="gac i <you message>"; "Commit Message"="👌 IMPROVE: <you message>"}
        @{Command="gac r <you message>"; "Commit Message"="🥈 REFACTOR: <you message>"}
        @{Command="gac s <you message>"; "Commit Message"="🎨 STYLE: <you message>"}
        @{Command="gac t <you message>"; "Commit Message"="🧪 TEST: <you message>"}
        @{Command="gac w <you message>"; "Commit Message"="🛠 WORKING ON: <you message>"}
        @{Command="gac <you message>"; "Commit Message"="<you message>"}
    )

    return $all_commands
}