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
syntax enable

compiler ruby

set cursorline

" I keep all of my schoolwork in dropbox, which syncs all of my
" swapfiles and drives me crazy. This relocates them to ~/.vim_swap
" and keeps them out of the way.
set directory^=$HOME/.vim_swap//,.

" I'm tired of typing dt_
set iskeyword-=_

"====================================
" Vundle
"====================================
" These need to be set up first, otherwise settings that
" refer to certain plugins aren't loaded and we get errors

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'	
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'
Bundle 'mikewest/vimroom'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/haskell.vim'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'

" Note: keep an eye on Vundle's future HG support, since this
" project uses HG.
" URLs:
"   L9: https://bitbucket.org/ns9tks/vim-l9/
"   FuzzyFinder: https://bitbucket.org/ns9tks/vim-fuzzyfinder/
Bundle 'L9'
Bundle 'FuzzyFinder'
"====================================

filetype plugin indent on " for some reason this needs to be next...

let g:tex_flavor='latex'

" For gVim or MacVim...
if has("gui_running")
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
	
	" For the supa cool cursor line!
	autocmd WinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
  
  colorscheme solarized
  set background=dark
  
  " Solarized toggle
  " I'm leaving this under the gVim-specific settings since it doesn't
  " really work in the terminal and I'd rather not worry about it.
  " togglebg stupidly doesn't restrict itself to normal mode, so
  " typing \t in insert mode toggles. Mapping to F1 is way better.
  call togglebg#map("<F1>")
else
	set mouse=a
  
  " Solarized shenanigans
  set background=dark
  let g:solarized_termcolors=256
  colorscheme solarized
endif

" For the git part of the statusline
hi User1 ctermbg=black ctermfg=white   guibg=black guifg=white

" Statusline
set laststatus=2
set statusline=\ %{winnr()}\ %m%r\ %f%=%l,%c\ %P\ %y%{fugitive#statusline()}
"let g:smartusline_hi_normal = 'guifg=#CCCCCC guibg=#202020 ctermfg=white ctermbg=darkgray'

"====================================
" <leader> keystrokes and remappings
"====================================
nmap <silent> <leader>i :IndentGuidesToggle<CR>
nmap <silent> <leader>o :FufCoverageFile<CR>
nmap <silent> <leader>r :FufRenewCache<CR>
nmap <silent> <leader>p :NERDTreeToggle<CR>
nmap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :source ~/.vimrc<CR>
nmap <silent> <leader>t :ToggleBG<CR>

" remap j and k to scroll by visual lines
nnoremap j gj
nnoremap k gk

" Stop using these, you lazy bastard!!
" Disables arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

