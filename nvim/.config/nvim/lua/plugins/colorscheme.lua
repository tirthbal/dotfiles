return {
  {
    "shaunsingh/nord.nvim",
    lazy = false, -- Make sure it loads during startup
    priority = 1000, -- Load before other start plugins
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night", -- Options: storm, moon, night, day
      transparent = true, -- Enable transparent background
    },
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      integrations = {
        lualine = true,
        bufferline = true,
        gitsigns = true,
        telescope = true,
        notify = false,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
