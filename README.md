# dotfiles-bootstrap

One-command setup for `psauvage0`'s workstation. Public on purpose: it holds no
secrets, only the glue that installs `chezmoi` + `gh`, authenticates, and
applies the private [`dotfiles`](https://github.com/psauvage0/dotfiles) repo.

## Usage

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/psauvage0/dotfiles-bootstrap/main/bootstrap.sh)"
```

Expected: browser opens for GitHub device login, then packages, configs, VS Code
extensions, and flatpaks install automatically. Log out and back in once to pick
up fish as the login shell.
