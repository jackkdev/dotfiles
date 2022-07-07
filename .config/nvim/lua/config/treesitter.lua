local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "c", "cpp", 
    "lua", 
    "typescript", "javascript",
  },

  highlight = {
    enable = true,
  }
})
