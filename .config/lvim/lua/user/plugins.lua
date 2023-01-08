-- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
    { "rebelot/kanagawa.nvim" },
    { "LunarVim/colorschemes" },
    -- {
    --   "EdenEast/nightfox.nvim",
    --   config = function()
    --     require("nightfox").setup({
    --       options = {
    --         styles = {
    --           comments = "italic",
    --           keywords = "italic",
    --           types = "italic,bold",
    --         }
    --       }
    --     })
    --   end
    -- },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "FotiadisM/tabset.nvim",
        event = "VeryLazy",
        config = function()
            require("tabset").setup(
                {
                    defaults = {
                        tabwidth = 2,
                        expandtab = true
                    },
                    languages = {
                        lua = {
                            tabwidth = 4,
                            expandtab = true
                        },
                        go = {
                            tabwidth = 4,
                            expandtab = false
                        },
                        {
                            filetypes = {
                                "javascript",
                                "typescript",
                                "javascriptreact",
                                "typescriptreact",
                                "json",
                                "yaml"
                            },
                            config = {
                                tabwidth = 2
                            }
                        }
                    }
                }
            )
        end
    },
}
