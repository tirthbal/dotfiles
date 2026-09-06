-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- gd: fall back to a ctags lookup when the LSP returns no definition.
-- Some legacy JS files (huge Sails models/services with self-referencing
-- globals) make tsserver/vtsls infer `any` and return zero results, even
-- though a `tags` file in the project has the real location.
local function goto_definition_with_tags_fallback()
  vim.lsp.buf.definition({
    on_list = function(options)
      local items = options.items
      if not items or #items == 0 then
        local word = vim.fn.expand("<cword>")
        local ok = pcall(vim.cmd, "tag " .. word)
        if not ok then
          vim.notify("gd: no LSP definition and no tag for '" .. word .. "'", vim.log.levels.WARN)
        end
        return
      end
      vim.fn.setqflist({}, " ", options)
      if #items == 1 then
        vim.cmd("cfirst")
      else
        vim.cmd("copen")
      end
    end,
  })
end

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("gd_ctags_fallback", { clear = true }),
  callback = function(args)
    local buffer = args.buf
    -- Deferred: LazyVim's own LspAttach handler (which sets its stock `gd`)
    -- runs synchronously off this same event. Scheduling ours ensures it is
    -- applied last, regardless of autocmd registration order, so it wins the
    -- buffer-local keymap instead of being silently overwritten.
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(buffer) then
        return
      end
      vim.keymap.set("n", "gd", goto_definition_with_tags_fallback, {
        buffer = buffer,
        desc = "Goto Definition (ctags fallback)",
      })
    end)
  end,
})
