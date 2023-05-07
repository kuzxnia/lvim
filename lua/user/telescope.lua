-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
local picker_config = {
  prompt_prefix = '🔍 ',
  previewer = nil,
  layout_strategy = 'vertical',
  layout_config = { 
    width = 0.95, 
    height = 0.95, 
    prompt_position = 'bottom',
  }
}
lvim.builtin.telescope.pickers.git_files = picker_config
lvim.builtin.telescope.pickers.find_files = picker_config
lvim.builtin.telescope.pickers.live_grep = picker_config
lvim.builtin.telescope.theme = 'default'
lvim.builtin.telescope.defaults = {
  layout_strategy = "horizontal",
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  mappings = {
  -- for input mode
    i = {
      ["<esc>"] = actions.close,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
    },
    -- for normal mode
    n = {
      ["<esc>"] = actions.close,
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
    },
  }
}

