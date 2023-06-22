# zsh configuration

My Zsh configuration.

It should:
- Be fast. No slow shell frameworks.
- Gracefully degrade. For example, when aliasing `ls` and if `exa` cannot be found, it should alias to `ls` with the `--color` argument.

## Organization

When bootstrapping, `init.zsh` is symlinked to `~/.zshrc`. The `init.zsh` file should source other configuration files while not doing much itself.


