"   _  __             _                                  ____ __   
"  / |/ /__ ___ _  __(_)_ _    __ _  ___ ___ ___ __ __  / _(_) /__ 
" /    / -_) _ \ |/ / /  ' \  /  ' \/ -_|_-<(_-</ // / / _/ / / -_)
"/_/|_/\__/\___/___/_/_/_/_/ /_/_/_/\__/___/___/\_, / /_//_/_/\__/ 
"                                              /___/               
" Version : 2020-05

" VUNDLE CONFIGURATION {{{1
"-----------------------------------

filetype off

exe 'set rtp+=' . $GOPATH . '/src/github.com/junegunn/fzf'

"dein Scripts
if &compatible
    set nocompatible               " Be iMproved
endif

" PLUGIN LIST {{{1
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/dein.vim') " Plugin manager on steroid
    call dein#add('haya14busa/dein-command.vim') " Utility commands of dein.vim with rich completion.

    " Add or remove your plugins here:
    " COMMENT Commented {{{2
    call dein#add('preservim/nerdcommenter') " Vim plugin for intensely nerdy commenting powers 

    " FILE FORMAT {{{2
    call dein#add('elzr/vim-json') " Distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing.

    " SNIPPET {{{2
    call dein#add('SirVer/ultisnips') " UltiSnips is the ultimate solution for snippets in Vim

    " SEARCH && REPLACE {{{2
    call dein#add('dyng/ctrlsf.vim') " An ack/ag/pt/rg powered code search and view tool
    call dein#add('tpope/vim-abolish') " Easily search for, substitute, and abbreviate multiple variants of a word
    call dein#add('tpope/vim-surround') " Quoting/parenthesizing made simple 
    call dein#add('markonm/traces.vim') " Range, pattern and substitute preview for Vim 

    " COMPILATION - LITING {{{2
    call dein#add('neoclide/coc.nvim', {'branch': 'release'}) " Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode 
    call dein#add('neomake/neomake') " Asynchronous linting and make framework for Neovim/Vim 

    " GIT {{{2
    call dein#add('tpope/vim-fugitive') " A Git wrapper so awesome, it should be illegal
    call dein#add('tpope/vim-rhubarb') " GitHub extension for fugitive.vim
    call dein#add('mhinz/vim-signify') " ➕ Show a diff using Vim its sign column.

    " INTERFACE {{{2
    call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) " A command-line fuzzy finder 
    call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' }) " fzf ❤️  vim 
    call dein#add('nathanaelkane/vim-indent-guides') " A Vim plugin for visually displaying indent levels in code 
    call dein#add('bling/vim-airline') " Lean & mean status/tabline for vim that's light as air 
    call dein#add('ryanoasis/vim-devicons') " Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more 
    call dein#add('preservim/nerdtree') " A tree explorer plugin for vim. 
    call dein#add('Xuyuanp/nerdtree-git-plugin') " A plugin of NERDTree showing git status 

    " MAPPINGS {{{2
    call dein#add('tpope/vim-unimpaired') " Pairs of handy bracket mappings

    " PYTHON {{{2
    call dein#add('vim-scripts/indentpython.vim') " An alternative indentation script for python
    call dein#add('jmcantrell/vim-virtualenv') " Vim plugin for working with python virtualenvs
    call dein#add('hdima/python-syntax') " Python syntax highlighting for Vim

    " GOLANG {{{2
    call dein#add('fatih/vim-go') " Go development plugin for Vim

    " TERRAFORM {{{2
    call dein#add('hashivim/vim-terraform') " Basic vim/terraform integration (Higlight)
    "call dein#add('juliosueiras/vim-terraform-completion') " A (Neo)Vim Autocompletion and linter for Terraform, a HashiCorp tool

    " ANSIBLE {{{2
    call dein#add('pearofducks/ansible-vim') " A vim plugin for syntax highlighting Ansible's common filetypes 
    call dein#add('arouene/vim-ansible-vault') " Vault and Unvault inline values of Yaml files

    " THEME {{{2
    call dein#add('joshdick/onedark.vim') " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
    call dein#add('freeo/vim-kalisi') " The colorscheme with neovim in mind 
    call dein#add('morhetz/gruvbox') " Retro groove color scheme for Vim 

    " SOURCE CODE {{{2
    call dein#add('ludovicchabant/vim-gutentags') " A Vim plugin that manages your tag files

    " FOLDING Commented {{{2
    call dein#add('Konfekt/FastFold') " Speed up Vim by updating folds only when called-for. TODO study it

    " PRODUCTIVITY {{{2 TODO configure yarn
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app & yarn install"' }) " Markdown preview plugin for (neo)vim 

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------
"}}}1

" CONFIG PLUGIN {{{1

" Airline setup {{{2
"-----------------------------------
set laststatus=2
set statusline+=%{fugitive#statusline()}
set statusline+=%{virtualenv#statusline()}
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled=1

" CtrlSF setup {{{2
"-----------------------------------
let g:ctrlsf_args_ignoredir = ['.fact', '.terraform']

" COC {{{2
" ----------------------------------
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" NERDTree setup {{{2
" ----------------------------------
" Ignore files
let NERDTreeIgnore = ['\.pyc$']
" AutoClose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Bookmark
let NERDTreeShowBookmarks=1
" Mirroring between tabs
let NERDTreeMirror=0

" NerdTree activation {{{2
"----------------------------------
map <F2> <ESC>:NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
   \ "Modified"  : "◁",
   \ }

" UltiSnips {{{2
" ----------------------------------
let g:UltiSnipsExpandTrigger       = "<C-n>" " TODO change it
let g:UltiSnipsJumpForwardTrigger  = "<C-m>" " TODO change it
"let g:UltiSnipsJumpBackwardTrigger = "<C-h>" " TODO change it
"let g:UltiSnipsListSnippets        = "<C-k>" "List possible snippets based on current file

" Vim-go {{{2
" ----------------------------------
let g:go_def_mode='gopls' " TODO check if it's working
let g:go_info_mode='gopls' " TODO check if it's working

" Vim-indent-guides {{{2
" ----------------------------------
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Function enable indentguide
augroup IndentGuides
    autocmd!
    autocmd VimEnter * IndentGuidesEnable
augroup END

" Neomake {{{2
" ----------------------------------
let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'pylama']
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501, E702, F403'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266'], }

let g:neomake_go_enabled_makers = [ 'go', 'golangcifast' ]
let g:neomake_go_golangcifast_maker = {
            \ 'exe': 'golangci-lint',
            \ 'args': [ 'run', '--fast', ],
            \ 'append_file': 0,
            \ 'cwd': '%:h',
            \ }

" TODO check if this is useful
function! LocationNext()
    try
        lnext
    catch
        try | lfirst | catch | endtry
    endtry
endfunction

function! LocationPrevious()                                                                  
    try
        lprev
    catch
        try | lfirst | catch | endtry
    endtry
endfunction

nnoremap <leader>e :call LocationNext()<cr>
nnoremap <leader><S-e> :call LocationPrevious()<cr>

" Debug
"let g:neomake_verbose = 3
"let g:neomake_logfile='/tmp/error.log'

autocmd! BufWritePost * Neomake

" Colorscheme {{{2
" ----------------------------------
set timeout
set timeoutlen=750
set ttimeoutlen=250
set t_Co=256
set background=dark

colorscheme gruvbox
let g:gruvbox_termcolors=256

"colorscheme onedark
"let g:onedark_termcolors=256

"colorscheme kalisi
"colorscheme solarized
"let g:solarized_termcolors=256

if has('nvim')
 set t_ut=
 set t_ZH=�[3m
 set t_ZR=�[23m

 set ttimeout
 set ttimeoutlen=0

endif

" Folding {{{2
" ----------------------------------

" Enable folding with the spacebar
nnoremap <space> za

" Signify setup {{{2
" ----------------------------------
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" FZF {{{2
" ----------------------------------

" Theme selector {{{3
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

" For MRU files {{{3
function! s:all_files()
 return extend(
 \ filter(copy(v:oldfiles),
 \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
 \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

command! FZFMru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

" Mapping {{{3
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-h> :FZFMru<CR> 
nnoremap <silent> <leader>B :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>r :History:<CR>
nnoremap <silent> <leader>/ :History/<CR>

nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

" Mapping selecting mappings {{{3
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Remove status line when fzf run {{{3
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
 \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" MarkdownPreview setup {{{2
" ----------------------------------
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

" traces.vim {{{2
" ----------------------------------
set inccommand=""

" ctrlsf.vim search {{{2
" ----------------------------------
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <leader>f <Plug>CtrlSFVwordPath
vmap     <leader>F <Plug>CtrlSFVwordExec
nmap     <leader>n <Plug>CtrlSFCwordPath
nmap     <leader>p <Plug>CtrlSFPwordPath
nnoremap <leader>o :CtrlSFOpen<CR>
nnoremap <leader>t :CtrlSFToggle<CR>
inoremap <leader>t <Esc>:CtrlSFToggle<CR>

" GENERAL {{{1
" ----------------------------------

" Neovim config {{{2
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Ignore case when searching {{{2
set ignorecase

" When searching try to be smart about cases {{{2
set smartcase

"" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12. {{{2
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" Put plugins and dictionaries in this dir (also on Windows) {{{2 TODO refacto
" to use it in other function
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file {{{2
if has('persistent_undo')
   let myUndoDir = expand(vimDir . '/undodir')
   " Create dirs
   call system('mkdir ' . vimDir)
   call system('mkdir ' . myUndoDir)
   let &undodir = myUndoDir
   set undofile
endif

" Keep undofile {{{2
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Line number {{{2
set number
"highlight LineNr ctermbg=darkblue ctermfg=gray

" 80 character limit indicator {{{2
set cc=80

" Definition de l'affichage des caracteres invisbles avec 'set list' {{{2
" set listchars=nbsp:

" Higlight search {{{2
set hlsearch
set smartcase

" Makes search act like search in modern browsers {{{2
set incsearch 

" Don't redraw while executing macros (good performance config) {{{2
set lazyredraw 

" For regular expressions turn magic on {{{2
set magic

" Treat long lines as break lines (useful when moving around in them) {{{2
map j gj
map k gk

" Default indent {{{2
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" Tags {{{2
set tags=./tags

" Redraw fix {{{2
imap <silent> <c-l> <c-o>:redraw!<CR>

" Red EOL {{{2
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Copy/Paste clipboard {{{2
" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Mappings {{{2
" Break bad habits!!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Activate autoreload {{{2
"set autoread

" Mute highlighting {{{2
nnoremap <silent> <leader>l :<C-u>nohlsearch<CR><C-l>

" reload config after editing vimrc {{{2
autocmd! BufWritePost .init.vim source $MYVIMRC

" U is useless (except for Vi compatibility), make it a redo instead
map U <C-r>
" make K more consistent with J (J = join, K = split)
" nnoremap K i<CR><Esc>k$
" Alternative: use a real 'Man' on K
" runtime ftplugin/man.vim
" nnoremap K :Man <C-r><C-w><CR>
" use :W to sudo-write the current buffer
" command! W w !sudo tee "%" > /dev/null
command! W w !sudo dd of=%

" Mouse activation {{{2
set mouse=a

" Ignore files for searching {{{2
set wildignore+=*.pyc,tags,*.swp 

" Used for cmdheight {{{2
set noshowmode

" Spell-check set to <leader>o, 'o' for 'orthography' {{{2
map <leader>o :setlocal spell! spelllang=en_us<CR>
