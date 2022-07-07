local utf8 = require("modules/utf8")

vim.g.lightline = {
  colorscheme = "sonokai",

  separator = {
    left = utf8.to_char(0xe0b8),
    right = utf8.to_char(0xe0be),
  },

  subseparator = {
    left = utf8.to_char(0xe0b9),
    right = utf8.to_char(0xe0b9),
  },

  tabline_separator = {
    left = utf8.to_char(0xe0bc),
    right = utf8.to_char(0xe0ba),
  },

  tabline_subseparator = {
    left = utf8.to_char(0xe0bb),
    right = utf8.to_char(0xe0bb),
  },

  asyncrun = {
    indicator_none = "",
    indicator_run = "Running...",
  },
}


