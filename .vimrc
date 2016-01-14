set nocompatible
set number
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set incsearch
set ruler
set wildmenu

" Keep Vim from automaticall inserting linebreaks instead of wrapping
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
syntax enable

compiler ruby

set cursorline

" I keep all of my schoolwork in dropbox, which syncs all of my
" swapfiles and drives me crazy. This relocates them to ~/.vim_swap
" and keeps them out of the way.
set directory^=$HOME/.vim_swap//,.

"====================================
" Vundle
"====================================
" These need to be set up first, otherwise settings that
" refer to certain plugins aren't loaded and we get errors

filetype off

call plug#begin('~/.vim/plugged')
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown'
Plug 'mikewest/vimroom'
Plug 'vim-ruby/vim-ruby'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/ctrlp.vim'
" THEY CHANGED IT! Ugh. Forking.
"Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-surround'
Plug 'mustache/vim-mustache-handlebars'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kchmck/vim-coffee-script'
Plug 'scrooloose/syntastic'
Plug 'ap/vim-css-color'
Plug 'mileszs/ack.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'heartsentwined/vim-emblem'
Plug 'vim-airline/vim-airline'
call plug#end()

"====================================

" ignore silly things w/ ack!
let g:ack_autoclose=1
"let g:ack_default_options=' --ignore-dir=log/ --ignore-dir=node_modules/ --ignore-dir=tmp/'

filetype plugin indent on " for some reason this needs to be next...

let g:tex_flavor='latex'

" For gVim or MacVim...
if has("gui_running")
  set guifont=Meslo_LG_S_for_Powerline
	set ofu=syntaxcomplete#Complete
	set guioptions-=T

	" No clue why you have to set and remove the scrollbars
	" for this to work in gVim, but that's how it is :(
	set guioptions+=LlRrb
	set guioptions-=LlRrb
	set go-=L
	set showtabline=1

  " In gVim/MacVim I prefer to have the tab bar always shown
  " it keeps the window from changing size when I open new tabs without
  " already having any open.
  set showtabline=2
  
  " Solarized toggle
  " I'm leaving this under the gVim-specific settings since it doesn't
  " really work in the terminal and I'd rather not worry about it.
  " togglebg stupidly doesn't restrict itself to normal mode, so
  " typing \t in insert mode toggles. Mapping to F1 is way better.
  call togglebg#map("<F1>")
else
	set mouse=a
  
  " Solarized shenanigans
  let g:solarized_termcolors=256
endif
	
" For the supa cool cursor line!
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

set background=dark
colorscheme Tomorrow-Night-Eighties

"====================================
" Statusline
"====================================
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#hunks#enabled = 0

"====================================
" <leader> keystrokes and remappings
"====================================
nmap <silent> <leader>i :IndentGuidesToggle<CR>
nmap <silent> <leader>p :NERDTreeToggle<CR>
nmap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :source ~/.vimrc<CR>
nmap <silent> <leader>t :ToggleBG<CR> " only for use with solarized
nmap <silent> ^p :CtrlPMixed<CR>
nmap <silent> <leader>g :GitGutterToggle<CR>
nmap <silent> <leader>v :set paste!<CR>
nmap <leader>a :Ack!<space>
nmap "" cs'"
nmap '' cs"’

" When I have the brightness low I like to work with solarized light;
" this keystroke makes it easy to switch to it on a whim
nmap <silent> <leader>l :colorscheme solarized<CR>:set background=light<CR>

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" I get tired of pressing o+ESC to space things
nnoremap <Return> o<Esc>
nnoremap <S-Return> O<Esc>

" Stop using these, you lazy bastard!!
" Disables arrow keys
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Ignore stuff
set wildignore+=*.swp,*.o,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir': '\.git$\|\.hg$\|\.svn$\|node_modules',
  \ 'file': '\v\.(db|o)$'
  \ }

let NERDTreeIgnore = ['\.o$', '\.aux$', '\.make$', '\.fls$']

au BufNewFile,BufRead *.ejs,*.ejs.erb set filetype=javascript
au BufRead,BufNewFile *.js.erb set filetype=javascript
au BufRead,BufNewFile *.scss.erb set filetype=scss

" 80 character line
hi ColorColumn guibg=gray20
set colorcolumn=80

" Syntastic bar color
hi SignColumn guibg=#2d2d2d

let g:syntastic_enable_signs = 1

command! Sublime silent !~/bin/subl %:p

"function Slack() range
"  echo system('echo '.shellescape(join(getline(a:firstline, a:lastline), "\n")).'| pbcopy ')
"endfunction
"
"command! Slack silent !pbpaste | ~/.gem/ruby/2.1.6/bin/slackcat 

