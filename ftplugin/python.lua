vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "jsonls" })
local pyright_opts = {
  settings = {
    python = {
      pythonPath = vim.loop.cwd() .. '/.venv/bin/python',
      venvPath = vim.loop.cwd() .. '/.venv/',
      analysis = {
        autoImportCompletion = true,
        -- typeCheckingMode = "off",
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        -- useLibraryCodeForTypes = true,
      },
    },
  },
} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pyright", pyright_opts)

-- set additional formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" }, extra_args = { "--fast", "-l 120" } },
  { command = "isort", filetypes = { "python" } },
}
-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" }, args = { "--max-line-length=120" } },
  -- { command = "mypy", filetypes = { "python" }, args = { "--ignore-missing-imports" } },
}

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
  quickfix = {
    enabled = false
  },
  icons = {
      running_animated = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
  },
  strategies = {
    integrated = {
      width = 180,
    },
  },
  adapters = {
    require("neotest-python")({
      -- Extra arguments for nvim-dap configuration
      -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
      dap = {
        justMyCode = false,
        console = "integratedTerminal",
        subProcess = false,
        pytest_discovery = true,
      },
      args = { "--log-level", "DEBUG", "--quiet", "-vv" },
      runner = "pytest",
    })
  }
})
