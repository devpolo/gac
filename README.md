![format and faster your commits](static/gac.svg "format and faster your commits")

# Format and faster your git commit

A customizable bash function to **format** and **faster** your `git add -A && git commit -m "message"` command.

## Example

```bash
gac f call to action button

# equals to:
git add -A
git commit -m "feat: call to action button"
```

## Contributions

1. Give this project a ⭐️
2. Pull requests and issues are most welcome

## Quickstart

### macOS

1. You need a `~/.zshrc` file
2. Open or create it: `vim ~/.zshrc`
3. Enter insert mode: `i`
4. Past the entire [`gac.sh`](gac.sh) file (or a [variant](variant/shell)) at the end of your `~/.zshrc` file
5. Exit vim: `:wq`
6. Restart your terminal
7. Enjoy faster and formatted `git add` and `git commit` actions

### Linux

Work the same as [macOS](#macos). Use `~/.profile` file instead.

### Windows (only in Powershell)

1. Run your PowerShell as administrator
2. Give access to external script: `Set-ExecutionPolicy Unrestricted`
3. Go to Powershell Home Directory `cd $PSHOME` or `cd C:\Windows\System32\WindowsPowerShell\v1.0`
4. Open explorer in $PSHOME `start .`
5. Copy `Profile.ps1` file (or a [variant](variant/powershell)) or paste the `Profile.ps1` contents if it already exists.

## Available commands

```bash
gac
# print available semantics

gac c <your message>
# git add -A && git commit -m "chore: <your message>"

gac d <your message>
# git add -A && git commit -m "docs: <your message>"

gac f <your message>
# git add -A && git commit -m "feat: <your message>"

gac r <your message>
# git add -A && git commit -m "refactor: <your message>"

gac s <your message>
# git add -A && git commit -m "style: <your message>"

gac t <your message>
# git add -A && git commit -m "test: <your message>"

gac x <your message>
# git add -A && git commit -m "fix: <your message>"

gac <your message>
# git add -A && git commit -m "<your message>"
```

## Thanks

[Inspired by Lenar Hoyt's stackoverflow post](https://stackoverflow.com/a/45612441/11692562)

[Inspired by the Angular convention](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#type)

[Graphical charter inspired by Ory](https://github.com/ory)
