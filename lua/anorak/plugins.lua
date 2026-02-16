-- plugins.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Themes
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "marko-cerovac/material.nvim",
    name = "material",
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "Gruvbox",
    priority = 1000,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "html",
        "css",
        "json",
        "bash",
        "markdown",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- LSP base
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
        },
        window = { position = "left", width = 30 },
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({})
      pcall(telescope.load_extension, "fzf")

      vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "Telescope: arquivos" })
    end,
  },

  -- Debugger (DAP + UI)
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Keymaps
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
      vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: REPL" })
      vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: UI Toggle" })

      -- Node (JS/TS)
      dap.configurations.javascript = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Node: arquivo atual",
          program = "${file}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
        },
      }
      dap.configurations.typescript = dap.configurations.javascript

      -- Rust
      local mason_path = vim.fn.stdpath("data") .. "/mason/"
      local codelldb = mason_path .. "packages/codelldb/extension/adapter/codelldb"

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = codelldb,
          args = { "--port", "${port}" },
        },
      }

      dap.configurations.rust = {
        {
          name = "Rust: Debug (escolher binário)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Binário: ", vim.fn.getcwd() .. "/target/debug/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
    end,
  },

  -- Mason DAP
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    config = function()
      require("mason-nvim-dap").setup({
        automatic_setup = true,
        ensure_installed = { "js", "codelldb" },
      })
    end,
  },
})

