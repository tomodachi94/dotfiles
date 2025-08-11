# Tomodachi94's Dotfiles

These are my dotfiles. They are intended for my usage only, but feel free to take inspiration.

**These dotfiles may not always reflect best practice.**

Documentation for each individual piece of configuration is inside of its folder, either in the configuration itself or in a README.md in the directory root.

## Setting up

```sh
git clone https://github.com/tomodachi94/dotfiles $HOME/dotfiles --filter=blob:none
nix develop --impure .
just build
```

If you have `direnv`, you can skip the first part.

The repository MUST be cloned to `~/dotfiles`, as there is one `mkOutOfStoreSymlink` call that expects it to be at this path.

## Developing

The first time you enter this repository, run `direnv allow`, then `just develop` (for now, only configures Git for this repo).

## Why so many folders and `default.nix`s?

I want to be able to disable specific components of my config by simply commenting out a line in a list. It's probably excessive, but in my opinion this is the best solution for me.
