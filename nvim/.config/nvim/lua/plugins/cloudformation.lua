return {
  -- Add SchemaStore plugin for automatic AWS JSON schema resolution
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
  },

  -- Configure yamlls via nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                enable = false, -- Disable built-in store to use SchemaStore.nvim instead
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
              -- Custom tags stop yamlls from throwing errors on AWS short-form functions
              customTags = {
                "!And",
                "!And sequence",
                "!Base64",
                "!Cidr",
                "!Equals",
                "!Equals sequence",
                "!FindInMap",
                "!FindInMap sequence",
                "!GetAZs",
                "!GetAtt",
                "!If",
                "!If sequence",
                "!ImportValue",
                "!ImportValue sequence",
                "!Join",
                "!Join sequence",
                "!Not",
                "!Not sequence",
                "!Or",
                "!Or sequence",
                "!Ref",
                "!Select",
                "!Select sequence",
                "!Split",
                "!Split sequence",
                "!Sub",
                "!Sub sequence",
              },
            },
          },
        },
      },
    },
  },
}

