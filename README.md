<div align="center">

# NVIM CONFIG

LazyVim · Lua · LSP · Treesitter · Telescope

![Neovim](https://img.shields.io/badge/Neovim-57A143?style=for-the-badge&logo=neovim&logoColor=white)
![Lua](https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white)
![LazyVim](https://img.shields.io/badge/LazyVim-2E7DE9?style=for-the-badge&logo=neovim&logoColor=white)
![Treesitter](https://img.shields.io/badge/Treesitter-A6E22E?style=for-the-badge&logo=tree&logoColor=black)
![LSP](https://img.shields.io/badge/LSP-007ACC?style=for-the-badge&logo=visualstudio&logoColor=white)
![Telescope](https://img.shields.io/badge/Telescope-89B4FA?style=for-the-badge&logo=gnometerminal&logoColor=black)
![Mason](https://img.shields.io/badge/Mason-CBA6F7?style=for-the-badge&logo=homebrew&logoColor=black)
![Copilot](https://img.shields.io/badge/GitHub%20Copilot-000000?style=for-the-badge&logo=githubcopilot&logoColor=white)
![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=for-the-badge&logo=typescript&logoColor=white)
![Go](https://img.shields.io/badge/Go-00ADD8?style=for-the-badge&logo=go&logoColor=white)
![Vue](https://img.shields.io/badge/Vue-4FC08D?style=for-the-badge&logo=vuedotjs&logoColor=white)
![Tailwind](https://img.shields.io/badge/Tailwind-06B6D4?style=for-the-badge&logo=tailwindcss&logoColor=white)

</div>

A personal Neovim configuration built on [LazyVim](https://www.lazyvim.org), with extra language support, GitHub Copilot, a transparent Tokyonight UI, and a focused set of coding and navigation plugins.

### Features

- **Base**: LazyVim 8 + [lazy.nvim](https://github.com/folke/lazy.nvim), with bytecode loader enabled.
- **Languages**: TypeScript, JSON, Markdown, Go, Tailwind CSS, Vue, SQL, Prisma, YAML, CMake — plus Treesitter grammars for Astro, GraphQL, Svelte, and more.
- **AI**: GitHub Copilot via LazyVim extra (`lazyvim.plugins.extras.ai.copilot`).
- **UI**: Transparent Tokyonight Storm, Snacks dashboard, bufferline (tabs), incline filename, lualine, Noice, Zen Mode.
- **Coding**: Incremental rename, refactoring, dial.nvim, symbols outline, blink.cmp, Mason-managed tools.
- **Navigation**: Telescope + fzf-native + file browser, which-key, mini.bracketed.
- **Git**: git.nvim, gitsigns (inline blame), git-conflict.
- **Quality**: ESLint + Prettier extras, Stylua, Selene, ShellCheck, shfmt.

---

### 1. Prerequisites

| Requirement     | Version / notes                                      |
| --------------- | ---------------------------------------------------- |
| **Neovim**      | `>= 0.9.0` (0.10+ recommended)                       |
| **Git**         | Latest                                               |
| **Nerd Font**   | Required for icons (dashboard, bufferline, lualine)  |
| **ripgrep**     | Required for Telescope live grep                     |
| **fd**          | Recommended for faster file finding                  |
| **make / gcc**  | Required to build `telescope-fzf-native.nvim`        |
| **Node.js**     | Required for Copilot, some Mason LSPs, Prettier      |
| **Go**          | Optional — only if you use `gopls`                   |
| **Shell**       | Configured for `/bin/zsh`                            |

> **Note**: Mason installs LSP servers, linters, and formatters on first launch. You do not need to install them globally.

---

### 2. Installation

#### 2.1 Backup existing config

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
```

#### 2.2 Clone the repository

```bash
git clone git@github.com:smile-ko/nvim-config.git ~/.config/nvim
```

HTTPS alternative:

```bash
git clone https://github.com/smile-ko/nvim-config.git ~/.config/nvim
```

#### 2.3 Launch Neovim

```bash
nvim
```

lazy.nvim bootstraps itself, then installs LazyVim and all plugins. The first launch can take a few minutes.

#### 2.4 What happens on first start

| Stage        | What it does                                                      |
| ------------ | ----------------------------------------------------------------- |
| **Bootstrap** | Clones `lazy.nvim` into `~/.local/share/nvim/lazy/lazy.nvim`     |
| **Plugins**   | Installs LazyVim, extras, and specs under `lua/plugins/`         |
| **Mason**     | Ensures LSP servers and tools listed in `coding.lua`             |
| **Treesitter**| Compiles parsers from `ensure_installed`                         |

---

### 3. Project Structure

```
~/.config/nvim/
├── init.lua                 # Entry point — enables loader, loads config.lazy
├── lazy-lock.json           # Pinned plugin versions
├── lazyvim.json             # LazyVim extras / version metadata
├── stylua.toml              # Lua formatter (2 spaces, 120 columns)
├── lua/
│   ├── config/
│   │   ├── lazy.lua         # lazy.nvim setup + LazyVim extras
│   │   ├── options.lua      # Editor options (leader, indent, splits)
│   │   ├── keymaps.lua      # Custom keymaps
│   │   └── autocmds.lua     # Autocommands
│   ├── plugins/
│   │   ├── colorscheme.lua  # Tokyonight Storm (transparent)
│   │   ├── coding.lua       # LSP, Mason, Treesitter, blink.cmp, refactor
│   │   ├── editor.lua       # Telescope, Git, which-key, hipatterns
│   │   └── ui.lua           # Noice, dashboard, bufferline, lualine, zen
│   └── utils/
│       ├── discipline.lua   # Optional cowboy-mode (currently unused)
│       └── debug.lua        # Debug helpers
└── README.md
```

---

### 4. Key Mappings

Leader is `<Space>`.

#### 4.1 General

| Key                    | Action                                 |
| ---------------------- | -------------------------------------- |
| `<Leader>p` / `<Leader>P` | Paste from register `0`             |
| `<Leader>c` / `<Leader>d` | Change / delete without yanking     |
| `dw`                   | Delete word backwards                  |
| `te`                   | New tab                                |
| `<Tab>` / `<S-Tab>`    | Next / previous tab (bufferline)       |
| `ss` / `sv`            | Split horizontal / vertical            |
| `sh` `sj` `sk` `sl`    | Move between windows                   |
| `<C-w>` arrows         | Resize window                          |
| `<A-j>` / `<A-k>`      | Move line or visual block down / up    |
| `<Leader>o` / `<Leader>O` | Insert line below / above, stay in insert |
| `:W`                   | Write with sudo                        |

#### 4.2 Telescope

| Key   | Action                                              |
| ----- | --------------------------------------------------- |
| `;f`  | Find files (respects `.gitignore`, includes hidden) |
| `;r`  | Live grep (hidden files included)                   |
| `\\`  | Open buffers                                        |
| `;t`  | Help tags                                           |
| `;e`  | Diagnostics                                         |
| `;s`  | Treesitter symbols                                  |
| `sf`  | File browser in current buffer directory            |
| `;;`  | Resume last picker                                  |
| `<Leader>fP` | Find files in the lazy.nvim plugin root      |

#### 4.3 Git & LSP

| Key          | Action                                      |
| ------------ | ------------------------------------------- |
| `<Leader>gb` | Git blame window                            |
| `<Leader>go` | Browse file / folder on remote              |
| `gd`         | Go to definition (Telescope)                |
| `<Leader>cs` | Symbols outline                             |
| `<Leader>r`  | Refactor selection (visual mode)            |
| `<Leader>z`  | Zen Mode                                    |
| `<Leader>?`  | Buffer-local keymaps (which-key)            |
| `<C-a>` / `<C-x>` | Increment / decrement (dial.nvim)      |

---

### 5. Plugin Highlights

#### Colorscheme

| Plugin | Role |
| ------ | ---- |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Storm style, transparent background, sidebars, and floats |

#### Coding

| Plugin | Role |
| ------ | ---- |
| [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) | Incremental LSP rename |
| [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim) | Visual refactor picker |
| [mini.bracketed](https://github.com/nvim-mini/mini.bracketed) | `[` / `]` navigation |
| [dial.nvim](https://github.com/monaqa/dial.nvim) | Increment numbers, dates, bools, `let`/`const`, semver |
| [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) | Code outline sidebar |
| [mason.nvim](https://github.com/mason-org/mason.nvim) | LSP / linter / formatter installer |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | TypeScript, Lua, YAML, CSS, HTML, Vue, Tailwind, Go, Prisma |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Highlighting, indent, MDX as Markdown |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion with ghost text |

#### Editor

| Plugin | Role |
| ------ | ---- |
| [mini.hipatterns](https://github.com/nvim-mini/mini.hipatterns) | Highlight `hsl(...)` colors |
| [git.nvim](https://github.com/dinhhuy258/git.nvim) | Blame and browse |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder + file browser + fzf |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Keymap hints (`<Leader>a` = AI group) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Gutter signs + inline blame |
| [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim) | Merge conflict markers |

#### UI

| Plugin | Role |
| ------ | ---- |
| [noice.nvim](https://github.com/folke/noice.nvim) | Cmdline, messages, LSP hover border |
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Dashboard + smooth scroll |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Tab-mode buffer line |
| [incline.nvim](https://github.com/b0o/incline.nvim) | Floating filename with icon |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline with pretty path |
| [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) | Distraction-free editing |

---

### 6. LazyVim Extras

Imported in `lua/config/lazy.lua`:

| Category     | Extra                                      |
| ------------ | ------------------------------------------ |
| **Linting**  | `linting.eslint`                           |
| **Format**   | `formatting.prettier`                      |
| **Lang**     | TypeScript, JSON, Markdown, Go, Tailwind, Vue, SQL, Prisma, YAML, CMake |
| **AI**       | `ai.copilot`                               |
| **Coding**   | `coding.neogen`                            |
| **Util**     | `util.mini-hipatterns`                     |

Disabled / commented extras (easy to re-enable):

| Extra | File |
| ----- | ---- |
| `lang.toml` | `lua/config/lazy.lua` |
| `ai.avante` | `lua/config/lazy.lua` + spec in `lua/plugins/coding.lua` |

Remove an import line in `lua/config/lazy.lua` to disable an extra.

---

### 7. Mason Tools

Ensured in `lua/plugins/coding.lua`:

| Tool | Purpose |
| ---- | ------- |
| `stylua` | Lua formatter |
| `selene` / `luacheck` | Lua linters |
| `shellcheck` / `shfmt` | Shell lint / format |
| `vue-language-server` | Vue LSP |
| `tailwindcss-language-server` | Tailwind LSP |
| `typescript-language-server` | TypeScript / JavaScript LSP |
| `css-lsp` | CSS LSP |
| `prisma-language-server` | Prisma LSP |
| `gopls` | Go LSP |

```vim
:Mason
```

---

### 8. Customization

#### 8.1 Add a plugin

1. Create or edit a spec under `lua/plugins/` (for example `lua/plugins/myplugin.lua`).
2. Return a lazy.nvim plugin table.
3. Restart Neovim or run `:Lazy sync`.

#### 8.2 Change colorscheme

Edit `lua/plugins/colorscheme.lua` and the `colorscheme` option in `lua/config/lazy.lua`.

```lua
opts = {
  colorscheme = "tokyonight-storm",
}
```

#### 8.3 Add an LSP server

1. Append the Mason package name to `ensure_installed` in `lua/plugins/coding.lua`.
2. Add a `servers` entry under the `nvim-lspconfig` spec.

#### 8.4 Editor options

Defaults live in `lua/config/options.lua`:

| Option | Value |
| ------ | ----- |
| Leader | `<Space>` |
| Indent | 2 spaces |
| Wrap | Off |
| Mouse | Disabled |
| `scrolloff` | 10 |
| `cmdheight` | `0` on Neovim 0.8+ |
| Shell | `/bin/zsh` |

#### 8.5 Discipline mode (optional)

Cowboy-mode lives in `lua/utils/discipline.lua`. It is commented out in `lua/config/keymaps.lua`. Uncomment to warn after repeated `hjkl` / arrow spam:

```lua
local discipline = require("utils.discipline")
discipline.cowboy()
```

---

### 9. Useful Commands

| Command | Purpose |
| ------- | ------- |
| `:Lazy` | Plugin manager UI |
| `:LazyExtras` | Enable / disable LazyVim extras |
| `:Lazy sync` | Install, update, clean plugins |
| `:Mason` | LSP / tool installer |
| `:LspInfo` | Active language servers |
| `:checkhealth` | Diagnose Neovim, LSP, treesitter |
| `:IncRename` | Incremental rename |
| `:SymbolsOutline` | Toggle outline |
| `:ZenMode` | Toggle zen mode |
| `:Noice` | Message history |
| `:TSPlaygroundToggle` | Treesitter playground |
| `:W` | Save with sudo |

---

### 10. Troubleshooting

#### Plugins failed to install

```vim
:Lazy
```

Check failed specs, then `:Lazy sync`. Confirm Git and network access.

#### Missing LSP servers

```vim
:Mason
:checkhealth lsp
```

Install the server from Mason, or add it to `ensure_installed` and restart.

#### Telescope fzf native failed to build

Install a C compiler (`gcc` or `clang`) and `make`, then:

```vim
:Lazy build telescope-fzf-native.nvim
```

#### Icons look wrong

Install a [Nerd Font](https://www.nerdfonts.com/) and set it as the terminal font.

#### Slow first launch

Expected — plugins, Mason tools, and Treesitter parsers download and compile once. Later starts use the bytecode loader (`vim.loader.enable()`).

#### Keymaps not firing

Confirm leader is `<Space>` (`:echo mapleader`). Use `<Leader>?` or `:WhichKey` to inspect mappings.

---

### 11. License

MIT
