
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
  }
)
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.on_attach_callback = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil
end
