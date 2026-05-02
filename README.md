# gh-fzf-get

Pick a GitHub repository with fzf and clone it with ghq.

## Installation

```sh
gh extension install ph0ryn/gh-fzf-get
```

## Usage

```sh
gh fzf-get [owner] [ghq get options]
```

If `owner` is omitted, the authenticated GitHub user is used.
Up to 100 repositories are fetched, ordered by recently updated.

```sh
gh-fzf-get
gh-fzf-get cli
gh-fzf-get ph0ryn --update
```

The selected repository is cloned via SSH:

```sh
ghq get git@github.com:OWNER/REPO.git
```

## Requirements

- [gh](https://cli.github.com/)
- [ghq](https://github.com/x-motemen/ghq)
- [fzf](https://github.com/junegunn/fzf)

## License

MIT
