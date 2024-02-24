# Tomodachi94's Dotfiles

These are my dotfiles. They are intended for my usage only.

Documentation for each individual piece of configuration is inside of its folder, either in the configuration itself or in a README.md in the directory root.

## Setting up
```sh
nix develop --impure .
just {nixos-x86_64,darwin-aarch64}
```

If you have `direnv`, you can skip the first part.

## Why so many folders and `default.nix`s?

I want to be able to disable specific components of my config by simply commenting out a line in a list. It's probably excessive, but in my opinion this is the best solution for me.
