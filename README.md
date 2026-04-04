# Neovim Configuration with LazyVim

A modern, feature-rich Neovim configuration built on top of [LazyVim](https://www.lazyvim.org), enhanced with additional plugins, language supports, AI integration, and a sleek UI.

## Features

- **LazyVim Base**: A stable, well-documented Neovim configuration framework.
- **Language Support**: Enhanced support for TypeScript, JavaScript, Go, Tailwind CSS, Vue, SQL, Prisma, TOML, YAML, CMake, Markdown, and more.
- **AI Integration**: [Avante.nvim](https://github.com/yetone/avante.nvim) with DeepSeek Reasoner model for AI‑powered coding assistance.
- **Beautiful UI**: Transparent Tokyonight storm colorscheme, dashboard, bufferline, incline, lualine, and Zen mode.
- **Productivity Plugins**: Incremental rename, refactoring tools, symbols outline, dial.nvim for increment/decrement, and more.
- **Advanced Navigation**: Telescope with file browser, live grep, buffers, and custom keymaps.
- **Git Integration**: Git.nvim, gitsigns, git‑conflict, and blame support.
- **LSP & Formatting**: Mason‑managed LSP servers, ESLint, Prettier, and language‑specific settings.
- **Discipline Mode**: Prevents excessive key‑pressing with a friendly cowboy warning.

## Installation

### Prerequisites

- Neovim ≥ 0.9.0
- Git
- A Nerd Font (for icons in the UI)

### Steps

1. **Backup your existing Neovim configuration** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.bak
   ```

2. **Clone this repository**:

   ```bash
   git clone https://github.com/smile-ko/nvim-config ~/.config/nvim
   ```

3. **Start Neovim**:

   ```bash
   nvim
   ```

   Lazy.nvim will automatically bootstrap itself and install all plugins.

4. **Wait for the installation to finish**. The first launch may take a few minutes.

## Structure

```
~/.config/nvim/
├── init.lua              # Entry point, loads config.lazy
├── lazy-lock.json        # Plugin versions lockfile
├── lazyvim.json          # LazyVim metadata
├── stylua.toml           # Lua formatter configuration
├── lua/
│   ├── config/           # Core configuration
│   │   ├── lazy.lua      # Lazy.nvim setup with extras
│   │   ├── options.lua   # Neovim options
│   │   ├── keymaps.lua   # Custom key mappings
│   │   └── autocmds.lua  # Auto‑commands
│   ├── plugins/          # Custom plugin specifications
│   │   ├── colorscheme.lua
│   │   ├── coding.lua
│   │   ├── editor.lua
│   │   └── ui.lua
│   └── utils/            # Utility modules
│       ├── discipline.lua
│       └── debug.lua
```

## Plugin Highlights

### Colorscheme

- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** – Storm style with transparent background.

### Coding

- **[inc‑rename.nvim](https://github.com/smjonas/inc-rename.nvim)** – Incremental rename.
- **[refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)** – Refactoring tools.
- **[mini.bracketed](https://github.com/nvim-mini/mini.bracketed)** – Navigate brackets, files, etc.
- **[dial.nvim](https://github.com/monaqa/dial.nvim)** – Increment/decrement numbers, dates, booleans.
- **[symbols‑outline.nvim](https://github.com/simrat39/symbols-outline.nvim)** – Code symbols sidebar.
- **[Mason](https://github.com/williamboman/mason.nvim)** – Install LSP servers, linters, formatters.
- **[nvim‑lspconfig](https://github.com/neovim/nvim-lspconfig)** – LSP configuration with custom settings for Tailwind, TypeScript, Lua, etc.
- **[nvim‑treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** – Syntax highlighting and more.
- **[blink.cmp](https://github.com/saghen/blink.cmp)** – Enhanced completion menu.
- **[avante.nvim](https://github.com/yetone/avante.nvim)** – AI coding assistant (DeepSeek).

### Editor

- **[mini.hipatterns](https://github.com/nvim-mini/mini.hipatterns)** – Highlight patterns (e.g., HSL colors).
- **[git.nvim](https://github.com/dinhhuy258/git.nvim)** – Git commands.
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** – Fuzzy finder with file browser.
- **[which‑key.nvim](https://github.com/folke/which-key.nvim)** – Key‑binding hints.
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** – Git signs in the gutter.
- **[git‑conflict.nvim](https://github.com/akinsho/git-conflict.nvim)** – Visualize and resolve merge conflicts.

### UI

- **[noice.nvim](https://github.com/folke/noice.nvim)** – Improved messages, cmdline, and popupmenu.
- **[nvim‑notify](https://github.com/rcarriga/nvim-notify)** – Pretty notifications.
- **[snacks.nvim](https://github.com/snacks.nvim/snacks.nvim)** – Dashboard with custom header.
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** – Tab‑like buffer line.
- **[incline.nvim](https://github.com/b0o/incline.nvim)** – Current buffer name in the statusline.
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** – Status line.
- **[zen‑mode.nvim](https://github.com/folke/zen-mode.nvim)** – Distraction‑free writing.

## Key Mappings

### Leader Key

The leader is `<Space>`.

### General

| Key                    | Action                            |
| ---------------------- | --------------------------------- |
| `<Leader>p`            | Paste from register 0             |
| `<Leader>P`            | Paste from register 0 (before)    |
| `<Leader>c`            | Change without affecting register |
| `<Leader>d`            | Delete without affecting register |
| `dw`                   | Delete word backwards             |
| `te`                   | New tab                           |
| `<Tab>`                | Next tab                          |
| `<S‑Tab>`              | Previous tab                      |
| `ss`                   | Split horizontally                |
| `sv`                   | Split vertically                  |
| `sh`, `sk`, `sj`, `sl` | Move between windows              |
| `<C‑w> arrow`          | Resize window                     |
| `<A‑j>` / `<A‑k>`      | Move line/block down/up           |

### Telescope

| Key  | Action                                   |
| ---- | ---------------------------------------- |
| `;f` | Find files (respects .gitignore)         |
| `;r` | Live grep (hidden files included)        |
| `\\` | List open buffers                        |
| `;t` | Help tags                                |
| `;e` | Diagnostics                              |
| `;s` | Treesitter symbols                       |
| `sf` | File browser in current buffer directory |
| `;;` | Resume last picker                       |

### Git

| Key          | Action            |
| ------------ | ----------------- |
| `<Leader>gb` | Open blame window |
| `<Leader>go` | Browse repository |

### LSP

| Key  | Action                      |
| ---- | --------------------------- |
| `gd` | Goto definition (telescope) |

### AI

Avante.nvim is configured with DeepSeek Reasoner. Use the Avante commands to interact with the AI assistant.

## Configuration

### Adding a New Plugin

1. Create or edit a file under `lua/plugins/` (e.g., `lua/plugins/myplugin.lua`).
2. Return a plugin spec table (see existing files for examples).
3. The plugin will be automatically loaded on the next Neovim start.

### Changing Colorscheme

Edit `lua/plugins/colorscheme.lua` and modify the `tokyonight.nvim` options.

### Adding LSP Server

Add the server to the Mason ensure_installed list in `lua/plugins/coding.lua` and configure it in the `servers` table of `nvim-lspconfig`.

## Extras

This configuration imports several LazyVim extras:

- **Formatting**: Prettier, ESLint
- **Languages**: TypeScript, JSON, Markdown, Go, Tailwind CSS, Vue, SQL, Prisma, TOML, YAML, CMake
- **AI**: Copilot, Avante
- **Coding**: Neogen
- **Utils**: Mini‑hipatterns

You can disable an extra by removing its import line in `lua/config/lazy.lua`.

## Troubleshooting

- **Slow startup**: Ensure you have a stable internet connection for the first plugin installation.
- **Missing LSP servers**: Run `:Mason` and install the required servers.
- **Plugin errors**: Check `:Lazy` for any failed installations or updates.
- **Keymaps not working**: Verify your leader key (`<Space>`) and check `:WhichKey` for available mappings.

## License

MIT
