return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          settings = {
            javascript = {
              inlayHints = {
                parameterNames = {
                  enabled = "none",
                },
                parameterTypes = {
                  enabled = false,
                },
                propertyDeclarationTypes = {
                  enabled = false,
                },
                functionLikeReturnTypes = {
                  enabled = false,
                },
                enumMemberValues = {
                  enabled = false,
                },
                variableTypes = {
                  enabled = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
