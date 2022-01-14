
function gac {
    if($args.length -eq 0 -or $args[0] -eq "--help" -or $args[0] -eq "-h") {
        PrintGacHelp |
            ForEach-Object {[PSCustomObject]$_} | 
            Format-Table -Property @{ e="Command"; width = 30 }, "Commit Message"
        return $null;
    }

    $commit_msg = switch ($args[0]) {
        "c" { "chore: " + $args[1..($args.length-1)] }
        "d" { "docs: " + $args[1..($args.length-1)] }
        "f" { "feat: " + $args[1..($args.length-1)] }
        "r" { "refactor: " + $args[1..($args.length-1)] }
        "s" { "style: " + $args[1..($args.length-1)] }
        "t" { "test: " + $args[1..($args.length-1)] }
        "x" { "fix: " + $args[1..($args.length-1)] }
        default { "" + $args }
    }

    git add -A;
    git commit -m $commit_msg;
    return $null
}

# Help fucntion to print all available gac commands
function PrintGacHelp {
    Write-Output "Available gac commands"

    $all_commands = @(
        @{Command="gac c <your message>"; "Commit Message"="chore: <your message>"} 
        @{Command="gac d <your message>"; "Commit Message"="docs: <your message>"} 
        @{Command="gac f <your message>"; "Commit Message"="feat: <your message>"} 	
        @{Command="gac r <your message>"; "Commit Message"="refactor: <your message>"} 
        @{Command="gac s <your message>"; "Commit Message"="style: <your message>"} 
        @{Command="gac t <your message>"; "Commit Message"="test: <your message>"} 
        @{Command="gac x <your message>"; "Commit Message"="fix: <your message>"} 
    )

    return $all_commands
}