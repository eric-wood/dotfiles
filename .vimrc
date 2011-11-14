set number
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set showmatch
set incsearch
set ruler
filetype plugin on
set laststatus=2

" For python, smartindent sucks. It messes up comments
" and all kinds of other shenanigans. This makes life easier.
autocmd BufRead *.py set nosmartindent
autocmd BufRead *.py im :<CR> :<CR><TAB>

syntax enable

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
	
	" Statusline - apparently not compatible with cli Vim yet
	set statusline=
	set statusline+=%<
	set statusline+=%{fugitive#statusline()}\ 
	set statusline+=%n:%f\ %h%m%r\ 
	set statusline+=%=%-14.(%l,%c%V%)\ %P
	
	" For the supa cool cursor line!
	set cursorline
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
nmap <silent> <leader>p :NERDTreeToggle<CR>
	
" For CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.swp/*
let g:ctrlp_working_path_mode = 2
