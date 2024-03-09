local Util = require("lazyvim.util")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>z",
        "<cmd>Neotree focus<cr>",
        desc = "Explorer focus",
      },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
        end,
        desc = "Explorer",
      },
      {
        "<leader>E",
        function()
          ---@diagnostic disable-next-line: undefined-field
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer (cwd)",
      },
      { "<leader>fe", false },
      { "<leader>fE", false },
    },
  },
}
