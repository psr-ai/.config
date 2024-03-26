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
	    opts = {
	      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
	      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
	      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
	      language = "English" -- Copilot answer language settings when using default prompts. Default language is English.
	      -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
	      -- temperature = 0.1,
	    },
	    build = function()
	      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
	    end,
	    event = "VeryLazy",
	    keys = {
	      { "<leader>ccb", ":CopilotChatBuffer ", desc = "CopilotChat - Chat with current buffer" },
	      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
	      { "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
	      {
		"<leader>ccT",
		"<cmd>CopilotChatVsplitToggle<cr>",
		desc = "CopilotChat - Toggle Vsplit", -- Toggle vertical split
	      },
	      {
		"<leader>ccv",
		":CopilotChatVisual ",
		mode = "x",
		desc = "CopilotChat - Open in vertical split",
	      },
	      {
		"<leader>ccx",
		":CopilotChatInPlace<cr>",
		mode = "x",
		desc = "CopilotChat - Run in-place code",
	      },
	      {
		"<leader>ccf",
		"<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
		desc = "CopilotChat - Fix diagnostic",
	      },
	      {
		"<leader>ccr",
		"<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
		desc = "CopilotChat - Reset chat history and clear buffer",
	      }
	    },
	  },
	  {'akinsho/toggleterm.nvim', version = "*", config = true}
})
