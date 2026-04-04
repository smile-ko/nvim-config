return {
  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  },

  -- Go forward/backward with square brackets
  {
    "nvim-mini/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  -- Symbols outline
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

  -- tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "vue-language-server",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "prisma-language-server",
        "gopls",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "gd",
              function()
                require("telescope.builtin").lsp_definitions({ reuse_win = false })
              end,
              desc = "Goto Definition",
              has = "definition",
            },
          },
        },
      },
    },
  },

  -- Treesitter
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "php",
        "scss",
        "sql",
        "svelte",
      },

      highlight = { enable = true },
      indent = { enable = true },

      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },

      playground = {
        enable = true,
        updatetime = 25,
        persist_queries = true,
      },
    },

    init = function()
      -- support MDX
      vim.filetype.add({ extension = { mdx = "mdx" } })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },

  -- Menu completion code
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        menu = {
          winblend = vim.o.pumblend,
        },
        -- Displays a preview of the selected item on the current line
        ghost_text = {
          enabled = true,
        },
      },

      signature = {
        window = {
          winblend = vim.o.pumblend,
        },
      },
    },
  },

  -- AI code assistant
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make",
    version = false,
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = (function()
      local opts = {
        provider = "copilot",
        auto_suggestions_provider = "copilot",
        mode = "legacy",
        providers = {
          ["deepseek/chat"] = {
            __inherited_from = "openai",
            endpoint = "https://api.deepseek.com/v1",
            model = "deepseek-chat",
            display_name = "deepseek/chat",
            api_key_name = "DEEPSEEK_API_KEY",
            disable_tools = true,
            extra_request_body = {
              temperature = 0,
              max_tokens = 8192,
            },
          },
          ["deepseek/reasoner"] = {
            __inherited_from = "openai",
            endpoint = "https://api.deepseek.com/v1",
            model = "deepseek-reasoner",
            display_name = "deepseek/reasoner",
            api_key_name = "DEEPSEEK_API_KEY",
            disable_tools = true,
            extra_request_body = {
              temperature = 0,
              max_tokens = 8192,
            },
          },
        },
        behaviour = {
          auto_focus_sidebar = true,
          auto_suggestions = false,
          auto_suggestions_respect_ignore = false,
          auto_set_highlight_group = true,
          auto_set_keymaps = false,
          auto_apply_diff_after_generation = false,
          jump_result_buffer_on_finish = false,
          support_paste_from_clipboard = false,
          minimize_diff = true,
          enable_token_counting = false,
          use_cwd_as_project_root = false,
          auto_focus_on_diff_view = false,
        },
        windows = {
          position = "right",
          wrap = true,
          ask = {
            start_insert = false,
          },
        },
        mappings = {
          diff = {
            ours = "<leader>gco",
            theirs = "<leader>gct",
            all_theirs = "<leader>gca",
            both = "<leader>gcb",
            cursor = "<leader>gch",
            prev = "[c",
            next = "]c",
          },
          suggestion = {
            accept = "<M-l>",
            next = "<M-j>",
            prev = "<M-k>",
            dismiss = "<M-h>",
          },
          jump = {
            next = "<M-j>",
            prev = "<M-k>",
          },
          submit = {
            normal = "<CR>",
            insert = "<C-s>",
          },
          cancel = {
            normal = { "<C-c>", "<Esc>" },
            insert = { "<C-c>" },
          },
          toggle = {
            default = false,
          },
          sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            retry_user_request = "r",
            edit_user_request = "e",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
            remove_file = "d",
            add_file = "@",
            close = { "<Esc>", "<leader>x" },
            close_from_input = { normal = { "<Esc>", "<leader>x" } },
          },
          files = {
            add_current = "<M-f>",
            add_all_buffers = false,
          },
        },
        history = {
          storage_path = "/tmp/avante_history",
        },
        highlights = {
          diff = {
            current = "DiffTextGroup",
            incoming = "DiffAddGroup",
          },
        },
        diff = {
          autojump = true,
        },
        hints = {
          enabled = false,
        },
        selector = {
          provider = "telescope",
          exclude_auto_select = { "NvimTree" },
        },
      }

      return opts
    end)(),
    config = function(_, opts)
      require("avante").setup(opts)
      local sidebar = require("avante.sidebar")
      if sidebar then
        sidebar.show_input_hint = function() end
        sidebar.close_input_hint = function() end
      end
    end,
  },
}
