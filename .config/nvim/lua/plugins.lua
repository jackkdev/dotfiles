return require("packer").startup(function()
  use "wbthomason/packer.nvim"

  --
  -- Section: Theme Plugins
  --
  use "nvim-treesitter/nvim-treesitter"
  use "preservim/nerdtree"
  use "sainnhe/sonokai"

  --
  -- Section: Statusline Plugins
  --
  use "itchyny/lightline.vim"
  use "sainnhe/artify.vim"
  use "albertomontesg/lightline-asyncrun"
  use "rmolin88/pomodoro.vim"
  use "ryanoasis/vim-devicons"

  --
  -- Section: General Plugins
  --
  use {"neoclide/coc.nvim", branch = "release"}
  use "mattn/emmet-vim"
end)
