
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
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F41B) + " BUG FIX"; Command="b"}
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F4E6) + " CHORE"; Command="c"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F4D6) + " DOCS"; Command="d"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x2705) + " FEAT"; Command="f"} 	
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F680) + " NEW RELEASE"; Command="n"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F44C) + " IMPROVE"; Command="i"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x2699) + " REFACTOR"; Command="r"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F3A8) + " STYLE"; Command="s"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F9EA) + " TEST"; Command="t"} 
        @{"Commit Message"=[char]::ConvertFromUtf32(0x1F6E0) + " WORKING ON"; Command="w"} 
    )

    return $all_commands
}