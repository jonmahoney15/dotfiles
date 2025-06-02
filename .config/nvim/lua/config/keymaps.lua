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
  "<leader>z",
  ":ZenMode<CR>",
  { desc = "Toggle ZenMode." }
)

map( "n", "<leader>gv", ":Gitsigns preview_hunk<CR>",
  { desc = "Git Preview." }
)

map( "n", "<leader>gn", ":Gitsigns next_hunk<CR>",
  { desc = "Go to next Git change." }
)

map( "n", "<leader>gp", ":Gitsigns prev_hunk<CR>",
  { desc = "Go to previous Git change." }
)

map("v", "<leader>ss", ":Silicon<CR>",
  { desc = "Silicon Code ScreenShot" }
)
