# Neovim OSX Setup

## Prerequesites

- NodeJS (for language servers)
- Make and GCC / CLANG for telescope fzf
- fzf

## Install Neovim

```
brew install neovim
```

## Install Packer (Package Manager)

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Copy Config

I would recommend first copying all the configuration files from '.config/nvim/lua/alex' because if you copy everything at once, a lot of errors will pop up, because no plugin is installed yet. After copying the first batch, go into neovim and execute the command ':PackerInstall' to install all the required plugins.

When installing the plugins an error may occur if you don't have 'cmake' installed.

After installing the plugins copy the rest of the configurations files and nvim should now be setup fully.

## Keybinds

<coming soon>
