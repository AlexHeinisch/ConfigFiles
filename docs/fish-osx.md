# OSX Fish Shell Setup

## Install Fish Shell

```
brew install fish
```

## Install Utility Libraries

A nerdfont is needed to display all the icons and symbols used:
```
brew tap homebrew/cask-fonts && brew install --cask font-meslo-lg-nerd-font
```

Peco is used for quick directory switching and a better command history:
```
brew install peco exa
```

A plugin manager used to install fish-plugins very easily:
```
brew install fish fisher
```

## Install Fish Plugins With Fisher:

```
fisher install jethrokuan/z
fisher install IlanCosman/tide@v5
fisher install jorgebucaran/nvm.fish
```

Go through the basic design configuration and afterwards modify the contents of the two bars:

```
set -u tide_right_prompt_items virtual_env
set -u tide_left_prompt_items os pwd git
```

## Copy Fish Config Files

You are now ready to go, simply copy the config files from the '.fish' folder into your local
config folder (typically at '~/.config/fish')
