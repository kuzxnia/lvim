vim.cmd [[ autocmd BufEnter,BufWinEnter,BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml set ft=helm]]

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "Markdown",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      nnoremap <silent> <buffer> <esc> :close<CR> 
      set nobuflisted 
    ]]
  end,
})
