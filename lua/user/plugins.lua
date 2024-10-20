lvim.plugins = {
	{
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "dark",
			})
			require("onedark").load()
		end,
	},
	"christoomey/vim-tmux-navigator",
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{ "ggandor/lightspeed.nvim", event = "BufRead" },
	{
		"ethanholz/nvim-lastplace",
		event = "BufRead",
		config = function()
			require("nvim-lastplace").setup({
				lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
				lastplace_ignore_filetype = {
					"gitcommit",
					"gitrebase",
					"svn",
					"hgcommit",
				},
				lastplace_open_folds = true,
			})
		end,
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("dressing").setup({})
		end,
	},
	"mbbill/undotree",
	"folke/trouble.nvim",
	"windwp/nvim-spectre",
	"is0n/jaq-nvim",
	-- helm
	"towolf/vim-helm",
	-- rust
	"simrat39/rust-tools.nvim",
	-- go
	"olexsmir/gopher.nvim",
	"leoluz/nvim-dap-go",
	-- python
	-- "mfussenegger/nvim-dap-python",
	-- test
	-- "nvim-neotest/neotest",
	"antoinemadec/FixCursorHold.nvim",
	-- "nvim-neotest/neotest-python",
	-- git
	"TimUntersberger/neogit",
	"rhysd/git-messenger.vim",
	"sindrets/diffview.nvim",
}

table.insert(lvim.plugins, {
	"zbirenbaum/copilot-cmp",
	event = "InsertEnter",
	dependencies = { "zbirenbaum/copilot.lua" },
	config = function()
		vim.defer_fn(function()
			require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
			require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
		end, 100)
	end,
})
