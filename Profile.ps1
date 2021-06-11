
function gac {
    if($args.length -eq 0 -or $args[0] -eq "--help" -or $args[0] -eq "-h") {
        PrintGacHelp |
            ForEach-Object {[PSCustomObject]$_} | 
            Format-Table -Property @{ e="Command"; width = 30 }, "Commit Message"
        return $null;
    }

    $commit_msg = switch ($args[0]) {
        "b" { [char]::ConvertFromUtf32(0x1F41B) + " BUG FIX: " + $args[1..($args.length-1)] }
        "c" { [char]::ConvertFromUtf32(0x1F4E6) + " CHORE: " + $args[1..($args.length-1)] }
        "d" { [char]::ConvertFromUtf32(0x1F4D6) + " DOCS: " + $args[1..($args.length-1)] }
        "f" { [char]::ConvertFromUtf32(0x2705) + " FEAT: " + $args[1..($args.length-1)] }
        "n" { [char]::ConvertFromUtf32(0x1F680) + " NEW RELEASE: " + $args[1..($args.length-1)] }
        "i" { [char]::ConvertFromUtf32(0x1F44C) + " IMPROVE: " + $args[1..($args.length-1)] }
        "r" { [char]::ConvertFromUtf32(0x2699) + " REFACTOR: " + $args[1..($args.length-1)] }
        "s" { [char]::ConvertFromUtf32(0x1F3A8) + " STYLE: " + $args[1..($args.length-1)] }
        "t" { [char]::ConvertFromUtf32(0x1F9EA) + " TEST: " + $args[1..($args.length-1)] }
        "w" { [char]::ConvertFromUtf32(0x1F6E0) + " WORKING ON: " + $args[1..($args.length-1)] }
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
        @{Command="gac b <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F41B) + " BUG FIX: <your message>"}
        @{Command="gac c <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F4E6) + " CHORE: <your message>"} 
        @{Command="gac d <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F4D6) + " DOCS: <your message>"} 
        @{Command="gac f <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x2705) + " FEAT: <your message>"} 	
        @{Command="gac n <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F680) + " NEW RELEASE: <your message>"} 
        @{Command="gac i <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F44C) + " IMPROVE: <your message>"} 
        @{Command="gac r <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x2699) + " REFACTOR: <your message>"} 
        @{Command="gac s <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F3A8) + " STYLE: <your message>"} 
        @{Command="gac t <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F9EA) + " TEST: <your message>"} 
        @{Command="gac w <your message>"; "Commit Message"=[char]::ConvertFromUtf32(0x1F6E0) + " WORKING ON: <your message>"} 
    )

    return $all_commands
}