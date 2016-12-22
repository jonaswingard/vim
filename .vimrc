" Type :so % to refresh .vimrc after making changes

set nocompatible
filetype indent plugin on
syntax on
set hidden
set wildmenu
set wildmode=list:longest,full
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=i
set cmdheight=2
set number
set numberwidth=5
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftround
set expandtab
"set autoread

" Tab-settings
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=2
set tabstop=2

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = " "
nmap <leader>v :tabedit $MYVIMRC<CR>

" Display extra whitespace
" set list listchars=tab:»·,trail:·,nbsp:·

set nowrap " don't wrap code
" set textwidth=100 " Make it obvious where 100 characters is
set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=L  "remove left scrollbar
set relativenumber

set cursorline " highlight the current line

set splitright " open new splits to the right

" Auto resize Vim splits to active split
"set winwidth=104
"set winheight=5
"set winminheight=5

" HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

"Use enter to create new lines w/o entering insert mode
nnoremap <CR> o<Esc>

"Below is to fix issues with the ABOVE mappings in quickfix window
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Run the q macro
nnoremap <leader>q @q

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Always use vertical diffs
set diffopt+=vertical

" ================ Plugins ========================
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/vim-ctrlspace/vim-ctrlspace.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/vimwiki/vimwiki'
Plug 'pangloss/vim-javascript'
Plug 'https://github.com/othree/html5-syntax.vim'
Plug 'https://github.com/othree/html5.vim'
Plug 'mhinz/vim-startify'
Plug 'https://github.com/joequery/Stupid-EasyMotion'
Plug 'https://github.com/terryma/vim-smooth-scroll'
Plug 'https://github.com/valloric/MatchTagAlways'
Plug 'https://github.com/epmatsw/ag.vim'
Plug 'https://github.com/lukaszb/vim-web-indent'
Plug 'https://github.com/nono/vim-handlebars'
Plug 'https://github.com/dbakker/vim-projectroot'
Plug 'https://github.com/2072/PHP-Indenting-for-VIm'
Plug 'https://github.com/rbgrouleff/bclose.vim'
call plug#end()

colorscheme molokai 

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
		set guifont=Consolas:h10:cANSI
  endif
endif

" Encoding
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif


" ================ Custom mappings ========================

imap jj <Esc>

map Y y$
nnoremap <leader>h :nohl<CR><C-L>


" Copy and paste
vnoremap <C-c> "+y
vnoremap <C-x> "+d
vnoremap <C-v> "+p
inoremap <C-v> <C-r><C-o>+

" Map Ctrl + S to save in any mode
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Also map leader + s
map <leader>s <C-S>
map <leader>w <C-S>

" Quickly close windows
"nnoremap <leader>x :bd<cr>
"nnoremap <leader>X :q!<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" noremap <leader>i mzgg=G`z
" Reindent entire file
map <leader>r mzgg=G`z

" Switch between the last two files
nnoremap <leader><leader>t <c-^>


" ================ Plugin-settings ========================
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>l :NERDTreeFind<CR>

" File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"CTRL P
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Ignore space
let g:ctrlp_abbrev = {
    \ 'abbrevs': [
            \ {
                \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
                \ 'expanded': '',
                \ 'mode': 'fprz',
            \ },
        \ ]
    \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EasyMotion
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
"nmap s <Plug>(easymotion-overwin-f2)

" Move to line
"map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
"map  <Leader>w <Plug>(easymotion-bd-w)
"nmap <Leader>w <Plug>(easymotion-overwin-w)

" NERD Commenter settings
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1

" Multiple Cursors Settings
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" update dir to current file
" autocmd BufEnter * silent! cd %:p:h

" HTML close tag
" autocmd FileType html inoremap <C-Space> </<C-X><C-O><Esc>==a

" Plugin: VIM Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
" let g:javascript_plugin_flow = 1
"set foldmethod=syntax

let g:javascript_conceal_function       = "ƒ"
let g:javascript_conceal_null           = "ø"
let g:javascript_conceal_this           = "@"
let g:javascript_conceal_return         = "⇚"
let g:javascript_conceal_undefined      = "¿"
let g:javascript_conceal_NaN            = "ℕ"
let g:javascript_conceal_prototype      = "¶"
let g:javascript_conceal_static         = "•"
let g:javascript_conceal_super          = "Ω"
let g:javascript_conceal_arrow_function = "⇒"

" Testing windows size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=155
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" Remap find?
map - /

" Stupid Easymotion
nmap f <Leader><Leader>f

" Startify
let g:startify_bookmarks = [
      \ { 'c': '~/.vim/vimrc' },
      \ '~/golfing',
      \ ]

let g:startify_list_order = [
      \ ['   These are my sessions:'],
      \ 'sessions',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ['   My most recently used files'],
      \ 'files',
      \ ['   My most recently used files in the current directory:'],
      \ 'dir',
      \ ['   These are my commands:'],
      \ 'commands',
      \ ]

let g:startify_commands = [
      \ ':help reference',
      \ ['Vim Reference', 'h ref'],
      \ {'h': 'h ref'},
      \ {'w': ['Vim Wiki', 'VimwikiIndex']},
      \ ]

" Disable scrollwheel
noremap <ScrollWheelUp> <nop>
noremap <S-ScrollWheelUp> <nop>
noremap <ScrollWheelDown> <nop>
noremap <S-ScrollWheelDown> <nop>

" Smooth scroll
noremap <silent> <c-b> :call smooth_scroll#up(&scroll, 0, 3)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll, 0, 3)<CR>

" MatchTagAlways
nnoremap <leader>m :MtaJumpToOtherTag<cr>_

" Search settings
let g:ag_highlight=1
let g:ag_format="%f:%l:%m"
xnoremap  K y:<c-u>Ag <C-R>=shellescape(expand(@"),1)<CR>:copen<CR>
nnoremap  K :<c-u>Ag <c-r>=shellescape(expand("<cword>"),1)<cr>:copen<cr>
"noremap <C-S-F> :Ag -Q 

" Projectroot
nnoremap <leader>dp :ProjectRootCD<cr>

" Testing open command in current path
nnoremap <leader>ot :silent !cmder /START "%:p:h"<CR>

"BClose
nnoremap <silent> <Leader>x :Bclose<CR>
