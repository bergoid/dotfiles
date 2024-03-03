-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local all_modes = { "n", "v", "i", "o", "c", "t" }

-- ######################################
-- # Navigate Quickfix window
-- ######################################

-- F6: go to next line
vim.keymap.set(all_modes, "<F6>", "<Esc><Esc>:update<CR>:cn<CR>zz", { noremap = true, silent = true, nowait = true })

-- Shift-F6: go to previous line
vim.keymap.set(all_modes, "<S-F6>", "<Esc><Esc>:update<CR>:cp<CR>zz", { noremap = true, silent = true, nowait = true })

-- ######################################
-- # Debugging
-- ######################################

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end

-- F5: debug
vim.keymap.set(all_modes, "<F5>", "<Esc><Esc><Leader>da", { remap = true, silent = true, nowait = true })

-- Shift-F5: stop debugging
vim.keymap.set(
  all_modes,
  "<S-F5>",
  "<Esc><Esc>:lua require'dap'.terminate()<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- F9: toggle breakpoint
vim.keymap.set(
  all_modes,
  "<F9>",
  "<Esc><Esc>:lua require'dap'.toggle_breakpoint()<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- F10: step over
vim.keymap.set(
  all_modes,
  "<F10>",
  "<Esc><Esc>:lua require'dap'.step_over()<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- F11: step into
vim.keymap.set(
  all_modes,
  "<F11>",
  "<Esc><Esc>:lua require'dap'.step_into()<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- Shift-F11: step out
vim.keymap.set(
  all_modes,
  "<S-F11>",
  "<Esc><Esc>:lua require'dap'.step_out()<CR>",
  { noremap = true, silent = true, nowait = true }
)

-- ######################################
-- # Saving, quitting
-- ######################################

-- F12: save the buffer
vim.keymap.set(all_modes, "<F12>", "<Esc><Esc>:update<CR>", { noremap = true, silent = true, nowait = true })

-- Ctrl-F12: quit neovim without saving changes
--vim.keymap.set(all_modes, "<C-F12>", "<Esc><Esc>ZQ", { noremap = true, silent = true, nowait = true })
vim.keymap.set(all_modes, "<C-F12>", "<Esc><Esc>:qa!<CR>", { noremap = true, silent = true, nowait = true })

-- Alt-F12: save file and close buffer
vim.keymap.set(all_modes, "<F60>", "<Esc><Esc>ZZ", { noremap = true, silent = true, nowait = true })
