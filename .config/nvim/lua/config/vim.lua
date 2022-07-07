--
-- Contains filetype-specific configurations.
--
local per_language_configs = {
  default = {
    spaces = true,
    width = 2,
  },
}

--
-- Configure an autocommand for each language that contains a configuration.
--
for language, config in pairs(per_language_configs) do
  if config ~= "default" then
    vim.api.nvim_command(
      ("autocmd Filetype %s setlocal %s tabstop=%s shiftwidth=%s softtabstop=%s")
        :format(
          language,
          config.spaces and "expandtab" or "",
          config.width,
          config.width,
          config.width
        )
    )
  end
end

vim.opt.cino = "N-s"

--
-- Configure the default command.
--
if per_language_configs.default.spaces then
  vim.opt.expandtab = true
end

vim.opt.tabstop = per_language_configs.default.width
vim.opt.shiftwidth = per_language_configs.default.width
vim.opt.softtabstop = per_language_configs.default.width

--
-- Line number configuration.
--
vim.opt.number = true
vim.opt.relativenumber = true

--
-- Hot reload.
--
vim.api.nvim_set_keymap("n", "<leader>b", ":source ~/.config/nvim/init.lua<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>r", ":wincmd p<CR>", {})

--
-- Header guards.
--
local function is_header_file()
  return 
end

local function guard_exists(buffer)
  local first_two_lines = vim.api.nvim_buf_get_lines(buffer, 0, 2, false)
  local last_line = vim.api.nvim_buf_get_lines(buffer, -2, -1, false)[1]

  return not (
    first_two_lines[1]:match("^#ifndef %a[%d%a_]*_$") == nil or
    first_two_lines[2]:match("^#define %a[%d%a_]*_$") == nil or
    last_line ~= "#endif"
  )
end

local function guard_in_proper_path()
  local path = vim.fn.expand("%")
  return path:match("include") ~= nil and
         path:match(".[%a]+$") == ".h"
end

local function guard_create_define()
  local path = vim.fn.expand("%")
  local relative_path = ""
  for part in path:gmatch("[^/]+") do
    if part == "include" then
      relative_path = ""
      goto continue
    end

    relative_path = relative_path .. "/" .. part

    ::continue::
  end
  relative_path = relative_path:sub(2)

  if relative_path == path then
    return nil
  end

  return relative_path:gsub("[-./]", "_"):upper() .. "_"
end

vim.api.nvim_add_user_command("HeaderGuard", function(ctx)
  local buffer = vim.api.nvim_get_current_buf()

  -- Ensure a doesn't guard exist.
  if guard_exists(buffer) then
    print("A header guard already exists within this buffer.")
    return
  end

  -- Ensure we're within an include directory and a header file.
  if not guard_in_proper_path() then
    print("The current buffer is not suitable for a header guard.")
    print("1. Ensure the file extension is '.h'.")
    print("2. Ensure the file path has 'include' somewhere in it.")
    return
  end

  -- Create the guard.
  local define = guard_create_define()
  vim.api.nvim_buf_set_lines(buffer, 0, 0, false, {
    ("#ifndef %s"):format(define),
    ("#define %s"):format(define),
    "",
  })
  vim.api.nvim_buf_set_lines(buffer, -2, -1, false, {
    "",
    "#endif"
  })
end, { nargs = 0 })

vim.api.nvim_add_user_command("HeaderGuardSync", function(ctx)
  local buffer = vim.api.nvim_get_current_buf()

  -- Ensure we're within an include directory and a header file.
  if not guard_in_proper_path() then
    print("The current buffer is not suitable for a header guard.")
    print("1. Ensure the file extension is '.h'.")
    print("2. Ensure the file path has 'include' somewhere in it.")
    return
  end

  -- Ensure a guard exists.
  if not guard_exists(buffer) then
    print("Failed to find a header guard within the current buffer.")
    return
  end

  -- Update the guard.
  local define = guard_create_define()
  vim.api.nvim_buf_set_lines(buffer, 0, 2, false, {
    ("#ifndef %s"):format(define),
    ("#define %s"):format(define),
  })
end, { nargs = 0 })

vim.api.nvim_set_keymap("n", "<leader>gc", ":HeaderGuard<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":HeaderGuardSync<CR>", {})
