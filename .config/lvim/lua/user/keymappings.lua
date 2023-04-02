-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.builtin.which_key.mappings["s"] = { "<cmd>w!<CR>", "Save" }

lvim.keys.insert_mode["jj"] = "<esc>"
lvim.keys.insert_mode["jk"] = "<esc>"
lvim.keys.insert_mode["kk"] = "<esc>"
lvim.keys.insert_mode["kj"] = "<esc>"

lvim.keys.normal_mode["Y"] = "yg$"
lvim.keys.normal_mode["J"] = "mzJ`z"
lvim.keys.normal_mode["<leader>w"] = "ciw"
lvim.keys.visual_block_mode["<leader>v"] = "\"_dP"
lvim.keys.visual_mode["<leader>v"] = "\"_dP"

lvim.keys.normal_mode["<leader>y"] = "\"_dd"
lvim.keys.visual_block_mode["<leader>y"] = "\"_d"
lvim.keys.normal_mode["<leader>r"] = vim.lsp.buf.rename
