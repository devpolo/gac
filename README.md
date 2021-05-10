<h1 align="center"><img src="https://github.com/devpolo/gac/blob/01c3982b752f7acbd0508cf424e53912cfd2a01b/static/gac.svg" alt="ORY Keto - Open Source & Cloud Native Access Control Server"></h1>

# Faster and formated git commits

A customizable bash function to faster and format your `git commit -am "message"` command.

## Install

1. Open and past the entire [`gac.sh`](https://github.com/devpolo/gac/blob/master/gac.sh) file content at the end of your `~/.zshrc` file.
2. restart your terminal.
3. Enjoy faster and formated git add and git commit actions.

**Disclaimer:** tested on macOS only.

## Exemple

```bash
gac d edit readme file

# is equal to:
git add -A
git commit -m "📖 DOC: edit readme file"
```

## Available commands

```bash
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
```

## Thanks

[Inspirerd by Lenar Hoyt stackoverflow post](https://stackoverflow.com/a/45612441/11692562)

[Graphical charter inspired by Ory](https://github.com/ory)

[Header icon licence](https://icons8.com/license)
