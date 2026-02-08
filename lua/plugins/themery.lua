return {
  {
    "zaldih/themery.nvim",
    keys = {
      { "<leader>tt", "<cmd>Themery<cr>", desc = "Theme switcher" },
    },
    opts = {
      themes = { "oscura" },
      themeConfigFile = vim.fn.stdpath("config") .. "/lua/theme.lua",
      livePreview = true,
    },
  },
  {
    "jwbaldwin/oscura.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      pcall(require, "theme")
    end,
  },
}
