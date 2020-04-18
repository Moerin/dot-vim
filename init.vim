"   _  __             _                                  ____ __   
"  / |/ /__ ___ _  __(_)_ _    __ _  ___ ___ ___ __ __  / _(_) /__ 
" /    / -_) _ \ |/ / /  ' \  /  ' \/ -_|_-<(_-</ // / / _/ / / -_)
"/_/|_/\__/\___/___/_/_/_/_/ /_/_/_/\__/___/___/\_, / /_//_/_/\__/ 
"                                              /___/               
" Version : 2020-04

" VUNDLE CONFIGURATION {{{1
"-----------------------------------
filetype off

exe 'set rtp+=' . $GOPATH . '/src/github.com/junegunn/fzf'

" List of bundles (or extensions)
"-----------------------------------
"dein Scripts
if &compatible
    set nocompatible               " Be iMproved
endif

set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" PLUGIN LIST {{{1
if dein#load_state("$HOME/.config/nvim/bundles")
    call dein#begin("$HOME/.config/nvim/bundles")

    " Let dein manage dein
    " Required:
    call dein#add('Shougo/dein.vim') " Plugin manager on steroid
    call dein#add('haya14busa/dein-command.vim') " Utility comands of dein.vim with rich completion.

    " Add or remove your plugins here:
    " COMMENT {{{2
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
    " Deoplete has python libraries requirements/dependencies
    " - pynvim
    " - msgpack
    call dein#add('Shougo/deoplete.nvim') " Dark powered asynchronous completion framework for neovim/Vim8 
    call dein#add('zchee/deoplete-jedi')
    call dein#add('fszymanski/deoplete-emoji') " Deoplete source for emoji codes 
    call dein#add('neomake/neomake') " Asynchronous linting and make framework for Neovim/Vim 
    call dein#add('Shougo/echodoc.vim') " Print documents in echo area (Neovim command line).
    "call dein#add('Shougo/neoinclude.vim') " Include completion framework for neocomplete/deoplete 

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
    call dein#add('zchee/deoplete-go', {'build': 'make'}) " Asynchronous Go completion for Neovim. deoplete source for Go.
    "call dein#add('nsf/gocode', {'rtp': 'nvim/'}) TODO check if commentary
    "has changed go completion behavior

    " TERRAFORM {{{2
    call dein#add('hashivim/vim-terraform') " Basic vim/terraform integration
    call dein#add('juliosueiras/vim-terraform-completion') " A (Neo)Vim Autocompletion and linter for Terraform, a HashiCorp tool

    " ANSIBLE {{{2
    call dein#add('pearofducks/ansible-vim') " A vim plugin for syntax highlighting Ansible's common filetypes 
    call dein#add('arouene/vim-ansible-vault') " Vault and Unvault inline values of Yaml files

    " THEME {{{2
    call dein#add('joshdick/onedark.vim') " A dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme.
    call dein#add('freeo/vim-kalisi') " The colorscheme with neovim in mind 
    call dein#add('morhetz/gruvbox') " Retro groove color scheme for Vim 

    " SOURCE CODE {{{2
    call dein#add('ludovicchabant/vim-gutentags') " A Vim plugin that manages your tag files

    " FOLDING {{{2
    call dein#add('tmhedberg/SimpylFold') " No-BS Python code folding for Vim 
    call dein#add('Konfekt/FastFold') " Speed up Vim by updating folds only when called-for. TODO study it

    " PRODUCTIVITY {{{2 TODO congigure yarn
    call dein#add('iamcco/markdown-preview.nvim', {'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
                \ 'build': 'sh -c "cd app & yarn install"' }) " Markdown preview plugin for (neo)vim 

    " Required:
    call dein#end()
    call dein#save_state()
endif
"
" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------
"}}}1

" Airline setup
"-----------------------------------
set laststatus=2
set statusline+=%{fugitive#statusline()}
set statusline+=%{virtualenv#statusline()}
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled=1

" CtrlSF setup
"-----------------------------------
let g:ctrlsf_args_ignoredir = ['.fact', '.terraform']

" Gundo setup
" ----------------------------------
nnoremap <F6> :GundoToggle<CR>

" Vimwiki setup
" ----------------------------------
let g:vimwiki_list=[{'path':'~/.vim/vimwiki'}]

" Obsession 
" ----------------------------------
set statusline+=%{ObsessionStatus()}

" Deoplete 
" ----------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1

" Echodoc
" ----------------------------------
let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'floating'
" To use a custom highlight for the float window,
" change Pmenu to your highlight group
highlight link EchoDocFloat Pmenu

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

autocmd FileType python setlocal omnifunc=jedi#completions

let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Terraform
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" NERDTree setup
" ----------------------------------
" Ignore files
let NERDTreeIgnore = ['\.pyc$']
" AutoClose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Bookmark
let NERDTreeShowBookmarks=1
" Mirroring between tabs
let NERDTreeMirror=0

" Vim-go
" ----------------------------------
let g:go_def_mode='gopls' " TODO check if it's working
let g:go_info_mode='gopls' " TODO check if it's working

" Vim-indent-guides
" ----------------------------------
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Function enable indentguide
augroup IndentGuides
    autocmd!
    autocmd VimEnter * IndentGuidesEnable
augroup END

" Neomake
" ----------------------------------
let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'pylama']
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501, E702, F403'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266'], }
let g:neomake_terraform_terraform_validate_maker = {
            \ 'exe' : 'terraform',
            \ 'append_file': 0,
            \ 'cwd': '%:p:h',
            \ 'args': ['validate', '-no-color'],
            \ 'errorformat': 'Error\ loading\ files\ Error\ parsing %f:\ At\ %l:%c:\ %m'
            \ }

let g:neomake_terraform_enabled_makers = ['terraform_validate', 'tflint', 'tffilter']
let g:neomake_terraform_tffilter_maker = {
            \ 'exe': 'tffilter',
            \ 'append_file': 0,
            \ 'cwd': '%:p:h',
            \ 'args': ['%:p'],
            \ 'errorformat': '%f:%l:%m'
            \ }

let g:neomake_terraform_tflint_maker = {
            \ 'exe' : 'tflint',
            \ 'append_file': 0,
            \ 'cwd': '%:p:h',
            \ 'args': [],
            \ 'errorformat': '%+P%f,%p%t%*[^:]:%l %m,%-Q'
            \ }

let g:neomake_go_enabled_makers = [ 'go', 'golangcifast' ]
let g:neomake_go_golangcifast_maker = {
            \ 'exe': 'golangci-lint',
            \ 'args': [ 'run', '--fast', ],
            \ 'append_file': 0,
            \ 'cwd': '%:h',
            \ }

let g:neomake_markdown_enabled_makers = [ 'markdownlint']

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

" Colorscheme
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

" Enable folding with the spacebar
nnoremap <space> za

" SimplyFold setup
let g:SimpylFold_docstring_preview=1

" Signify setup
" ----------------------------------
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" FZF
" ----------------------------------

" Theme selector
nnoremap <silent> <Leader>C :call fzf#run({
\   'source':
\     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
\         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
\   'sink':    'colo',
\   'options': '+m',
\   'left':    30
\ })<CR>

" For MRU files
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

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Remove status line when fzf run
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
 \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" MarkdownPreview setup
" ----------------------------------
nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode

" traces.vim
" ----------------------------------
set inccommand=""

" General
" ----------------------------------
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

syntax on

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

"" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
   let myUndoDir = expand(vimDir . '/undodir')
   " Create dirs
   call system('mkdir ' . vimDir)
   call system('mkdir ' . myUndoDir)
   let &undodir = myUndoDir
   set undofile
endif

" Keep undofile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" NerdTree activation
"----------------------------------
map <F2> <ESC>:NERDTreeToggle<CR>

let g:NERDTreeIndicatorMapCustom = {
   \ "Modified"  : "◁",
   \ }


" UltiSnips
"" ----------------------------------
"let g:UltiSnipsExpandTrigger       = "<C-j>" " TODO change it
"let g:UltiSnipsJumpForwardTrigger  = "<C-l>" " TODO change it
"let g:UltiSnipsJumpBackwardTrigger = "<C-h>" " TODO change it
"let g:UltiSnipsListSnippets        = "<C-k>" "List possible snippets based on current file

" Affichage des numeros de ligne
set number
"highlight LineNr ctermbg=darkblue ctermfg=gray

" Affiche une aide pour 80 caracteres
set cc=80

" Definition de l'affichage des caracteres invisbles avec 'set list'
" set listchars=nbsp:

" Affichage surbrillance recherche
set hlsearch
set smartcase

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Indentation respectant le format de developpement
set cindent
set tabstop=4
set shiftwidth=4
set expandtab

" Syntax pour python
let python_highlight_all = 1

" Indentation pour python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" Indentation pour yaml
autocmd FileType yaml setlocal ts=2 
autocmd FileType yaml setlocal sts=2
autocmd FileType yaml setlocal sw=2

" Permet d'utiliser des .vimrc par projets et eviter les commandes dangereuses
set exrc
set secure

" format JSON
command! FormatJSON %!python -m json.tool

" Tags
set tags=./tags

" ctrlsf.vim search
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <leader>f <Plug>CtrlSFVwordPath
vmap     <leader>F <Plug>CtrlSFVwordExec
nmap     <leader>n <Plug>CtrlSFCwordPath
nmap     <leader>p <Plug>CtrlSFPwordPath
nnoremap <leader>o :CtrlSFOpen<CR>
nnoremap <leader>t :CtrlSFToggle<CR>
inoremap <leader>t <Esc>:CtrlSFToggle<CR>

" Redraw fix
imap <silent> <c-l> <c-o>:redraw!<CR>

" Coloris en rouge les fins de ligne
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Break bad habits!!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

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

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Activate autoreload
"set autoread

" Mute highlighting
nnoremap <silent> <leader>l :<C-u>nohlsearch<CR><C-l>

" reload config after editing vimrc
autocmd! BufWritePost .init.vim source $MYVIMRC

" U is useless (except for Vi compatibility), make it a redo instead
map U <C-r>
" make K more consistent with J (J = join, K = split)
nnoremap K i<CR><Esc>k$
" Alternative: use a real 'Man' on K
" runtime ftplugin/man.vim
" nnoremap K :Man <C-r><C-w><CR>
" use :W to sudo-write the current buffer
" command! W w !sudo tee "%" > /dev/null
command! W w !sudo dd of=%

" Mouse activation
set mouse=a

set wildignore+=*.pyc,tags,*.swp " DOCME

" Used for cmdheight
set noshowmode

" Spell-check set to <leader>o, 'o' for 'orthography'
map <leader>o :setlocal spell! spelllang=en_us<CR>

" TODO DOC ME
"filetype plugin on
