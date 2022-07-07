-- clear cache for reload
for key, _ in pairs(package.loaded) do
  package.loaded[key] = nil
end

vim.api.nvim_exec([[
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
]], true)

require("init")
