" Vimrc configuration file
" Version : 2016-07

" Vundle configuration
"-----------------------------------
set nocompatible
filetype off

exe 'set rtp+=' . $GOPATH . '/src/github.com/junegunn/fzf'

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle management (for updates)
Plugin 'gmarik/Vundle.vim'

" List of bundles (or extensions)
"-----------------------------------
Plugin 'bling/vim-airline'
Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Align'
Plugin 'mattn/emmet-vim'
Plugin 'klen/python-mode'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'altercation/vim-colors-solarized'
Plugin 'elzr/vim-json'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'mhinz/vim-signify'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-abolish'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'evidens/vim-twig'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'benmills/vimux'
Plugin 'freeo/vim-kalisi'
Plugin 'hdima/python-syntax'
Plugin 'morhetz/gruvbox'
Plugin 'matchit.zip'
Plugin 'fatih/vim-go'
Plugin 'zchee/deoplete-go', { 'do': 'make'}
Plugin 'zchee/deoplete-jedi'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-obsession'
Plugin 'Shougo/deoplete.nvim'
Plugin 'junegunn/vim-peekaboo'
Plugin 'sjl/gundo.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Shougo/echodoc.vim'
Plugin 'xolox/vim-misc'
Plugin 'joonty/vdebug'
Plugin 'diepm/vim-rest-console'
Plugin 'nsf/gocode', {'rtp': 'nvim/'}
Plugin 'Konfekt/FastFold'

"--------------"
"Outdated Plugin"
"--------------"

"Plugin 'xolox/vim-easytags'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'joonty/vim-taggatron'
"Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()
filetype plugin indent on

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

"let g:vdebug_options = {
"\    "break_on_open" : 0,
"\}

" Airline setup
"-----------------------------------
set laststatus=2
set statusline+=%{fugitive#statusline()}
set statusline+=%{virtualenv#statusline()}
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled=1

" Gundo setup
" ----------------------------------
nnoremap <F6> :GundoToggle<CR>
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ 10

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

" Syntactic
" ----------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
" Not work
highlight SyntasticWarningSign guifg=white guibg=red
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_w = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_auto_jump = 2 
" Disable warning level in loc_list for all checker
let g:syntastic_quiet_messages = { "level": "warnings" }
" Change format of print
let g:syntastic_python_flake8_args='--ignore=E501,F403,E702'

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

  "let g:solarized_italic=0
endif

if has("gui_running")
    syntax enable
    set background=dark
    colorscheme solarized
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

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

nnoremap <silent> <c-h> :FZFMru<CR> 

" General
" ----------------------------------

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

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
let vimDir = '$HOME/.vim'
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

" Shortkeys loading
"-----------------------------------
execute 'source ' . $HOME . '/.vim/shortkeys.vim'

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
set tags=~/workspace/svn/lengow/php.tags;~/workspace/pymarketplaces/python.tags

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
set autoread

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
