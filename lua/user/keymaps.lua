vim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- tab navigation
lvim.keys.normal_mode["Q"] = ":BufferKill<CR>"
lvim.keys.normal_mode["L"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"] = ":BufferLineCyclePrev<CR>"
-- fix coursor move to left after insert mode exit
lvim.keys.insert_mode['<esc>'] = '<esc>`^'
-- tmux navigation
lvim.keys.normal_mode['<C-j>'] = '<Cmd>TmuxNavigateDown<CR>'
lvim.keys.normal_mode['<C-h>'] = '<Cmd>TmuxNavigateLeft<CR>'
lvim.keys.normal_mode['<C-k>'] = '<Cmd>TmuxNavigateUp<CR>'
lvim.keys.normal_mode['<C-l>'] = '<Cmd>TmuxNavigateRight<CR>'
-- replace
lvim.builtin.which_key.["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
