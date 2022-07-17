# My Neovim Config

## Install

just clone it:

### Windows with CMD:

```batch
cd /d %LOCALAPPDATA%
git clone https://github.com/laxtiz/nvim.git nvim
```

### Windows with PowerShell[Core]:

```powershell
cd $env:LOCALAPPDATA
git clone https://github.com/laxtiz/nvim.git nvim
```

### Unix with Bash:

```bash
cd ~/.config
git clone https://github.com/laxtiz/nvim.git nvim
```

## Sync plugins

Plugin manager `packer.nvim` with auto install and sync other plugins when first launch vim with my config.

By the way. you can manual sync plugins with vim command `:PackerSync`

## About performance

review startup-time with command `:StarupTime`.

review plugins-loaded with command `:PackerProfile`.
