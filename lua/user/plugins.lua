-- Additional Plugins

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })

lvim.plugins = {
  {
    'navarasu/onedark.nvim',
    config = function ()
      require('onedark').setup({
        style = 'dark'
      })
      require('onedark').load()
    end,
  },
  'christoomey/vim-tmux-navigator',
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup()
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = { "VimEnter" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup {
          plugin_manager_path = os.getenv "LUNARVIM_RUNTIME_DIR" .. "/site/pack/packer",
        }
      end, 100)
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require"lsp_signature".on_attach() end,
  },
  {
   "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufRead",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = {
          "gitcommit", "gitrebase", "svn", "hgcommit",
        },
        lastplace_open_folds = true,
     })
    end,
  },
  {
    "stevearc/dressing.nvim",
    config = function()
      require('dressing').setup({})
    end,
  },
  "windwp/nvim-spectre",
  "sindrets/diffview.nvim",
  -- rust
  "simrat39/rust-tools.nvim",
  -- python
  "mfussenegger/nvim-dap-python",
  -- test
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
}
