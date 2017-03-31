# Symfony2/3 console completion for Zsh

This is an [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) plugin for the Symfony Console component.

Autocompletions available for given prefixes:
* `app/console`
* `bin/console`
* `sf`
* `sfdev`
* `sfx`
* `sfxdev`

# Installation

## Antigen

Edit `~/.zshrc` and add:

```
antigen bundle prgTW/symfony.plugin.zsh
```

## Oh My Zsh

```
cd ~/.oh-my-zsh/custom/plugins
git clone https://github.com/prgTW/symfony.plugin.zsh.git symfony
```

Edit `~/.zshrc` to enable the plugin:

```
plugins=(... symfony)
```
