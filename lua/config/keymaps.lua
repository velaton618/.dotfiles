vim.g.mapleader = " "

local api = vim.api

-- Сyrylic layout
api.nvim_set_keymap("i", "оо", "jj", { silent = true })
-- api.nvim_set_keymap("i", "ол", "jk", { silent = true })
api.nvim_set_keymap("i", "псс", "gcc", { silent = true })
api.nvim_set_keymap("n", "ш", "i", { silent = true })
api.nvim_set_keymap("n", "т", "n", { silent = true })
api.nvim_set_keymap("n", "г", "u", { silent = true })

api.nvim_set_keymap("i", "jj", "<Esc>l", { noremap = true, silent = true })
api.nvim_set_keymap("i", "jk", "<Esc>l", { noremap = true, silent = true })

api.nvim_set_keymap("n", "K", "<C-u>zz", { noremap = true, silent = true })
api.nvim_set_keymap("n", "J", "<C-d>zz", { noremap = true, silent = true })

api.nvim_set_keymap("v", "K", "<C-u>zz", { noremap = true, silent = true })
api.nvim_set_keymap("v", "J", "<C-d>zz", { noremap = true, silent = true })

api.nvim_set_keymap("n", "<leader>hh", ":noh<cr>", { silent = true })
-- api.nvim_set_keymap("n", "<leader>s", ":NvimTreeToggle<cr>", { silent = true })
-- api.nvim_set_keymap("n", "<leader>F", ":NvimTreeFocus<cr>", { silent = true })
-- Lua

vim.keymap.set("n", "<leader>s", ":Neotree toggle<cr>", { desc = "Toggle NeoTree", silent = true })
vim.keymap.set("n", "<leader>F", ":Neotree focus<cr>", { desc = "Focus NeoTree", silent = true })

-- Themery
api.nvim_set_keymap("n", "<leader>tt", ":Themery<cr>", { silent = true })

-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

local fzf = require("fzf-lua")

local keymap = function(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

keymap("n", "<leader>ht", fzf.help_tags)
keymap("n", "<leader>hk", fzf.keymaps)

keymap("n", "<leader>ff", fzf.files)
keymap("n", "<leader>fg", fzf.grep_project)
keymap("n", "<leader>po", fzf.oldfiles)
keymap("n", "<leader>pp", fzf.buffers)
-- keymap("n", "<leader>/", fzf.grep_curbuf)

keymap("n", "<leader>cw", fzf.grep_cword)
keymap("n", "<leader>ccw", function()
	fzf.lgrep_curbuf({ search = vim.fn.expand("<cword>") })
end)

-- save
api.nvim_set_keymap("n", "<leader>w", ":w!<cr>", { silent = true })
api.nvim_set_keymap("n", "<leader>wq", ":wqa!<cr>", { silent = true })

-- Go through wrapped line with j and k
api.nvim_set_keymap("n", "j", "gj", { silent = true })
api.nvim_set_keymap("n", "k", "gk", { silent = true })

api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Harpoon
vim.keymap.set("n", "hx", function()
	require("harpoon.mark").add_file()
end)
vim.keymap.set("n", "ha", function()
	require("harpoon.ui").toggle_quick_menu()
end)
vim.keymap.set("n", "hj", function()
	require("harpoon.ui").nav_next()
end)
vim.keymap.set("n", "hk", function()
	require("harpoon.ui").nav_prev()
end)

-- Neogit
vim.keymap.set("n", "<leader>gg", ":LazyGit<cr>", { silent = true })

-- ISwap
vim.keymap.set("n", "<leader>x", ":ISwap<cr>", { silent = true })

-- Inc rename
vim.keymap.set("n", "grr", ":IncRename<cr>", { silent = true })

-- Barbar
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
map("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
map("n", "<leader>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bn", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

-- Diagnostics
-- Expand inline error
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>cn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>cp", vim.diagnostic.goto_prev)

-- Tabs
vim.keymap.set("n", "<leader><tab>", ":bnext<cr>", { silent = true })
vim.keymap.set("n", "<leader><S-tab>", ":bprevious<cr>", { silent = true })
vim.keymap.set("n", "<leader>tc", ":bd<cr>", { silent = true })
