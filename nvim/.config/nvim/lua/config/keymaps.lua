-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = function(mode, key, action, opts)
  opts = opts or {}
  vim.keymap.set(mode, key, action, opts)
end
local opts = { noremap = true, silent = true }

keymap("n", "x", '"_x')

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save file and quit
keymap("n", "<Leader>w", ":update<Return>", opts)
keymap("n", "<Leader>q", ":quit<Return>", opts)
keymap("n", "<Leader>Q", ":qa<Return>", opts)

-- File explorer with NvimTree
keymap("n", "<Leader>f", ":NvimTreeFindFile<Return>", opts)
keymap("n", "<Leader>t", ":NvimTreeToggle<Return>", opts)

-- Tabs
keymap("n", "te", ":tabedit")
keymap("n", "<tab>", ":tabnext<Return>", opts)
keymap("n", "<s-tab>", ":tabprev<Return>", opts)
keymap("n", "tw", ":tabclose<Return>", opts)

-- Split window
keymap("n", "ss", ":split<Return>", opts)
keymap("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap("n", "sh", "<C-w>h")
keymap("n", "sk", "<C-w>k")
keymap("n", "sj", "<C-w>j")
keymap("n", "sl", "<C-w>l")

-- Resize window
keymap("n", "<C-S-h>", "<C-w><")
keymap("n", "<C-S-l>", "<C-w>>")
keymap("n", "<C-S-k>", "<C-w>+")
keymap("n", "<C-S-j>", "<C-w>-")

-- Diagnostics
keymap("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Code Action
keymap("n", "<leader>vca", function()
  vim.lsp.buf.code_action()
end, opts)

-- Remap Scroll Up and Down
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
