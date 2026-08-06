# nvim-config

Yoshi's Neovim configuration, built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- [Neovim](https://neovim.io/) ≥ 0.12
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

## Layout

```
lua/config/     options, global keymaps, lazy.nvim bootstrap
lua/plugins/    one file per plugin spec
lua/lsp/        LSP setup: server list, diagnostics, keymaps, Java helpers
after/lsp/      per-server overrides, auto-merged by Neovim
```

## Adding LSP Servers

Add the server name to `lua/lsp/servers.lua`. Mason installs it on next startup and Neovim enables it automatically.

```lua
return {
  "lua_ls",
  "your_new_server", -- add here
  ...
}
```

Browse available server names at [mason-registry.dev](https://mason-registry.dev/registry/list) or interactively with `:Mason` inside Neovim.

To customize a server, create `after/lsp/<server>.lua` returning a config table — see `after/lsp/jdtls.lua`.

## Java

Java projects that ship an IntelliJ-exported `.idea/eclipse-java-formatter.xml` are formatted with that profile automatically. The JDK comes from `$JAVA_HOME`.

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
| `<leader>nf` / `<leader>Nf` | Next / previous function |
| `<leader>nc` / `<leader>Nc` | Next / previous class |

### Search (Telescope)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader><leader>` | Live grep |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Help tags |
| `<leader>fd` | Workspace diagnostics |

### LSP

| Key | Action |
|-----|--------|
| `K` | Hover documentation |
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gR` | Find references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `<leader>ca` | Code action |
| `<leader>co` | Organize imports |
| `<leader>rn` | Rename symbol |
| `<leader>rs` | Restart LSP |
| `<leader>cf` | Format file / selection |
| `<leader>cl` | Trigger linting |

### Diagnostics

| Key | Action |
|-----|--------|
| `<leader>nd` / `<leader>Nd` | Next / previous diagnostic |
| `<leader>d` | Show line diagnostics |
| `<leader>D` | Buffer diagnostics (Telescope) |
| `<leader>xx` | Workspace diagnostics (Trouble) |
| `<leader>xb` | Buffer diagnostics (Trouble) |
| `<leader>xs` | Symbols (Trouble) |

### Git (Gitsigns)

| Key | Action |
|-----|--------|
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hR` | Reset buffer |
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
