Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

function! Fuzzy_Files()
    let g:fzf_files_options = '--preview "bat --theme="TwoDark" --style=numbers,changes --color always {}"'
    call fzf#vim#files('', fzf#vim#with_preview('right'))
endfunction

function! Fuzzy_Find()
  call fzf#vim#ag('', fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right'))
endfunction

nnoremap <C-f> :call Fuzzy_Files()<CR>
nnoremap <C-d> :call Fuzzy_Find()<CR>

let branch_files_options = { 'source': 'branch_files' }
let uncommited_files_options = { 'source': 'branch_files -w' }

command! BranchFiles call fzf#run(fzf#wrap('BranchFiles',
            \ extend(branch_files_options, { 'options': s:diff_options }), 0))
command! UncommitedFiles call fzf#run(fzf#wrap('UncommitedFiles',
            \ extend(uncommited_files_options, { 'options': s:diff_options }), 0))
nnoremap <silent> <leader>gp :BranchFiles<cr>
nnoremap <silent> <leader>GP :UncommitedFiles<cr>

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
