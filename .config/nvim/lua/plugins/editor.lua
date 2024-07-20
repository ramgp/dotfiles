local Util = require("lazyvim.util")
local Root = Util.root

local root_dirs = {
  cfg = vim.fn.expand("~/.config"),
  prg = vim.fn.expand("~/prg"),
  dotfiles = vim.fn.expand("~/.dotfiles"),
}

local in_path = function(filepath, root_path)
  if not root_path then
    return
  end

  return string.find(filepath, root_path)
end

local detect_root_dir = function(root)
  local root_path = root_dirs[root]

  local filepath = vim.api.nvim_buf_get_name(0)
  local in_root_path = root_path and in_path(filepath, root_path)
  if not in_root_path then
    return
  end

  -- only XDG_CONFIG_HOME paths have their root path a dir up from it
  if root ~= "cfg" then
    return root_path
  end

  local next_slash = string.find(filepath, "/", string.len(root_path) + 2)
  return next_slash and string.sub(filepath, 1, next_slash - 1) or root_path
end

local cache = {}
local get_cwd_root = function()
  local buf = vim.api.nvim_get_current_buf()

  local cwd = cache[buf]
  if not cwd then
    local roots = Root.detect({ all = false })
    cwd = roots[1] and roots[1].paths[1]

    ---@diagnostic disable-next-line: undefined-field,undefined-global
    if not cwd or cwd == vim.loop.cwd() then
      cwd = detect_root_dir("cfg") or detect_root_dir("prg")
    end

    if not cwd then
      cwd = vim.loop.cwd()
    else
      cache[buf] = cwd
    end
  end

  return Util.is_win() and cwd:gsub("/", "\\") or cwd
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
      },
    },
    keys = {
      {
        "<leader>z",
        "<cmd>Neotree focus<cr>",
        desc = "Explorer focus",
      },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = get_cwd_root() })
        end,
        desc = "Explorer",
      },
      {
        "<leader>E",
        function()
          ---@diagnostic disable-next-line: undefined-field,undefined-global
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer (cwd)",
      },
      { "<leader>fe", false },
      { "<leader>fE", false },
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
      { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Grapple select 1" },
      { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Grapple select 2" },
      { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Grapple select 3" },
      { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Grapple select 4" },
    },
  },
  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
