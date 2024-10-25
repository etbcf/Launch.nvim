local M = {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
}

function M.config()
  -- Direct key mapping for commenting
  local opts = { noremap = true, silent = true }  -- Common options for the keymap

  -- Normal mode keymap for toggling comment
  vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", opts)

  -- Visual mode keymap for toggling comment
  vim.api.nvim_set_keymap("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", opts)

  vim.g.skip_ts_context_commentstring_module = true

  ---@diagnostic disable: missing-fields
  require("ts_context_commentstring").setup {
    enable_autocmd = false,
  }

  require("Comment").setup {
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  }
end

return M

