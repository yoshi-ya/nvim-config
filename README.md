# nvim-config

Yoshi's Neovim configuration, built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- [Neovim](https://neovim.io/) ≥ 0.10
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons)

## Installation

> **Back up your existing config first:**
> ```sh
> mv ~/.config/nvim ~/.config/nvim.bak
> ```

Clone this repo wherever you like, then symlink it:

```sh
git clone https://github.com/yoshi-ya/nvim-config ~/Projects/nvim-config
ln -s ~/Projects/nvim-config ~/.config/nvim
```

Launch Neovim — lazy.nvim will auto-install on first startup:

```sh
nvim
```

LSP servers, formatters, and linters are managed by [Mason](https://github.com/mason-org/mason.nvim) and will be installed automatically.

## Adding LSP Servers

To permanently add an LSP server, add its name to the `ensure_installed` list in `lua/plugins/lspconfig.lua`. Mason will install it on next startup and enable it automatically.

```lua
ensure_installed = {
  "lua_ls",
  "your_new_server", -- add here
  ...
}
```

Browse available server names at [mason-registry.dev](https://mason-registry.dev/registry/list) or interactively with `:Mason` inside Neovim.

## Keymaps

Leader key: `<Space>`

### Navigation

| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / previous buffer |
| `<leader>bd` | Close buffer |
| `<leader>sv` | Split window vertically |
| `<leader>sh` | Split window horizontally |
| `<leader>1` | Toggle file tree |
| `<leader>e` | Reveal current file in tree |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader><leader>` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Help tags |

### LSP

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `<leader>gd` | Go to definition |
| `<leader>gD` | Go to declaration |
| `<leader>gr` | Find references |
| `<leader>im` | Go to implementation |
| `<leader>ca` | Code action |
| `<leader>co` | Organize imports |
| `<leader>cr` | Rename symbol |
| `<leader>cf` | Format file / selection |
| `<leader>cl` | Trigger linting |
| `<leader>lf` | LSP format |

### Diagnostics

| Key | Action |
|-----|--------|
| `<leader>dn` / `<leader>dp` | Next / previous diagnostic |
| `<leader>de` | Show diagnostic float |
| `<leader>ds` | Workspace diagnostics (Telescope) |
| `<leader>xx` | Workspace diagnostics (Trouble) |
| `<leader>xb` | Buffer diagnostics (Trouble) |
| `<leader>xs` | Symbols (Trouble) |

### Git (Gitsigns)

| Key | Action |
|-----|--------|
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |
| `<leader>hn` / `<leader>hN` | Next / previous hunk |

### Testing (vim-test)

| Key | Action |
|-----|--------|
| `<leader>tn` | Test nearest |
| `<leader>tf` | Test file |
| `<leader>ta` | Test suite |
| `<leader>tl` | Test last |

### Misc

| Key | Action |
|-----|--------|
| `<leader>y` | Copy selection to system clipboard |
