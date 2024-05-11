return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable LazyVim default goto definition keymap
      keys[#keys + 1] = { "gd", false }
    end,
  },
  {
    "KostkaBrukowa/definition-or-references.nvim",
    keys = {
      {
        "gd",
        function()
          require("definition-or-references").definition_or_references()
        end,
        desc = "Goto Definition",
        { silent = true },
      },
    },
    opts = {
      on_references_result = function(result)
        require("telescope.pickers")
          .new({}, {
            prompt_title = "LSP References",
            finder = require("telescope.finders").new_table({
              results = vim.lsp.util.locations_to_items(result, "utf-16"),
              entry_maker = require("telescope.make_entry").gen_from_quickfix(),
            }),
            previewer = require("telescope.config").values.qflist_previewer({}),
          })
          :find()
      end,
      notify_options = {
        errors = true,
        on_definition_no_reference = true,
        no_definition_no_reference = true,
        on_definition_one_reference = false,
        no_definition_one_reference = true,
      },
    },
  },
}
