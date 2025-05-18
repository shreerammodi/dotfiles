let os=substitute(system("uname"), "\n", "", "")

if os ==? "Darwin"
  let g:vimtex_view_method="skim"
elseif os ==? "Linux"
  let g:vimtex_view_method="general"
endif

setlocal conceallevel=0

setlocal spell

let g:vimtex_quickfix_ignore_filters = [
            \ 'Underfull',
            \ 'Overfull',
            \]
