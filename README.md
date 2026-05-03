# gh-fzf-get

Pick a GitHub repository with fzf and clone it with ghq.

<img width="498" height="295" alt="image" src="https://github.com/user-attachments/assets/b9fd0222-0b69-436f-8dde-0f1d8866ce34" />

## Installation

### Using gh

```sh
gh extension install ph0ryn/gh-fzf-get
```

### Using nix

Add the overlay setting in `flake.nix`

```nix
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    gh-fzf-get = {
      url = "github:ph0ryn/gh-fzf-get";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { gh-fzf-get, ... }: {
    nixpkgs.overlays = [
      gh-fzf-get.overlays.default
    ];
  };
}
```

Then add extension in `gh` config

```nix
{ pkgs, ... }:
{
  programs.gh = {
    enable = true;
    extensions = [
      pkgs.gh-fzf-get
    ];
  };
}
```

## Usage

```sh
gh fzf-get [owner] [ghq get options]
```

If `owner` is omitted, the authenticated GitHub user is used.
Up to 100 repositories are fetched, ordered by recently updated.

```sh
gh fzf-get
gh fzf-get cli
gh fzf-get ph0ryn --update
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
