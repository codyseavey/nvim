# Neovim Configuration

## Overview

Personal Neovim configuration based on kickstart.nvim, modularized into a `lua/config/` (options, keymaps, autocmds) and `lua/plugins/` (one file per plugin) structure.

## Architecture

- `init.lua` is the entry point: sets leader key, loads config modules, bootstraps lazy.nvim, then auto-discovers all plugin specs from `lua/plugins/`.
- Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim) with auto-discovery via `require('lazy').setup('plugins', ...)`.
- LSP servers are managed by Mason and configured in `lua/plugins/lsp.lua`.
- Completion is provided by blink.cmp (not nvim-cmp).
- Formatting is handled by conform.nvim with LSP fallback.
- Linting is handled by nvim-lint (separate from LSP diagnostics).

## Key Conventions

- All plugin specs live in `lua/plugins/` as individual files returning a table (or list of tables).
- Lua code is formatted with stylua (config in `.stylua.toml`): 160 column width, 2-space indent, single quotes.
- Go files get special treatment: organizeImports + format on save via a `BufWritePre` autocmd in `lua/plugins/lsp.lua`.
- Nerd Font icons are enabled (`vim.g.have_nerd_font = true`).

## Adding a New Plugin

Create a new file in `lua/plugins/` returning a lazy.nvim plugin spec. It will be auto-discovered on next launch.

## Testing Changes

There is no test suite. Verify changes by running:

```sh
nvim --headless -c "lua vim.defer_fn(function() print('OK'); vim.cmd('q') end, 5000)" 2>&1
```

This confirms the config loads without errors.

## Linting

```sh
stylua --check .
```

Mason installs stylua automatically. It is also available at `~/.local/share/nvim/mason/bin/stylua`.

## CI

GitHub Actions runs stylua formatting checks on push to master and on pull requests (`.github/workflows/stylua.yml`).
