return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    {
      "<leader>e",
      function()
        local nvim_tree = require("nvim-tree.api")
        if vim.bo.filetype == "NvimTree" then
          vim.cmd("wincmd p")
        else
          nvim_tree.tree.focus()
        end
      end,
      desc = "Focus file explorer",
    },
  },
  opts = {
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = false,
    },
  },
}
