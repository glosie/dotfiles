# dotfiles

My global [mise](https://mise.jdx.dev) config. This repo is checked out at `~/.config/mise`. Its `config.toml` declares the tools, Homebrew/apt packages, login shell, and dotfiles for a machine, and `mise bootstrap` applies all of it.

## New machine

```sh
curl https://mise.run | sh
~/.local/bin/mise bootstrap --adopt glosie/dotfiles --prompt-vars
```

`--adopt` clones this repo into `~/.config/mise`. `--prompt-vars` asks for `machine_class` (`work` or `personal`), which mise saves for that machine. Preview first with `--dry-run`.

Bootstrap installs Homebrew on macOS if it is missing, installs the packages in `[bootstrap.packages]` (Homebrew on macOS, apt on Linux), links and renders the dotfiles, sets fish as the login shell, installs fisher and its plugins, updates vim plugins, and installs the tools in `[tools]`.

## Layout

| Path | What it holds |
|---|---|
| `config.toml` | Tools, settings, dotfile entries, and bootstrap config |
| `home/` | Files symlinked into `$HOME`; `dot-` in a name becomes `.` |
| `templates/` | Files rendered per machine (`.gitconfig.local`, `.gitconfig.platform`, `~/.config/jj/config.toml`) |

Files under `home/` are symlinks, so editing `~/.gitconfig` edits the repo. `~/.config/nvim` is linked as a whole directory so lazy.nvim can update `lazy-lock.json` in place.

Templated files are regular files. Edit the template, not the rendered copy, because `mise dot apply` overwrites the rendered copy:

```sh
mise dot edit ~/.config/jj/config.toml
mise dot apply
```

## Day to day

```sh
mise dot status                       # what is out of date
mise dot add --group home <path>      # start managing a file under home/
mise dot apply                        # link and render everything
mise bootstrap plan                   # what bootstrap would change
mise vars machine_class=personal      # change this machine's class
```

Commit and push changes with jj or git as usual.

## Machine class

`machine_class` selects the identity in `.gitconfig.local` and the jj config. On `work`, git includes `~/.gitconfig.personal` and `~/.gitconfig.work`, and jj uses the work email for repositories under `~/Code`. Both `.gitconfig.personal` and `.gitconfig.work` are local and not in this repo.

## Local only

Some files stay out of the repo on purpose: fish's `fish_variables`, plugin files that fisher installs, `conf.d/pco-box.fish` and the function it calls, jj's `repos/` and `workspaces/` state, and Zed's prompts database.

## Limits

- `conf.d/00-homebrew.fish` assumes Homebrew is at `/opt/homebrew`.
- On Linux, `apt:postgresql` installs the release's default PostgreSQL, which may not be 18.
