
set runtimepath+=~/.vim-plugins/LanguageClient-neovim 

  set mouse=a
  set tabstop=2
  set shiftwidth=2
  set smartindent
  set expandtab

  set number
  syntax on

  let $DOTFILES_PATH='~'
  set guicursor= "fix for broken neovim

  set wildmenu
  set undofile
  set undodir=~/.undodir

  " Javascript-y things
  autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
  autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx

  "set autochdir
  filetype plugin on

  filetype indent on

  "set list listchars=tab:>\ ,trail:.,extends:$,nbsp:_

  let g:python2_host_prog = '/usr/bin/python'
  let g:python3_host_prog = '/usr/local/bin/python3'

  let mapleader = " "
  source $DOTFILES_PATH/.config/nvim/autoload/plug.vim
  source $DOTFILES_PATH/.config/nvim/bundle/plugins.vim
  source $DOTFILES_PATH/.config/nvim/shortcuts.vim

" to hack on conf at all times

  nnoremap <silent> <leader>' :tabedit ~/.config/nvim/bundle/plugins.vim<CR>:vsp ~/.config/nvim/init.vim<CR>
  augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC hi Comment ctermfg=green
  augroup END " }


" hjkl extened moves

  nnoremap <Leader>l <C-w><Right>
  nnoremap <Leader>h <C-w><Left>
  nnoremap <Leader>j <C-w><Down>
  nnoremap <Leader>k <C-w><Up>
  "nnoremap <Leader>s :update<CR>
  nmap <leader>w :tabnext
  nmap <leader>q :tabprev

" clear search results
  nnoremap <Leader>/ :noh<CR>

" copy paste

  nmap <leader>v "+gP<CR>
  vmap <leader>c "+y<CR>
  vmap <leader>x "+x<CR>

  " Files
  nnoremap <Space>v :BufExplorer <CR>
  nnoremap <Leader>g :Rg <C-r>=expand('<cword>')<CR><CR>
  nnoremap <Leader>f :FZF -q <C-r>=expand('<cword>')<CR><CR>

" ngrep browse results
  nnoremap <Leader>n :cnext<CR>
  nnoremap <Leader>b :cprev<CR>`
" colors
  set termguicolors " need this to get decent colors

  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set background=dark " or light

  let $BAT_THEME='lucid'
  autocmd VimEnter * colorscheme lucid
  "colorscheme summerfruit256
  hi NonText guifg=black ctermfg=black

" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Formatting everything
map <leader>r gg=G<C-o>

" tag bar
  let g:tagbar_left=1
  let g:tabbar_width=49

  let g:tagbar_type_go = {
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
          \ 'p:package',
          \ 'i:imports:1',
          \ 'c:constants',
          \ 'v:variables',
          \ 't:types',
          \ 'n:interfaces',
          \ 'w:fields',
          \ 'e:embedded',
          \ 'm:methods',
          \ 'r:constructor',
          \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
          \ 't' : 'ctype',
          \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
          \ 'ctype' : 't',
          \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
      \ }

  "set background=light
  "


nmap <c-w>z :call zoom#toggle()<CR>


" elixir crap

au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir

let NERDTreeShowHidden=1

"if executable('opam')
  "let g:opamshare=substitute(system('opam var share'),'\n$','','''')
  "if isdirectory(g:opamshare."/merlin/vim")
    "execute "set rtp+=" . g:opamshare."/merlin/vim"
  "endif
"endif

augroup mygroup
  au!
  au FileType rust
      \ hi Special guifg=#00ff00
      \ hi PreProc guifg=#00ffff 

augroup END

augroup vimmer
  au!
  au FileType,SourceCmd vim highlight Comment guifg=#00ff00
  au FileType,SourceCmd vim highlight Special guifg=#ff6666

  au StdinReadPost  *.vim highlight Comment guifg=#00ff00
augroup END

highlight Comment guifg=#00ff00

