lvim.lsp.installer.setup.automatic_servers_installation = false
lvim.lsp.automatic_servers_installation = false
vim.list_extend(
  lvim.lsp.automatic_configuration.skipped_servers, 
  { 
    "lua_ls", 
    "sumneko_lua",
    "jedi_language_server",
    "pyre",
    "pylsp",
    "pylyzer",
    "ruff_lsp",
    "yaml-language-server",
    "yamlls",
    "yamllint",
    "tsserver",
    "jdtls",
    "buf-language-server"
  }
)
vim.diagnostic.config({ virtual_text = false })
lvim.lsp.on_attach_callback = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
end


local capabilities = require("lvim.lsp").common_capabilities()

require("typescript").setup {
  -- disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  sources = {
    require "typescript.extensions.null-ls.code-actions",
  },
  server = {
    -- pass options to lspconfig's setup method
    on_attach = require("lvim.lsp").common_on_attach,
    on_init = require("lvim.lsp").common_on_init,
    capabilities = capabilities,
    settings = {
      typescript = {
        inlayHints = {
          includeInlayEnumMemberValueHints = false,
          includeInlayFunctionLikeReturnTypeHints = false,
          includeInlayFunctionParameterTypeHints = false,
          includeInlayParameterNameHints = "none", -- 'none' | 'literals' | 'all';
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = false,
          includeInlayVariableTypeHints = false,
        },
      },
    },
  },
}

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetypes = { "sh", "zsh" } },
  { command = "prettier", filetypes = { "css", "javascript", "javascriptreact", "typescript", "typescriptreact" } },
}

