call plug#begin('~/.config/nvim/bundle')
  Plug 'honza/vim-snippets'

  Plug 'dhruvasagar/vim-zoom'
  Plug 'tpope/vim-haml'
  Plug 'slim-template/vim-slim'
  Plug 'clojure-vim/clojure.vim'
  Plug 'tpope/vim-salve'
  Plug 'tpope/vim-fireplace'
  "Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-projectionist'

  Plug 'luochen1990/rainbow'
  Plug 'Yggdroot/indentLine'
  "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sheerun/vim-polyglot'

  Plug 'Olical/conjure'
  Plug 'guns/vim-sexp',    {'for': 'clojure'}


  Plug 'udalov/kotlin-vim'
  Plug 'vim-scripts/utl.vim'
  Plug 'tpope/vim-speeddating'
  Plug 'jceb/vim-orgmode'

  "Plug 'jremmen/vim-ripgrep'
  Plug 'jlanzarotta/bufexplorer'

  Plug 'tpope/vim-fugitive'
  Plug 'gregsexton/gitv'
  Plug 'airblade/vim-gitgutter'


  Plug 'benekastah/neomake' " for linters and other jobs

  Plug 'tpope/vim-unimpaired'

  Plug 'alvan/vim-closetag' " Auto-close HTML tags

  Plug 'itchyny/lightline.vim'
  Plug 'mbbill/undotree'

  Plug 'neoclide/dfoc.nvim', {'tag': 'v0.0.82'} 
  Plug 'yaegassy/coc-pylsp', {'do': 'yarn install --frozen-lockfile'}
  Plug 'MaxMEllon/vim-jsx-pretty'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'

  Plug 'tmhedberg/matchit'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'jlanzarotta/bufexplorer'

  Plug 'scrooloose/nerdtree'

  Plug 'elixir-editors/vim-elixir'
  Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

  Plug 'scrooloose/nerdcommenter'
  Plug 'majutsushi/tagbar'
  Plug 'Shougo/neosnippet.vim'
  "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  "Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }" Unite replacement
  "Plug 'zchee/deoplete-jedi' " Python static analysis engine
  "Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'tpope/vim-repeat'
  
  Plug 'janko-m/vim-test'
  Plug 'preservim/vimux'
  Plug 'leshill/vim-json'
  Plug 'posva/vim-vue'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-haml'
  Plug 'wlangstroth/vim-racket'

  Plug 'gabrielelana/vim-markdown'

 " if $GOPATH != ""
    "Plug 'zchee/deoplete-go', { 'do': 'make'}
    "Plug 'fatih/vim-go'
    "Plug 'rhysd/vim-go-impl'
 " endif
  Plug 'timonv/vim-cargo'
  Plug 'neoclide/coc-rls'
  Plug 'rust-lang/rust.vim'

  Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass'] }
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/yajs.vim', { 'for': 'javascript' }
  Plug 'kchmck/vim-coffee-script'
  Plug 'othree/html5.vim'
  Plug 'groenewege/vim-less', { 'for': 'less' }
  Plug 'honza/dockerfile.vim'
  
  Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
  Plug 'cespare/vim-toml', {'branch': 'main'}
  Plug 'leafgarland/typescript-vim', { 'for': 'ts' } " TypeScript
  Plug 'tomlion/vim-solidity', { 'for': 'solidity' } " ETH

  "Plug 'arakashic/nvim-colors-solarized'
  Plug 'whatyouhide/vim-gotham', {'branch': 'main'}

  Plug 'mhartington/oceanic-next'
  Plug 'baeuml/summerfruit256.vim'

  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }



  if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
  endif

call plug#end()
" LangServer sample config:  Required for operations modifying multiple buffers like rename.
    "set hidden

    "let g:LanguageClient_serverCommands = {
        "\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        "\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        "\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
        "\ 'python': ['/usr/local/bin/pyls'],
        "\ 'ruby': ['~/.rvm/gems/ruby-2.6.5@web-chat/bin/solargraph', 'stdio'],
        "\ }
    "nnoremap <silent> <F5> :call LanguageClient#contextMenu()<CR>
    "nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    "nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    "nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "autocmd FileType ruby setlocal omnifunc=LanguageClient#complete

" rainbow parens
  let g:rainbow_active = 1
" fzf stuffs
  let $FZF_DEFAULT_OPTS = '--reverse'
  nnoremap <Leader>x :History<CR>
  let g:fzf_layout = { 'down':  '40%' }

  command! -bang -nargs=* Rg
    \ call fzf#vim#grep('rg --smart-case --line-number --no-heading --color=always --colors "path:fg:93,169,245" --colors "line:fg:128,128,128" --colors "match:fg:195,232,141" --no-hidden --ignore ' . shellescape(<q-args>),
    \ 0,
    \ fzf#vim#with_preview({'options': '-e --delimiter : --nth 3..'}),
    \ <bang>0)

"command! -bang -nargs=? -complete=dir Files
    "\ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" rusty-tags setup
  " make test commands execute using dispatch.vim
  let test#strategy = "vimux"

  autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
  autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" COC config 
  let g:coc_global_extensions = [ 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-tslint', 'coc-tslint-plugin', 'coc-css', 'coc-json', 'coc-pyls', 'coc-yaml', 'coc-pairs', 'coc-solargraph', 'coc-clojure' ]

  " Better display for messages
  set cmdheight=2
  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300
  " don't give |ins-completion-menu| messages.
  set shortmess+=c
  " always show signcolumns
  set signcolumn=yes

  " Use `lp` and `ln` for navigate diagnostics
  nmap <silent> <leader>lp <Plug>(coc-diagnostic-prev)
  nmap <silent> <leader>ln <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> <leader>ld <Plug>(coc-definition)
  nmap <silent> <leader>lt <Plug>(coc-type-definition)
  nmap <silent> <leader>li <Plug>(coc-implementation)
  nmap <silent> <leader>lf <Plug>(coc-references)
  
  " reformat code
  nmap <leader>f  <Plug>(coc-format-selected)
  vmap <leader>f  <Plug>(coc-format-selected)

  " Remap for rename current word
  nmap <leader>lr <Plug>(coc-rename)

  " Use K for show documentation in preview window
  nnoremap K :call <SID>show_documentation()<CR>

  "let c = getchar()
  function! Fofo()
    coc#select_confirm()
  endfunction
  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice
  inoremap <expr> <Tab> coc#pum#confirm()
  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " GoTODefintions
  function! s:GoToDefinition()
    if CocAction('jumpDefinition')
      return v:true
    endif

    let ret = execute("silent! normal \<C-]>")
    if ret =~ "Error" || ret =~ "错误"
      call searchdecl(expand('<cword>'))
    endif
  endfunction

nmap <silent> " :call CocActionAsync('doHover')<CR>
nmap <silent> gd :call <SID>GoToDefinition()<CR>

" Coc Cusoms
let g:coc_disable_startup_warning = 1

" NERDTree settings
" Nerdtree
  nnoremap <silent> <Leader>m :NERDTreeFind<CR>
  nnoremap <Leader>a :execute bufwinnr('NERD_tree') . 'wincmd w'<CR>
  nnoremap <Leader>g :execute bufwinnr('NERD_tree') . 'wincmd w'<CR>
  nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
  let NERDTreeMapPreview = 'w'
  let NERDTreeWinSize = 50
" limelight conf

  let g:limelight_conceal_ctermfg='darkgray'

"" deoplete config

  "let g:deoplete#enable_at_startup = 1
  "" disable autocomplete
  "let g:deoplete#disable_auto_complete = 1
  "" deoplete go
  "set completeopt+=noinsert
  "set completeopt+=noselect

  "inoremap <silent><expr><C-b> deoplete#mappings#manual_complete()

" UnDo Tree
  nnoremap <Leader>u :UndotreeToggle<CR>
  let g:undotree_SetFocusWhenToggle=1

" UltiSnips config

  "inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  "let g:UltiSnipsExpandTrigger="<tab>"
  "let g:UltiSnipsJumpForwardTrigger="<tab>"
  ""let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" tagbar setup

  nmap <leader>= :TagbarToggle<CR>

" neosnippet

  imap <C-k> <Right><Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Right><Plug>(neosnippet_expand_or_jump)

  " Use honza's snippets.
  let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'

  " Enable neosnippet snipmate compatibility mode
  let g:neosnippet#enable_snipmate_compatibility = 1

  " Disable runtime snippets
  let g:neosnippet#disable_runtime_snippets = { "_": 1, }

  " For snippet_complete marker.
  if has('conceal')
      set conceallevel=2 concealcursor=i
  endif

  " Disable the neosnippet preview candidate window
  " When enabled, there can be too much visual noise
  " especially when splits are used.
  " set completeopt-=preview

" ctrlp 
    nnoremap <C-s> :CtrlPBuffer<CR>
    nnoremap <leader>s :CtrlPBuffer<CR>
    nnoremap <leader>p :CtrlPBuffer<CR>
    let g:ctrlp_cmd = 'CtrlPMixed' " Search all the things.
    let g:ctrlp_working_path_mode = 'ra' " Nearest ancestor
    let g:ctrlp_mruf_max = 25
    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
        \ 'file': '\v\.(jpeg|jpg|png|exe|so|dll)$' }

"    let g:ctrlp_user_command = {
        "\ 'types': {
            "\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others|grep -v ".png\$"'],
            "\ 2: ['.hg', 'hg --cwd %s locate -I .'],
        "\ },
        "\ 'fallback': 'find %s -type f'
    "\ }
    "" Reuse already-open buffers? (Default: 'Et')
    let g:ctrlp_switch_buffer = 'E'
    nnoremap \be :CtrlPBuffer<CR>


    nnoremap <silent> <Leader>\ :CtrlP<CR>
    nnoremap <silent> <Leader>] :CtrlPMRU<CR>
    nnoremap <leader>p :CtrlP<cr>


    let g:go_highlight_types = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    nmap <c-f> :Files<CR>


" RUBY FOLDING
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> \rf :TestNearest<CR>
nmap <silent> \rb :TestFile<CR>
nmap <silent> \ra :TestSuite<CR>
nmap <silent> \rl :TestLast<CR>
nmap <silent> \ro :TestVisit<CR>


