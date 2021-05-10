<h1 align="center"><img src="static/gac.svg" alt="ORY Keto - Open Source & Cloud Native Access Control Server"></h1>

# Faster and formatted git commits

A customizable bash function to **format** and **faster** your `git commit -am "message"` command.

## Contributions

1. Give this project a ⭐️
2. Pull requests and issues are most welcome

## Quickstart

1. Open and past the entire [`gac.sh`](https://github.com/devpolo/gac/blob/master/gac.sh) file (or a [variant](https://github.com/devpolo/gac/tree/master/variant)) at the end of your `~/.zshrc` file.
2. Restart your terminal.
3. Enjoy faster and formatted `git add` and `git commit` actions.

⚠️ **Disclaimer:** tested on macOS only.

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
