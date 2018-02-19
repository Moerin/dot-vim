" Vimrc configuration file
" Version : 2017-03

" Vundle configuration
"-----------------------------------
filetype off

exe 'set rtp+=' . $GOPATH . '/src/github.com/junegunn/fzf'

" List of bundles (or extensions)
"-----------------------------------
"dein Scripts
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin("$HOME/.config/nvim/bundles")

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('scrooloose/nerdcommenter')
call dein#add('evidens/vim-twig')
call dein#add('benmills/vimux')
call dein#add('tpope/vim-obsession')

" ====== FILE FORMAT ======
call dein#add('chrisbra/csv.vim')
call dein#add('elzr/vim-json')

" ====== SNIPPET ======
call dein#add('SirVer/ultisnips')
"call dein#add('Shougo/neosnippet')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('honza/vim-snippets')

" ====== SEARCH && REPLACE ======
call dein#add('mileszs/ack.vim')
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-surround')

" ====== COMPILATION - LITING ======
call dein#add('neomake/neomake')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/echodoc.vim')
call dein#add('Shougo/neoinclude.vim')

" ====== GIT ======
call dein#add('tpope/vim-fugitive')
call dein#add('sjl/gundo.vim')
call dein#add('mhinz/vim-signify')

" ====== INTERFACE ======
call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('bling/vim-airline')
call dein#add('ryanoasis/vim-devicons')
call dein#add('jeffkreeftmeijer/vim-numbertoggle')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('scrooloose/nerdtree')

" ====== PYTHON ======
call dein#add('klen/python-mode')
call dein#add('zchee/deoplete-jedi')
call dein#add('vim-scripts/indentpython.vim')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('hdima/python-syntax')

" ====== GOLANG ======
call dein#add('fatih/vim-go')
call dein#add('zchee/deoplete-go', {'build': 'make'})
call dein#add('nsf/gocode', {'rtp': 'nvim/'})

" ====== C/C++ =======
call dein#add('zchee/deoplete-clang')

" ====== PHP ======
call dein#add('joonty/vdebug')

" ====== ANSIBLE ======
call dein#add('pearofducks/ansible-vim', {
            \ 'build':
            \'sh -c "cd ./UltiSnips; python2 generate.py"'
            \})

" ====== THEME ======
call dein#add('joshdick/onedark.vim')
call dein#add('freeo/vim-kalisi')
call dein#add('morhetz/gruvbox')

" ====== SOURCE CODE ======
call dein#add('ludovicchabant/vim-gutentags')
"call dein#add('majutsushi/tagbar')

" ====== FOLDING ======
call dein#add('tmhedberg/SimpylFold')
call dein#add('Konfekt/FastFold')

" ====== FUN =====
call dein#add('rbtnn/game_engine.vim')
call dein#add('rbtnn/mario.vim')

" You can specify revision/branch/tag.

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

"If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

call map(dein#check_clean(), "delete(v:val, 'rf')")

"End dein Scripts-------------------------

" Vdebug setup
"-----------------------------------
let g:vdebug_keymap = {
            \    "run" : "<Leader>/",
            \    "run_to_cursor" : "<Down>",
            \    "step_over" : "<Up>",
            \    "step_into" : "<Left>",
            \    "step_out" : "<Right>",
            \    "close" : "q",
            \    "detach" : "x",
            \    "set_breakpoint" : "<Leader>b",
            \    "eval_visual" : "<Leader>e"
            \}

let g:vdebug_options = {
            \    "break_on_open" : 0,
            \}

" Airline setup
"-----------------------------------
set laststatus=2
set statusline+=%{fugitive#statusline()}
set statusline+=%{virtualenv#statusline()}
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep = "\uE0C0"
let g:airline_left_alt_sep = "\uE0C1"
let g:airline_right_sep = "\uE0C2"
let g:airline_right_alt_sep = "\uE0C3"

" Gundo setup
" ----------------------------------
nnoremap <F6> :GundoToggle<CR>

" Vimwiki setup
" ----------------------------------
let g:vimwiki_list=[{'path':'~/.vim/vimwiki'}]

" Vimux setup
" ----------------------------------
map <Leader>ps :call VimuxRunCommand("v3; python manage.py shell;")<CR>
map <Leader>vp :VimuxPromptCommand<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <Leader>vs :VimuxInterruptRunner<CR>

" Obsession 
" ----------------------------------
set statusline+=%{ObsessionStatus()}

" Deoplete 
" ----------------------------------
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

autocmd FileType python setlocal omnifunc=jedi#completions

set noshowmode
let g:echodoc_enable_at_startup = 1

let g:deoplete#sources#jedi#show_docstring = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'

" C and C++
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-3.8/lib/clang/'

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
"let g:neomake_open_list = 2

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

    "let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

    set ttimeout
    set ttimeoutlen=0

endif

" Pymode setup
" ----------------------------------
let g:pymode = 1
let g:pymode_folding = 1
let g:pymode_rope_completion = 0
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXX BREAKPOINT'
let g:pymode_lint = 0
let g:pymode_rope_autoimport = 1

" Enable folding with the spacebar
nnoremap <space> za

" SimplyFold setup
let g:SimpylFold_docstring_preview=1

" Signify setup
" ----------------------------------
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" TagBar setup
" ----------------------------------
nmap <F8> :TagbarToggle<CR>

" FZF
" ----------------------------------
nmap <silent> <c-p> :FZF<CR>

" Theme selector
nnoremap <silent> <Leader>C :call fzf#run({
            \   'source':
            \     map(split(globpath(&rtp, "colors/*.vim"), "\n"),
            \         "substitute(fnamemodify(v:val, ':t'), '\\..\\{-}$', '', '')"),
            \   'sink':    'colo',
            \   'options': '+m',
            \   'left':    30
            \ })<CR>

function! s:buflist()
    redir => ls
    silent ls
    redir END
    return split(ls, '\n')
endfunction

function! s:bufopen(e)
    execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

" List buffers
nnoremap <silent> <Leader><Enter> :call fzf#run({
            \ 'source':  reverse(<sid>buflist()),
            \ 'sink':    function('<sid>bufopen'),
            \ 'options': '+m',
            \ 'down':    len(<sid>buflist()) + 2
            \ })<CR>

command! FZFMru call fzf#run({
            \ 'source':  reverse(s:all_files()),
            \ 'sink':    'edit',
            \ 'options': '-m -x +s',
            \ 'down':    '40%' })

" For MRU files
function! s:all_files()
    return extend(
                \ filter(copy(v:oldfiles),
                \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
                \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

nnoremap <silent> <c-h> :FZFMru<CR> 

" General
" ----------------------------------

let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'

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

" UltiSnips
" ----------------------------------

let g:UltiSnipsExpandTrigger       = "<C-j>"
let g:UltiSnipsJumpForwardTrigger  = "<C-l>"
let g:UltiSnipsJumpBackwardTrigger = "<C-h>"
let g:UltiSnipsListSnippets        = "<C-k>" "List possible snippets based on current file
let g:UltiSnipsSnippetsDir         = "~/.config/nvim/bundles/repos/github.com/honza/vim-snippets/UltiSnips"

" Folding/Unfolding
map <2-LeftMouse> za

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

" Xml auto indent command 'gg=G'
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" function
function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction

command! PrettyXML call DoPrettyXML()set secure

" Tags
"set tags=~/workspace/svn/lengow/php.tags;~/workspace/pymarketplaces/python.tags
set tags=./tags

" Vimgrep search
nmap <leader>F :Ack! 
nmap <leader>Fp :Ack! --python 

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

"" Remap TabKey
"nnoremap <Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap <Leader><Tab> <Tab>

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

" Activate autoreload
"set autoread

" Mute highlighting
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" reload config after editing vimrc
autocmd! BufWritePost .vimrc source $MYVIMRC

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
