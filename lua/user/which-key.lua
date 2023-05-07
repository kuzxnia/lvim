-- comments
lvim.builtin.which_key.mappings["c"] = {"<Plug>(comment_toggle_linewise_current)", "Comment toggle current line"}
lvim.builtin.which_key.vmappings["c"] = {"<Plug>(comment_toggle_linewise_visual)", "Comment"}
-- telescope
lvim.builtin.which_key.mappings["<space>"] = { "<Cmd>Telescope find_files<CR>", "Find File" }
lvim.builtin.which_key.mappings["f"] = { "<Cmd>Telescope find_files<CR>", "Find File" }
-- neotest
lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" }
lvim.builtin.which_key.mappings["dF"] = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" }
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }
