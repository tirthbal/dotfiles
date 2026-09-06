return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function(_, opts)
    -- Custom component: unpushed/unpulled commit counts vs upstream
    local function git_ahead_behind()
      local result = vim.fn.systemlist(
        "git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null"
      )[1]
      if not result or result == "" then
        return ""
      end
      local behind, ahead = result:match("(%d+)%s+(%d+)")
      local parts = {}
      if ahead and tonumber(ahead) > 0 then
        table.insert(parts, "↑" .. ahead)
      end
      if behind and tonumber(behind) > 0 then
        table.insert(parts, "↓" .. behind)
      end
      return table.concat(parts, " ")
    end

    -- Custom component: indent style (spaces vs tabs) and width
    local function indent_info()
      if vim.bo.expandtab then
        return "Spaces: " .. vim.bo.shiftwidth
      else
        return "Tabs: " .. vim.bo.tabstop
      end
    end

    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }
      },
      sections = {
        lualine_a = {{
          'mode', }},
        lualine_b = {
          'branch',
        { git_ahead_behind, color = { fg = "#89b4fa" } },
          'diagnostics'
        },
        lualine_c = {
          'filename'
        },
        lualine_x = {'encoding', 'fileformat', 'filetype', { indent_info, color = { fg = "#f9e2af" } }},
        lualine_y = {'progress', 'searchcount'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
    return opts

    -- opts.options.theme = "catppuccin"
    -- opts.options.section_separators = { left = "", right = "" }
    -- opts.options.component_separators = { left = "", right = "" }
    --
    -- opts.sections = {
    --   lualine_a = {
    --     "mode" ,
    --     "buffers",
    --     show_filename_only = true,   -- Shows shortened relative path when set to false.
    --     hide_filename_extension = false,   -- Hide filename extension when set to true.
    --     show_modified_status = true, -- Shows indicator when the buffer is modified.
    --   },
    --   lualine_b = {
    --     "branch",
    --     -- { git_ahead_behind, color = { fg = "#89b4fa" } },
    --   },
    --   lualine_c = {
    --     {
    --       "diff",
    --       symbols = { added = " ", modified = " ", removed = " " },
    --       colored = true,
    --     },
    --   },
    --   lualine_x = {
    --     {
    --       "diagnostics",
    --       sources = { "nvim_diagnostic" },
    --       symbols = { error = " ", warn = " ", info = " ", hint = " " },
    --     },
    --   },
    --   lualine_y = {
    --     "filetype",
    --     { indent_info, color = { fg = "#f9e2af" } },
    --   },
    --   lualine_z = {
    --     { "filename", path = 1 },
    --   },
    -- }

  end,
}


-- return {
--   "nvim-lualine/lualine.nvim",
--   opts = {
--     options = {
--       icons_enabled = true,
--       theme = 'catppuccin',
--       component_separators = { left = '', right = ''},
--       section_separators = { left = '', right = ''},
--       disabled_filetypes = {
--         statusline = {},
--         winbar = {},
--       },
--       ignore_focus = {},
--       always_divide_middle = true,
--       always_show_tabline = true,
--       globalstatus = false,
--       refresh = {
--         statusline = 1000,
--         tabline = 1000,
--         winbar = 1000,
--         refresh_time = 16, -- ~60fps
--         events = {
--           'WinEnter',
--           'BufEnter',
--           'BufWritePost',
--           'SessionLoadPost',
--           'FileChangedShellPost',
--           'VimResized',
--           'Filetype',
--           'CursorMoved',
--           'CursorMovedI',
--           'ModeChanged',
--         },
--       }
--     },
--     sections = {
--       lualine_a = {'mode'},
--       lualine_b = {'branch', 'git_ahead_behind', 'diagnostics'},
--       lualine_c = {'filename'},
--       lualine_x = {'encoding', 'fileformat', 'filetype'},
--       lualine_y = {'progress', 'searchcount'},
--       lualine_z = {'location'}
--     },
--     inactive_sections = {
--       lualine_a = {},
--       lualine_b = {},
--       lualine_c = {'filename'},
--       lualine_x = {'location'},
--       lualine_y = {},
--       lualine_z = {}
--     },
--     tabline = {},
--     winbar = {},
--     inactive_winbar = {},
--     extensions = {}
--   },
-- }
