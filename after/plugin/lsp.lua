local lsp = require("lspconfig")
local luasnip = require("luasnip")
local cmp = require("cmp")
local mason = require("mason")
local mason_config = require("mason-lspconfig")

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

mason.setup()
mason_config.setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"pyright",
		"gopls",
		"rust_analyzer",
		"clangd",
		"zls",
		"astro"
	},
})

local types = require'cmp.types'

cmp.setup({
	preselect = types.cmp.PreselectMode.None,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
	}),
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>h", function()
			vim.lsp.buf.signature_help()
		end, opts)

		vim.keymap.set("n", "<leader>fa", function()
			vim.lsp.buf.format({ async = true, bufnr = bufnr })
		end)
	end,
})

-- LSP Servers
-- If we need some additional settings set it here
lsp.lua_ls.setup({
	capabilities = capabilities,
})

lsp.tsserver.setup({
	capabilities = capabilities,
})

lsp.pyright.setup({
	capabilities = capabilities,
})

lsp.cssls.setup({
	capabilities = capabilities,
})

lsp.gopls.setup({
	capabilities = capabilities,
})

lsp.rust_analyzer.setup({
	capabilities = capabilities,
})

lsp.clangd.setup({
	capabilities = capabilities,
})

lsp.astro.setup({
	capabilities = capabilities,
})
