return {
  {
  "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = { auto_show = false }, -- don't pop docs for every highlighted item; press K or use the manual key
        trigger = { show_on_trigger_character = true },
        menu = { auto_show = true },
      },
      signature = { window = { show_documentation = false } }, -- signature help without doc bloat

      sources = {
        default = { "lsp", "path", "snippets" }, -- drop "buffer" entirely — it's the #1 noise source
        min_keyword_length = 2, -- don't show anything until 2+ chars typed
        providers = {
          lsp = { score_offset = 3 }, -- rank real LSP results above snippets/path
          snippets = { score_offset = -3, min_keyword_length = 2 },
          buffer = { min_keyword_length = 4 }, -- if you do keep buffer, require longer prefixes
        },
      },
    },
  },
  { "mason-org/mason.nvim", opts = {} },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    opts = { ensure_installed = { "lua_ls", "pyright" } }, -- add servers you need
  },
}

