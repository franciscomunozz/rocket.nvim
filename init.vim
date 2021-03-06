
set nocursorline
set relativenumber
set mouse=a "activar mouse
set noshowmode "no mostrar el modo en que estamos
set encoding=utf-8 "codificar todos los archivos en utf-8
set cursorline "mostrar linea de codigo
set hidden "mover entre buffers
"identar
set expandtab
set shiftwidth=3

"set nerdfont
set guifont=JetBrainsMono\ Nerd\ Font:h11

"plugins
call plug#begin()
Plug 'hrsh7th/vim-vsnip' "snippets
Plug 'voldikss/vim-floaterm' "floaterm
Plug 'ghifarit53/tokyonight-vim' "colorscheme
Plug 'vim-airline/vim-airline' "barra de estado
Plug 'vim-airline/vim-airline-themes' "barra de estado
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc
Plug 'navarasu/onedark.nvim' "onedark 
Plug 'ryanoasis/vim-devicons' "devicons
Plug 'grvcoelho/vim-javascript-snippets' "javascript snippets
Plug 'rktjmp/lush.nvim' "lush 
Plug 'ellisonleao/gruvbox.nvim' "gruvbox 
"Plug 'honza/vim-snippets' "snippets para varios lenguajes de programacion
Plug 'glepnir/dashboard-nvim' "dashboard
Plug 'junegunn/fzf.vim' "fzf
Plug 'arcticicestudio/nord-vim' "nord
Plug 'arcticicestudio/nord-vim', { 'on': 'NERDTreeToggle' }
call plug#end()


"set colorscheme 
colorscheme nord



"vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='nord'

"keybins
let mapleader=" "
nmap <TAB> :bnext<CR>
nmap <S-TAB> :bprevious<CR>
"guardar un archivo
nmap <leader>w :w<CR>
"salir de un archivo 
nmap <leader>q :q<CR>
"guardar y salir de un archivo
nmap <leader>wq :wq<CR>
"recargar nvim 
nmap <leader>so :so%<CR>
"instalar plugins 
nmap <leader>pi :PlugInstall<CR>
"eliminar plugins 
nmap <leader>pc :PlugClean<CR>
nmap <leader>t :FloatermNew<CR>
nmap <leader>tt :FloatermToggle<CR>

"------------------------------------------------COC EXPLORER CONFIG
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_matchit = 1

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '%APPDATA%\Local\nvim',
\   },
\   'cocConfig': {
\      'root-uri': '%APPDATA%\Local\nvim\coc-settings.json',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\   'git': {
\     'sources': [{'name': 'git', 'expand': v:true}]
\   },
\ }
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
augroup coc-explorer
  if @% == '' || @% == '.'
    autocmd User CocNvimInit bd
    autocmd User CocNvimInit CocCommand explorer
  endif
augroup END
if exists('#User#CocGitStatusChange')
  doautocmd <nomodeline> User CocGitStatusChange
endif
nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <leader>p :CocCommand explorer --preset floating<CR> 

"dashboard 
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>'

" Snipets
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
