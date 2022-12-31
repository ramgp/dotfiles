--[[
# Fresh start (reset)
rm -rf ~/.local/share/lunarvim
]]

reload("user.plugins")
reload("user.options")
reload("user.keymappings")
reload("user.treesitter")
reload("user.lsp")
