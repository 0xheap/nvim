return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>\\", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle Terminal (bottom)" },
    { "<leader>-", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle Terminal (floating)" },
  },
  opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
    },
  },
}
