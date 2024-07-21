vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "H", function()
			vim.lsp.buf.hover()
			vim.defer_fn(function()
				local wins = vim.api.nvim_list_wins()
				for _, win in ipairs(wins) do
					local buf = vim.api.nvim_win_get_buf(win)
					if vim.api.nvim_get_option_value("filetype", { buf = buf }) == "lsp-hover" then
						vim.api.nvim_set_current_win(win)
						return
					end
				end
			end, 10)
		end, opts)

		vim.keymap.set("n", "<Esc>", function()
			local wins = vim.api.nvim_list_wins()
			for i = #wins, 1, -1 do
				local win = wins[i]
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.api.nvim_get_option_value("filetype", { buf = buf }) ~= "lsp-hover" then
					vim.api.nvim_set_current_win(win)
					return
				end
			end
		end, opts)

		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
	end,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").tsserver.setup({ capabilities = lsp_capabilities })
require("lspconfig").rust_analyzer.setup({ capabilities = lsp_capabilities })

-- Disable autocommenting on new line
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove("c")
		vim.opt.formatoptions:remove("r")
		vim.opt.formatoptions:remove("o")
	end,
})

-- Set tabsize to 4 for all inside guider folder at anywhere
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "**/guider/**",
	callback = function()
		vim.opt.softtabstop = 4
		vim.opt.tabstop = 4
		vim.opt.shiftwidth = 4
	end,
})

-- Tabsizes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "py", "rs", "html", "scss", "json" },
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
	callback = function()
		vim.bo.tabstop = 2
		vim.bo.shiftwidth = 2
	end,
})
