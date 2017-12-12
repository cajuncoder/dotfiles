"---------------------------SetUp--------------------------------"
filetype plugin indent on
syntax on

"set listchars=eol:¬,nbsp:☠,tab:▸␣,trail:~,extends:>,precedes:<
"set list

set nocompatible
set encoding=utf-8  " The encoding displayed.
set fileencodings=utf-8,cp932  " The encoding written to file.

"set term=cons25		"fix arrow keys in insert mode
set laststatus=1                "set to 2 to make visible always
set statusline=%f 		"tail of the filename
set statusline+=\ \ \ <<\    " Separator
set statusline+=%{len(filter(range(1,bufnr('$')),'buflisted(v:val)'))}
set statusline+=\ >>
set statusline+=%=              "left/right separator
set statusline+=%l/%L
set statusline+=\:%c
set statusline+=\ %P            "percent through file
set visualbell 			"turn audio bell off
set t_vb= 		    	"turn visual flash off
set ruler
set cmdheight=1
set scrolloff=15
set sidescrolloff=15
set sidescroll=1
set nowrap
set path+=**                        "set path+=** for infinite 
set path+=''
"set complete-=i 					"no infinite searches
set wildmenu
"set wildmode=list:longest,full
set ttyfast
set mouse=a
"set lazyredraw
"set title "THIS CAUSES 'no protocol specified' error when su'ing as another
"user sometimes
"set shortmess=atI	            "removes Press ENTER or type any key prompts
"inoremap <silent> <Esc> <C-O>:stopinsert<CR>	"fix cursor ali ment
"let g:clipbrdDefaultReg = '+'



"--------------------------- Behavior --------------------------------"

"------ Text editing and searching behavior ------"

set nohlsearch                  " turn off highlighting for searched expressions
set incsearch                   " highlight as we search however
set matchtime=5                 " blink matching chars for .x seconds
set ignorecase                  " set case insensitivity
set smartcase                   " unless there's a capital letter
set incsearch           		" Incremental search
"set hlsearch
set completeopt=menu,longest,preview " more autocomplete <Ctrl>-P options
set nostartofline               " leave my cursor position alone!
set backspace=2                 " equiv to :set backspace=indent,eol,start
"set textwidth=80                " we like 80 columns
"set showmatch                   " show matching brackets
"set formatoptions=tcrql         " t - autowrap to textwidth
                                " c - autowrap comments to textwidth
                                " r - autoinsert comment leader with <Enter>
                                " q - allow formatting of comments with :gq
                                " l - don't format already long lines
set nowrap
set noexpandtab
set noswapfile
set showcmd             " Show (partial) command in status line.
set copyindent
set preserveindent
set smartindent
"set showmatch           " Show matching brackets.

"------ Search ------"
"nnoremap " ?
"nnoremap ' <Esc>

"------ Auto Complete ------"
inoremap <C-Space> <C-p>

"-------- Change Cursor in Insert Mode ---------"
" Change Color when entering Insert Mode
"set cursorline
"hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE
"autocmd InsertEnter * highlight  CursorLine ctermbg=Green ctermfg=Red
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
"autocmd InsertEnter * hi Comment ctermfg=grey
"autocmd InsertLeave * hi Comment ctermfg=darkgrey
" Revert Color to default when leaving Insert Mode
"autocmd InsertLeave * highlight  CursorLine ctermbg=Yellow ctermfg=None

"fixes delay on leaving insert mode with escape
"au InsertLeave * if &mod && expand('%')!=''|write|endif

"disable automatic comments
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"------Don't move cursor when exiting insert mode------"
function CorrectCursor()
  if virtcol('.')>1
    call cursor([getpos('.')[1], getpos('.')[2]+1])
  endif
endfunction

au InsertLeave * call CorrectCursor()
"au InsertLeave * call cursor([getpos('.')[1], getpos('.')[2]+1])

"allows insertion after end of line
set virtualedit=onemore,block
set timeoutlen=600 ttimeoutlen=0



"--------------------------- Color --------------------------------"

colo desert
highlight PmenuSel ctermbg=blue
set number
set nuw=4
au ColorScheme * highlight LineNr ctermfg=darkgrey
au ColorScheme * hi Comment ctermfg=darkgrey
highlight LineNr ctermfg=darkgrey
hi Comment ctermfg=darkgrey      
highlight CursorLine gui=underline cterm=underline
highlight Visual cterm=NONE ctermbg=blue ctermfg=NONE guibg=Grey40



"--------------------------- Key Mapping --------------------------------"

"------------> FIX: Movement Arrow Keys in INSERT mode
"imap <ESC>oA <ESC>ki
"imap <ESC>oB <ESC>ji
"imap <ESC>oC <ESC>li
"imap <ESC>oD <ESC>hi

inoremap ii <Esc>
"inoremap <leader> <Nop>
"nnoremap \ <Esc>
"inoremap \ <Esc>
"vnoremap \ <Esc>
nnoremap ; :
set completeopt=longest,menuone
set completeopt=menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

map <C-Shift-J> <Nop>

"------ Windows and Buffers ------"
"enew to create new buffers
"new for split
"newv for split v
map <C-j> :bprev<CR>
map <C-h> :bprev<CR>
map <C-k> :bnext<CR>
map <C-l> :bnext<CR>

"inoremap bksl \
"press ctrl-v then shift+enter to get ^M
"nnoremap <C-CR> i<CR><Esc>
"nnoremap <C-BS> i<BS><ESC>
nnoremap <Space> /
"nnoremap <S-Space> ?

"More intuitive movement when wordwrap is on
nnoremap j gj
nnoremap k gk

"Jump 10 lines
nnoremap J 10j
nnoremap K 10k
nnoremap H _
nnoremap L $
vnoremap K 10k
vnoremap H _
vnoremap L $
nnoremap cL c$
nnoremap cH c0
nnoremap dL d$
nnoremap dH d0
nnoremap vL v$
nnoremap vH v0

nnoremap == gg=G<C-o><C-o>
nnoremap - g-
nnoremap + g+

"nnoremap y "+y
"nnoremap "+y"+y "+yy
"vnoremap y "+y
"nnoremap Y "+yy
"nnoremap p "+p
"vnoremap p "+p
nnoremap <C-y> "+y
vnoremap <C-y> "+y
"nnoremap <C-Y> "+yy
"vnoremap <C-Y> "+yy
nnoremap <C-p> "+p
vnoremap <C-p> "+p
nnoremap B :b 
nnoremap sd "+yiw:!clear && sdcv <C-r>+<CR>
vnoremap sd "+y:!clear && sdcv <C-r>+<CR>
"nnoremap <C-W> :set wrap!<CR>
"get matches under cursor
nnoremap , :%s///gn<CR>
nnoremap n n:%s///gn<CR><C-o>
command NOTAB set noexpandtab|set tabstop=4
command W set wrap!
command BD b#|bd#
nnoremap MOO :!cowsay Moo >> <C-R>%<CR>
set hidden "allows switching between buffers without having to save

"<-------- HTML -------->
autocmd FileType html inoremap ;ht <html></html><ESC>F>F>a
autocmd FileType html inoremap ;p <p></p><ESC>F>F>a
autocmd FileType html inoremap ;h1 <h1></h1><ESC>F>F>a
autocmd FileType html inoremap ;b <b></b><ESC>F>F>a
autocmd FileType html inoremap ;i <i></i><ESC>F>F>a
"/<-------- HTML -------->
"check one time after 4s of inactivity in normal mode
"set autoread                                                                                            
"au CursorHold * checktime     

let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4
let g:detectindent_preferred_when_mixed = 1
autocmd BufReadPost * :DetectIndent 
abbrev qq qa!

hi TabLineFill ctermfg=0
hi TabLine ctermfg=grey ctermbg=0
"Remove underline from tabs
"NONE, bold, underline are valid options
hi TabLine cterm=underline
hi TabLineSel ctermfg=WHITE ctermbg=NONE
hi TabLineSel cterm=bold
":hi TabLineFill ctermfg=LightGreen ctermbg=DarkGreen
":hi TabLine ctermfg=Blue ctermbg=Yellow
":hi TabLineSel ctermfg=Red ctermbg=Yellow
"highlight search
"set hlsearch
"clear highlighted search
"nnoremap <CR> :nohl<CR>


"set switchbuf=usetab,useopen,newtab
"autocmd BufReadPost * :tab sball
"NOTES
"dtX = delete until X, noninclusive
"dfX = delete until X, inclusive; delete for X
":tab sball - this opens a new tab for each open buffer.
":help switchbuf - this controls buffer switching behaviour, try :set switchbuf=usetab,newtab.
set modeline
set modelines=1
autocmd VimLeave * call system("xsel -ib", getreg('+'))

