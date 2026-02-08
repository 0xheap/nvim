return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  opts = {
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
    },
    appearance = { use_nvim_cmp_as_default = true },
    sources = { default = { "lsp", "path", "snippets", "buffer" } },
  },
}
