return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<C-p>",
        function()
          local fzf = require("fzf-lua")
          if vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null"):match("true") then
            fzf.git_files()
          else
            fzf.files()
          end
        end,
        desc = "Files",
      },
    },
  },
}
