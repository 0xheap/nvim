return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>k", "<cmd>WhichKey<cr>", desc = "Show keybindings" },
  },
  opts = {
    triggers = {
      { "<auto>", mode = "nxso" },
    },
  },
}
