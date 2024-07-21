vim.g.mapleader = " "
vim.wo.number = true
vim.wo.relativenumber = true

vim.o.tabstop = 4
vim.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

vim.o.mouse = "a"

-- Highlight current line
vim.wo.cursorline = true

-- Clipboard
-- vim.opt.clipboard:append {'unnamedplus'} -- Linux
vim.opt.clipboard:append({ "unnamed" }) -- MacOS
vim.opt.termguicolors = true

vim.cmd([[colorscheme kanagawa-paper]])

-- Higligh on yank

vim.api.nvim_exec2(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
  augroup end,
]],
	{ output = false }
)

-- list chars
vim.opt.list = true
vim.opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }
