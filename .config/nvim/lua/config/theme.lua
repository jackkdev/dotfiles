if vim.fn.exists("+termguicolors") then
  vim.opt.termguicolors = true
end

vim.g.sonokai_style = "atlantis"
vim.g.sonokai_enable_italic = true
vim.g.sonokai_disable_italic_comment = true
vim.g.sonokai_transparent_background = true

vim.opt.background = "dark"
vim.cmd("colorscheme sonokai")


