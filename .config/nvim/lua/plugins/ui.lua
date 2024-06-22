-- local Util = require("lazyvim.util")

local get_color = function(name, opts)
  opts = opts or { fg = true }

  local hl = vim.api.nvim_get_hl(0, { name = name })

  ---@diagnostic disable-next-line: undefined-field
  local color = hl and (hl.fg or hl.foreground)
  if opts.bg then
    ---@diagnostic disable-next-line: undefined-field
    color = hl and (hl.bg or hl.background)
  end

  return color and string.format("#%06x", color) or nil
end

local bg = function(name)
  return get_color(name, { bg = true })
end

local mode_map = {
  ["NORMAL"] = "N",
  ["O-PENDING"] = "N?",
  ["INSERT"] = "I",
  ["VISUAL"] = "V",
  ["V-BLOCK"] = "VB",
  ["V-LINE"] = "VL",
  ["V-REPLACE"] = "VR",
  ["REPLACE"] = "R",
  ["COMMAND"] = "!",
  ["SHELL"] = "SH",
  ["TERMINAL"] = "T",
  ["EX"] = "X",
  ["S-BLOCK"] = "SB",
  ["S-LINE"] = "SL",
  ["SELECT"] = "S",
  ["CONFIRM"] = "Y?",
  ["MORE"] = "M",
}

return {
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(m)
              return mode_map[m] or m
            end,
          },
        },
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
      ]]

      logo = string.rep("\n", 3) .. logo .. "\n"

      opts.theme = "hyper"

      local config = {
        header = vim.split(logo, "\n"),
        -- header = opts.config.header,
        -- week_header = {
        --   enable = true,
        -- },
        shortcut = {
          -- action can be a function type
          -- { desc = string, group = 'highlight group', key = 'shortcut key', action = 'action when you press key' },
          {
            action = "Telescope find_files",
            desc = " Find file",
            icon = " ",
            key = "f",
          },
          -- {
          --   action = "Telescope oldfiles",
          --   desc = " Recent files",
          --   icon = " ",
          --   key = "r",
          -- },
          -- {
          --   action = "Telescope live_grep",
          --   desc = " Global search",
          --   icon = " ",
          --   key = "g",
          -- },
          {
            action = [[lua require("lazyvim.util").telescope.config_files()()]],
            desc = " Config",
            icon = " ",
            key = "c",
          },
          {
            action = 'lua require("persistence").load()',
            desc = " Restore",
            icon = " ",
            key = "s",
          },
          -- {
          --   action = "LazyExtras",
          --   desc = " Lazy Extras",
          --   icon = " ",
          --   key = "x",
          -- },
          {
            action = "Lazy",
            desc = " Lazy",
            icon = "󰒲 ",
            key = "l",
          },
          {
            action = "qa",
            desc = "",
            icon = " ",
            key = "q",
          },
        },
        packages = { enable = false }, -- show how many plugins neovim loaded
        -- limit how many projects list, action when you press key or enter it will run this action.
        -- action can be a functino type, e.g.
        -- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
        project = {
          enable = true,
          limit = 4,
          icon = "󰰺 ",
          label = " Projects",
          action = "Telescope find_files cwd=",
        },
        mru = { limit = 6, icon = " ", label = " Recent files", cwd_only = false },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "", "", "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      }

      opts.config = config
    end,
  },

  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = {
              guibg = bg("ColorColumn"),
              guifg = get_color("GlyphPalette1"),
            },
            InclineNormalNC = {
              guibg = bg("ColorColumn"),
              guifg = get_color("FoldColumn"),
            },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)

          if filename == "" then
            filename = "[No Name]"
          end

          local modified = vim.bo[props.buf].modified
          if modified then
            filename = filename .. " [+]"
          end

          -- local opts = {
          --   light = get_color("Normal"),
          --   dark = bg("NormalSB"),
          -- }
          --
          -- local helpers = require("incline.helpers")

          return {
            ft_icon and { ft_icon, " ", guifg = ft_color } or "",
            -- ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
            { filename, gui = modified and "italic,bold" or "bold" },
            -- guibg = bg("ColorColumn"),
            -- guifg = "#eeeeee",
          }
        end,
      })
    end,
  },
}
