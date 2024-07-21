return {
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/nvim-cmp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {},
		branch = "v3.x",
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason").setup({})
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
				},
				ensure_installed = {
					"cssls",
					"tailwindcss",
					"css_variables",
					"cssmodules_ls",
					"tsserver",
					"somesass_ls",
					"eslint",
					"jsonls",
					"pyright",
					"rust_analyzer",
					"emmet_ls",
				},
			})

			require("lspconfig").emmet_ls.setup({
				on_attach = function(client, bufnr)
					local filetype = vim.bo[bufnr].filetype
					if filetype == "typescriptreact" or filetype == "javascriptreact" then
						client.stop()
					end
				end,
			})

			require("luasnip.loaders.from_vscode").load({})
			local cmp = require("cmp")

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),

					["<CR>"] = cmp.mapping.confirm({ select = true }),

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "mlaursen/vim-react-snippets" },
				},
			})

			vim.keymap.set("n", "<leader>hv", vim.lsp.buf.hover, {})

			local function custom_definition_handler(err, result)
				if err then
					return
				end

				if not result or vim.tbl_isempty(result) then
					return
				end

				if vim.islist(result) then
					vim.lsp.util.jump_to_location(result[1], "utf-16")
				else
					vim.lsp.util.jump_to_location(result, "utf-16")
				end
			end

			vim.lsp.handlers["textDocument/definition"] = custom_definition_handler
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		end,
	},
}
