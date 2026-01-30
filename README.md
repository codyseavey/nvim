# nvim

Personal Neovim configuration, forked from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and modularized.

## Structure

```
init.lua                  -- Entry point: leader key, lazy.nvim bootstrap
lua/
  config/
    options.lua           -- vim.opt settings
    keymaps.lua           -- Base keymaps
    autocmds.lua          -- Autocommands
  plugins/
    blink-cmp.lua         -- Completion (blink.cmp)
    colorscheme.lua       -- github_dark_default theme
    conform.lua           -- Format on save
    copilot.lua           -- GitHub Copilot inline suggestions
    debug.lua             -- DAP (delve for Go)
    gitsigns.lua          -- Git gutter + hunk keymaps
    indent-line.lua       -- Indentation guides
    lint.lua              -- nvim-lint (ruff, shellcheck, tflint, markdownlint)
    lsp.lua               -- LSP config + Mason
    mini.lua              -- mini.ai, mini.surround, mini.pairs, mini.statusline
    neo-tree.lua          -- File explorer
    persistence.lua       -- Session management
    sleuth.lua            -- Auto-detect indentation
    smart-open.lua        -- Frecency file finder
    telescope.lua         -- Fuzzy finder
    todo-comments.lua     -- Highlight TODO/FIXME/etc
    toggleterm.lua        -- Terminal integration + lazygit
    treesitter.lua        -- Syntax highlighting
    which-key.lua         -- Keymap hints
```

## Requirements

- Neovim >= 0.11
- git, make, gcc
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- A [Nerd Font](https://www.nerdfonts.com/) installed and selected in the terminal
- sqlite3 dev library (`sqlite-devel` on Fedora, `libsqlite3-dev` on Debian/Ubuntu)
- Node.js (for some LSP servers)
- Go (for gopls and delve)
- Python 3 (for pyright)

### Optional

- [lazygit](https://github.com/jesseduffield/lazygit) for `<leader>tg` terminal integration
- ruff (`pip install ruff`) for Python linting
- tflint for Terraform linting

## LSP Servers

Managed via Mason, auto-installed on first launch:

- `gopls` (Go, with gofumpt and staticcheck)
- `pyright` (Python)
- `lua_ls` (Lua)
- `bashls` (Bash)
- `terraformls` (Terraform)
- `powershell_es` (PowerShell)

## Key Bindings

Leader key: `Space`

| Key | Action |
|---|---|
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep |
| `<leader>so` | Smart open (frecency) |
| `<leader><leader>` | Find buffers |
| `<leader>ca` | Code action |
| `<leader>rn` | Rename symbol |
| `gd` / `gr` / `gI` | Go to definition / references / implementation |
| `<leader>f` | Format buffer |
| `<leader>b` | Toggle breakpoint |
| `<F5>` | Start/continue debug |
| `<C-\>` | Toggle terminal |
| `<leader>tg` | Toggle lazygit |
| `<leader>qs` | Restore session |
| `\\` | Toggle Neo-tree |

See `<leader>sk` to search all keymaps.

## Installation

```sh
git clone git@github.com:codyseavey/nvim.git ~/.config/nvim
nvim
```

Lazy.nvim will install all plugins on first launch. Mason will install LSP servers and tools automatically.

## CI

Stylua formatting is checked on pull requests via GitHub Actions.
