-- set additional formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "buf", filetypes = { "proto" } },
}
-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "buf", filetypes = { "proto" } },
}

require("lvim.lsp.manager").setup("buf-language-server", {})

local lsp_manager = require "lvim.lsp.manager"
lsp_manager.setup("buf-language-server", {
  filetypes = { "proto" },
  -- cmd = { "/Users/chris/Library/Caches/fnm_multishells/65657_1672759387689/bin/ls_emmet", "--stdio" },
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})
