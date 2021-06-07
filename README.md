<h1 align="center"><img src="static/gac.svg" alt="ORY Keto - Open Source & Cloud Native Access Control Server"></h1>

# Format and faster your git commit

A customizable bash function to **format** and **faster** your `git commit -am "message"` command.

## Exemple

```bash
gac n final version

# equals to:
git add -A
git commit -m "🚀 NEW RELEASE: final version"
```

## Contributions

1. Give this project a ⭐️
2. Pull requests and issues are most welcome

## Quickstart

### macOS

1. You need a `~/.zshrc` file
2. Open or create it: `vim ~/.zshrc`
3. Enter insert mode: `i`
4. Past the entire [`gac.sh`](gac.sh) file (or a [variant](variant)) at the end of your `~/.zshrc` file
5. Exit vim: `:wq`
6. Restart your terminal
7. Enjoy faster and formatted `git add` and `git commit` actions

### Linux

Work the same as [macOS](#macos). Use `~/.profile` file instead.

### Windows

⚠️ Not tested on Windows yet but should work the same as [Linux](#linux) if you are using Git Bash. **Pull requests are welcome**.

## Available commands

```bash
gac # or -h or --help
# print all available semantics

gac b <your message>
# 🐛 BUG FIX: <your message>

gac c <your message>
# 📦 CHORE: <your message>

gac d <your message>
# 📖 DOCS: <your message>

gac f <your message>
# ➕ FEAT: <your message>

gac n <your message>
# 🚀 NEW RELEASE: <your message>

gac i <your message>
# 👌 IMPROVE: <your message>

gac r <your message>
# 🪚 REFACTOR: <your message>

gac s <your message>
# 🎨 STYLE: <your message>

gac t <your message>
# 🧪 TEST: <your message>

gac w <your message>
# 🛠 WORKING ON: <your message>

gac <your message>
# <your message>
```

## Thanks

[Inspirerd by Lenar Hoyt's stackoverflow post](https://stackoverflow.com/a/45612441/11692562)

[Inspirerd by the the Angular convention](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#type)

[How to Open Source Like a Pro, Ben Awad's video](https://youtu.be/MT6M_sqAuZo?t=467)

[Graphical charter inspired by Ory](https://github.com/ory)

[Header icon licence](https://icons8.com/license)

<!-- GitHub About Description
One simple command to format and faster your git add and git commit actions.
-->
