set nocompatible
set number
set autoindent
"set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set incsearch
set ruler
syntax enable

compiler ruby

set cursorline

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

	colorscheme ir_black
else
	" I hate this, but it's apparently the best way to get
	" Vim to change cursors between different modes in iTerm2
	let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
	set mouse=a

	colorscheme ir_black_term
endif

"====================================
" Colors
"====================================

" For the git part of the statusline
hi User1 ctermbg=black ctermfg=white   guibg=black guifg=white

nmap <silent> <leader>i :IndentGuidesToggle<CR>
nmap <silent> <leader>o :FufCoverageFile<CR>
nmap <silent> <leader>r :FufRenewCache<CR>
nmap <silent> <leader>p :NERDTreeToggle<CR>
nmap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>

" remap j and k to scroll by visual lines
"if !vimpager
  nnoremap j gj
  nnoremap k gk
"endif
	
" Statusline
set laststatus=2
set statusline=\ %{winnr()}\ %m%r\ %f%=%l,%c\ %P\ %y%{fugitive#statusline()}
let g:smartusline_hi_normal = 'guifg=#CCCCCC guibg=#202020 ctermfg=white ctermbg=darkgray'

"====================================
" Vundle
"====================================

filetype off " for some reson this needs to be set first...

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
Bundle 'hail2u/vim-css3-syntax'

" Note: keep an eye on Vundle's future HG support, since this
" project uses HG.
" URLs:
"   L9: https://bitbucket.org/ns9tks/vim-l9/
"   FuzzyFinder: https://bitbucket.org/ns9tks/vim-fuzzyfinder/
Bundle 'L9'
Bundle 'FuzzyFinder'

filetype plugin indent on " for some reason this needs to be next...

"====================================
" Language-specific Settings
"====================================

" When I'm writing markdown, it's typically prose.
" Turn on spellchecking on markdown files
if &ft == "markdown"
  " Set up indent
  set tabstop=4
  set shiftwidth=4
  setlocal spell! spelllang=en_us

  " For my biology notes.......markdown doesn't do subscripts :'(
  " Will remove this at the end of the semester
  let @h='H<sub>2</sub>O'
  let @s='<sup>+</sup>'

  " Get rid of the tab bar so there's nothing but black :)
  set showtabline=0
endif

if &ft == "tex"
  nmap <silent> <leader>r :!pdflatex '%:p'; open '%:p:r.pdf'<CR><CR>
endif
