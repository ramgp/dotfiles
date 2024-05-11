-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "x", '"_x', { desc = "Delete without copying", silent = true })
vim.keymap.set({ "n", "v" }, "<leader>v", '"_dP', { desc = "Direct paste", silent = true })
vim.keymap.set({ "n", "x" }, "<leader>p", [["0p]], { desc = "paste from yank register", silent = true })
vim.keymap.set("n", "<leader>y", '"_dd', { desc = "Real delete", silent = true })
vim.keymap.set("v", "<leader>y", '"_d', { desc = "Real delete", silent = true })
vim.keymap.set("i", "jj", "<esc>", { desc = "Exit insert", silent = true })
vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert", silent = true })
vim.keymap.set("i", "kj", "<esc>", { desc = "Exit insert", silent = true })
vim.keymap.set("i", "kk", "<esc>", { desc = "Exit insert", silent = true })

vim.keymap.set("n", "<leader>j", "<C-d>", { desc = "Down half page", silent = true })
vim.keymap.set("n", "<leader>k", "<C-u>", { desc = "Up half page", silent = true })
