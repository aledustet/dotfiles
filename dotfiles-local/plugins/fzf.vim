Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let g:_fzf_file_preview_options = '--ansi --preview "bat --theme="OneHalfDark" --style numbers,changes --decorations always --color always {}"'
let g:_fzf_find_preview_options = '--delimiter : --nth 4..' . ' ' . g:_fzf_file_preview_options
let g:_fzf_preview_size = 'right:70%'

function! Fuzzy_Files()
    call fzf#vim#gitfiles('', fzf#vim#with_preview({ 'options': g:_fzf_file_preview_options}, g:_fzf_preview_size))
endfunction

function! Fuzzy_Find()
  call fzf#vim#ag('', fzf#vim#with_preview({'options': g:_fzf_find_preview_options }, g:_fzf_preview_size))
endfunction

nnoremap <C-f> :call Fuzzy_Files()<CR>
nnoremap <C-d> :call Fuzzy_Find()<CR>

autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nornu nonu

function! FloatingFZF()
  let width = float2nr(&columns * 0.95)
  let height = float2nr(&lines * 0.85)
  let opts = { 'relative': 'editor',
              \ 'row': (&lines - height) / 2,
              \ 'col': (&columns - width) / 2,
              \ 'width': width,
              \ 'height': height,
              \ 'style': 'minimal' }

  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
