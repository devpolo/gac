<h1 align="center"><img src="static/gac.svg" alt="ORY Keto - Open Source & Cloud Native Access Control Server"></h1>

# format and faster your git commit

A customizable bash function to **format** and **faster** your `git commit -am "message"` command.

## Contributions

1. Give this project a ⭐️
2. Pull requests and issues are most welcome

## Quickstart

### macOS

1. You need a `~/.zshrc` file.
2. Open it: `vim ~/.zshrc` or create it: `touch ~/.zshrc && vim ~/.zshrc`.
3. Past the entire [`gac.sh`](gac.sh) file (or a [variant](variant)) at the end of your `~/.zshrc` file.
4. Restart your terminal.
5. Enjoy faster and formatted `git add` and `git commit` actions.

### Linux / Windows

⚠️ tested on macOS only. **Pull requests are welcome**.

## Exemple

```bash
gac d improve readme

# equals to:
git add -A
git commit -m "📖 DOC: improve readme"
```

## Available commands

```bash
gac
# 🔧 REFACTOR: no comments

gac d <your message>
# 📖 DOC: <your message>

gac f <your message>
# 🐛 FIX: <your message>

gac i <your message>
# 👌 IMPROVE: <your message>

gac n <your message>
# ✅ NEW FEAT: <your message>

gac r <your message>
# 🚀 RELEASE: <your message>

gac t <your message>
# 🧪 TEST: <your message>

gac <your message>
# <your message>

gac -h # or --help
# print all available semantics
```

## Thanks

[Inspirerd by Lenar Hoyt's stackoverflow post](https://stackoverflow.com/a/45612441/11692562)

[How to Open Source Like a Pro, Ben Awad's video](https://youtu.be/MT6M_sqAuZo?t=467)

[Graphical charter inspired by Ory](https://github.com/ory)

[Header icon licence](https://icons8.com/license)

<!-- GitHub About Description
One simple command to format and faster your git add and git commit actions.
-->
