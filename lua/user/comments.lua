return {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
  },
  config = function()
    require("Comment").setup()

    -- Which Key mappings
    local wk = require "which-key"

    wk.add({
      { "<leader>gcc", "<cmd>lua require('Comment.api').toggle.linewise.current()<cr>", desc = "Toggle Line Comment" },
      { "<leader>gbc", "<cmd>lua require('Comment.api').toggle.blockwise.current()<cr>", desc = "Toggle Block Comment" },
      { "<leader>gcO", "<cmd>lua require('Comment.api').toggle.linewise.above()<cr>", desc = "Comment Above" },
      { "<leader>gco", "<cmd>lua require('Comment.api').toggle.linewise.below()<cr>", desc = "Comment Below" },
      { "<leader>gcA", "<cmd>lua require('Comment.api').toggle.linewise.eol()<cr>", desc = "Comment End of Line" },
    }, { prefix = "<leader>" })  -- or any other prefix you wish
  end,
}
