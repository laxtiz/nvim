# My Neovim Config

## Install

just clone it:

### Windows with CMD:

```batch
cd /d %LOCALAPPDATA%
del /s /q nvim
git clone https://github.com/laxtiz/nvim.git nvim
```

### Windows with PowerShell[Core]:

```powershell
cd $env:LOCALAPPDATA
Remove-Item -Recurse -Force nvim
git clone https://github.com/laxtiz/nvim.git nvim
```

### Unix with Bash:

```bash
cd ~/.config
rm -rf nvim
git clone https://github.com/laxtiz/nvim.git nvim
```

## About plugins

Plugin manager `packer.nvim` will auto install and sync other plugins when first launch vim with my config.

By the way. you can manual sync plugins with vim command `:PackerSync`

### TreeSitter

I use [tree-sitter](https://github.com/tree-sitter/tree-sitter) render syntax highlight, so you need any **C Compiler**, like gcc/vc/clang/zig.

Besure you have any of these compilers, then run command `:TSInstall all` in nvim.

### Language Server Protocol

Neovim provides an [LSP client](https://neovim.io/doc/user/lsp.html), but the servers are provided by third parties.

I use [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) and [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) to configure [LSP servers](https://microsoft.github.io/language-server-protocol/implementors/servers/).

use [mason.nvim](https://github.com/williamboman/mason.nvim) install LSP servers. Run `:Mason` open mason user-interface, then install any you wanted.

## About performance

review startup-time with command `:StarupTime`.
