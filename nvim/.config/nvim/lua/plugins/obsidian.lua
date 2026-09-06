local obs_root = vim.fn.expand("~/Documents/obs")
local vault1_path = obs_root .. "/personal"
local vault2_path = obs_root .. "/work"
return {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = true,
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to :h file-pattern for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  event = {
    "BufReadPre " .. vault1_path .. "/**",
    "BufReadPre " .. vault2_path .. "/**",
    "BufNewFile " .. vault1_path .. "/**",
    "BufNewFile " .. vault2_path .. "/**",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- see below for full list of optional dependencies ¿
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obs/personal",
      },
      {
        name = "work",
        path = "~/Documents/obs/work",
        -- Optional, override certain settings.
        overrides = {
          notes_subdir = "notes",
        },
      },
    },
    templates = {
        folder = "~/Documents/obs/templates/",
        date_format = "%A, %-d %B %Y",
        time_format = "%H:%M",
    },
    -- Optional, if you keep notes in a specific subdirectory of your vault.
    notes_subdir = "notes",
    -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
    -- levels defined by "vim.log.levels.*".
    log_level = vim.log.levels.INFO,
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "notes/dailies",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to change the date format of the default alias of daily notes.
      alias_format = "%B %-d, %Y",
      -- Optional, default tags to add to each new daily note created.
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "daily.md"
    },

    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      checkboxes = {
        [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        ["x"] = { char = "✔", hl_group = "ObsidianDone" },
        [">"] = { char = "➜", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "~", hl_group = "ObsidianTilde" },
        ["!"] = { char = "!", hl_group = "ObsidianImportant" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" }, -- needs a Nerd Font; use "" plain text if you don't have one patched
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
    -- see below for full list of options ¿
    -- controls how new note filenames are generated
    note_id_func = function(title)
      local date = os.date("%Y-%m-%d") -- e.g. 2026-08-31
      if title ~= nil and title ~= "" then
        -- slugify the title: lowercase, spaces -> hyphens, strip weird chars
        local slug = title:gsub(" ", "-"):gsub("[^%w-]", ""):lower()
        return date .. "_" .. slug
      else
        -- no title given, fall back to date + random suffix to avoid collisions
        local suffix = ""
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(97, 122))
        end
        return date .. "_" .. suffix
      end
    end,

  },
}
