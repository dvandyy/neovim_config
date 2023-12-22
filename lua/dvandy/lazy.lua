vim.g.mapleader = " " -- IMPORTANT

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

local plugins = {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},

	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight")
		end,
	},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"theprimeagen/harpoon",
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-commentary",
	"windwp/nvim-autopairs",
	"nvim-lualine/lualine.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	{
		-- LSP Support
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Autocompletion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",

		-- Snippets
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"saadparwaiz1/cmp_luasnip",
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
