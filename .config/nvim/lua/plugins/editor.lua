return {
  {
    "folke/flash.nvim",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>ht", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple toggle tags" },
      { "<leader>hs", "<cmd>Grapple toggle_scopes<cr>", desc = "Grapple toggle scopes" },
      -- { "<leader>j", "<cmd>Grapple cycle forward<cr>", desc = "Grapple cycle forward" },
      -- { "<leader>J", "<cmd>Grapple cycle backward<cr>", desc = "Grapple cycle backward" },
      -- { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      -- { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    },
  },
}
