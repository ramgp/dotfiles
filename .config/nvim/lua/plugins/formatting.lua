return {
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     table.insert(opts.ensure_installed, "shellcheck")
  --   end,
  -- },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   optional = true,
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, nls.builtins.formatting.prettier)
  --   end,
  -- },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- ["zsh"] = { "shfmt" },
        ["bash"] = { "shfmt" },
      },
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      -- formatters = {
      --   shfmt = {
      --     prepend_args = { "-i", "2", "-ci" },
      --   },
      --   fish_indent = {
      --     prepend_args = { "-i", "2", "-ci" },
      --   },
      -- },
    },
  },
}
