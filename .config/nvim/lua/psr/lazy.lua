local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ "rose-pine/neovim", name = "rose-pine" },
	{ "nvim-treesitter/nvim-treesitter", 
	config = function()
		vim.cmd("TSUpdate")
	end },
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{ 'ThePrimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' },
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'lervag/vimtex'},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	{ 'github/copilot.vim' },
	  {
	    "CopilotC-Nvim/CopilotChat.nvim",
	    branch = "canary",
	    dependencies = {
	      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	      { "nvim-telescope/telescope.nvim" }, -- for telescope help actions (optional)
	    },
	    opts = {
	      debug = true, -- Enable debugging
	      -- See Configuration section for rest
	    },
	    -- See Commands section for default commands if you want to lazy load on them
	  },
})
