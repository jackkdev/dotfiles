vim.api.nvim_set_keymap("n", "<leader>t", ":NERDTreeFocus<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":NERDTree<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-f>", ":NERDTreeFind<CR>", { noremap = true })

vim.api.nvim_exec("autocmd StdinReadPre * let s:std_in = 1", false)
vim.api.nvim_exec("autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | wincmd p | endif", false)

vim.api.nvim_exec([[
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
]], false)


