-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map(
  "n",
  "<leader>rt",
  ":JavaTestRunCurrentClass<CR>",
  { desc = "Run current java test class." }
)
map(
  "n",
  "<leader>z",
  ":ZenMode<CR>",
  { desc = "Toggle ZenMode." }
)
