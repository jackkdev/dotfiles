--
-- Language Server
--

vim.opt.encoding = "utf-8"

--
-- Prettier
--
vim.api.nvim_command("command! -nargs=0 CocPrettier :CocCommand prettier.formatFile")
vim.api.nvim_set_keymap("n", "<Leader>p", ":CocPrettier<CR>", {})

--
-- Mappings
--
vim.api.nvim_set_keymap("n", "<Leader><C-Space>", ":call coc#refresh()<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("n", "gd", "<Plug>(coc-definition)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)<CR>", { silent = true })
vim.api.nvim_set_keymap("n", "gh", ":call CocAction('doHover')<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "rn", "<Plug>(coc-rename)<CR>", { silent = true, noremap = true })

vim.api.nvim_set_keymap("i", "<C-space>", "coc#refresh()", { expr = true, silent = true, noremap = true })

--
-- Required Vim Options
--
vim.g.hidden = true
vim.g.backup = false
vim.g.writebackup = false
