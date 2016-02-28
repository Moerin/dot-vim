" Vimrc configuration file
" Version : 2015-09

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
Plugin 'vim-scripts/c.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'python-rope/ropevim'
Plugin 'fatih/vim-go'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'sjl/gundo.vim'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'benekastah/neomake'

call vundle#end()
filetype plugin indent on

" Airline setup
" -----------------------------------
set laststatus=2
set statusline+=%{fugitive#statusline()}
set statusline+=%{virtualenv#statusline()}
let g:airline_powerline_fonts = 1 
let g:airline#extensions#tabline#enabled=1
set t_Co=256

" Gundo setup
nnoremap <F6> :GundoToggle<CR>

" Vimdevicons
" -----------------------------------
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ 10
"set guifont=DroidSansMonoForPowerlinePlusNerdFileTypes 10
set encoding=utf-8

" Vimwiki setup
" ----------------------------------
let g:vimwiki_list=[{'path':'~/.vim/vimwiki'}]

" Vimux setup
" ----------------------------------
map <Leader>ps :call VimuxRunCommand("v3; python manage.py shell;")
map <Leader>vp :VimuxPromptCommand<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <Leader>vs :VimuxInterruptRunner<CR>

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
nmap <F2> :NERDTreeToggle<cr>

"" YouCompleteme
"" ----------------------------------
"let g:EclimCompletionMethod = 'omnifunc'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from
"" Ctags file
"let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
"let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming
"" language's keyword
"let g:ycm_complete_in_comments = 1 " Completion in comments
"let g:ycm_complete_in_strings = 1 " Completion in strings

"" Deoplete
"" ----------------------------------
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Vim-indent-guides
" ----------------------------------
set background=dark
colorscheme solarized
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
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'


" Pymode setup
" ----------------------------------
let g:pymode = 1
let g:pymode_folding = 1
let g:pymode_rope_completion = 0
let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace() # XXX BREAKPOINT'
let g:pymode_lint = 0

" Enable folding with the spacebar
nnoremap <space> za

" SimpylFold setup
let g:SimpylFold_docstring_preview=1

" Signify setup
" ----------------------------------
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" TagBar setup
" ----------------------------------
nmap <F8> :TagbarToggle<CR>

" C.vim
" ----------------------------------
let g:C_UseToolcmake = 'yes'

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

" Ultisnips setup
" ----------------------------------
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<c-h>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" Vim easy-tags
" ----------------------------------
autocmd FileType * set tags=./.tags;,tags;,~/.vim/.vimtags
set cpoptions+=d
let g:easytags_file = '~/.vim/.vimtags'
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
let b:easytags_auto_highlight = 0
let g:easytags_python_enabled = "always"
" Debug
"set vbs=1

" General
" ----------------------------------
syntax on
let g:solarized_termcolors=256  
set background=dark  
colorscheme solarized

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

" Affichage des numeros de ligne
set number
highlight LineNr ctermbg=darkblue ctermfg=gray

" Longueur maximale de lignes
set textwidth=80

" Affiche une aide pour 80 caracteres
set cc=80

" Surligne la colonne du dernier caractere autorise par textwidth
set cc=+1

" Definition de l'affichage des caracteres invisibles avec 'set list'
" set listchars=nbsp:

" Affichage surbrillance recherche
set hlsearch

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
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Indentation pour python
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


" Permet d'utiliser des .vimrc par projets et eviter les commandes dangereuses
set exrc
set secure

" format JSON
command! FormatJSON %!python -m json.tool

" Solarized conf
if has("gui_running")
    syntax enable
    set background=dark
    colorscheme solarized
endif

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

" PHP tags
set tags=~/workspace/svn/lengow/php.tags

" C compilation
set makeprg=make\ -C\ ../build\ -j9
nnoremap <F4> :make!<cr>

" Vimgrep search
nmap <F5> :Ack! 

" Backspace correction
set backspace=indent,eol,start

" Coloris en rouge les fins de ligne
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Breaking bad habit!!
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" easy-tags
autocmd FileType * set tags=./.tags;,~/.vim/.vimtags
set cpoptions+=d
let g:easytags_file = '~/.vim/.vimtags'
let g:easytags_dynamic_files = 2
let g:easytags_async = 1
