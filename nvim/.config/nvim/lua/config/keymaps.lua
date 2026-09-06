-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<ESC>")

vim.keymap.set('n', 'sh', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', 'sl', '<C-w>l', { desc = 'Move to right split' })
vim.keymap.set('n', 'sj', '<C-w>j', { desc = 'Move to split below' })
vim.keymap.set('n', 'sk', '<C-w>k', { desc = 'Move to split above' })

vim.keymap.set("n", "<leader>sf", function()
  Snacks.picker.git_grep()
end, { desc = "Grep (Git Files)" })

--- Obsidian Keymaps 

-- Standard command maps
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "New Note" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<cr>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search Vault" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Quick Switch" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "Show Backlinks" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "Search Tags" })
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "Rename Note & Update Links" })
vim.keymap.set("n", "<leader>oT", "<cmd>ObsidianNewFromTemplate<cr>", { desc = "New note with a template" })

-- Visual mode map to convert text into a link
vim.keymap.set("v", "<leader>ol", "<cmd>ObsidianLink<cr>", { desc = "Link Text to Note" })
vim.keymap.set("v", "<leader>on", "<cmd>ObsidianLinkNew<cr>", { desc = "Link Text to New Note" })
