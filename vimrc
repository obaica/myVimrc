" ====================================================================="
"
"   ----------------  Author: PWE
"   ----------------  Email: dicksonliuming@gmail.com
"
"   -- Brief --
"   这个配置文件包含了所有我使用的vim所应该有的配置，包括通用配置、插件、
"   快捷键映射、外部配置文件引用、自定义快捷键等。
"   如果你是第一次使用该vim配置文件，需要在shell中执行如下一行命令：
"       `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
"   然后需要找到“Vundle”部分，注释掉不需要的插件，反注释需要
"   用的插件，然后运行":PluginInstall"来安装插件。
"   如果VIM是用编译的方法安装，需要在安装后对VIM的环境变量做配置，常规的配置
"   应该是在/etc/profile中加入：
"       ```
"       export VIM=/etc/vim
"       export VIMRUNTIME=/usr/local/share/vim/vim80
"       ```
"       然后source /etc/profile
"   还需要在bashrc中配置$VIM, $VIMRUNTIME
"
"   -- Contents --
"   0. mark: c 目录
"   1. mark: a 快捷键说明
"   2. mark: g 通用设置
"   3. mark: k 自定义快捷键
"   4. mark: m 编译相关
"   5. mark: v Vundle环境配置与插件配置

" ========== Description of Custom shortcut keys 自定义快捷键说明 ==========="
" ---------- Ctrl系按键 ----------
"
" Ctrl + O                   --跳到上一个编辑位置     [Normal模式]
" Ctrl + I                   --跳回下一个编辑位置     [Normal模式]
"
" Ctrl + u                   --向上滚屏               [Normal模式]
" Ctrl + d                   --向下滚屏               [Normal模式]
"
" Ctrl + h                   --切换到左边的分屏窗口
" Ctrl + l                   --切换到右边的分屏窗口
" Ctrl + k                   --切换到上边的分屏窗口
" Ctrl + j                  --切换到下边的分屏窗口
"
" Ctrl + d                  --关闭当前标签窗口，如果只剩最后一个，则退出vim
"
" Ctrl + o                  --返回光标上次停留位置，另外''也可以实现返回，但只能返回一次
"
" Ctrl + e                  --向下翻滚页面一行，光标不移动
" Ctrl + y                  --向上翻滚页面一行，光标不移动
"
" Ctrl + n                  --多光标选中与当前光标字段相同的下一个字段 [vim-multiple-cursors]
" Ctrl + p                  --多光标选中与当前光标字段相同的上一个字段 [vim-multiple-cursors]
" Ctrl + x                  --取消当前多光标选中的字段 [vim-multiple-cursors]
"
" Ctrl + u                  --将之前输入的一串字符转换为大写，完美解决不按capslock键输入一串大写字符的问题，也完美取代capslock
"
" ---------- Shift系按键 ----------
"
" Shift + >>                 --当前行缩进增加一个单位  [Normal]
" Shift + <<                 --当前行缩进减少一个单位  [Normal]
"
" ---------- Leader系按键 ----------
"  你可以输入 :map <Leader> 比如：:map ,
"  来打印出所有以<Leader>键开头的键盘映射
"
" <Leader>c                  --复制至公共剪贴板       [仅选择模式]
" <Leader>a                  --复制所有至公共剪贴板   [Normal模式可用]
"
" <Leader>rb                 --一键去除所有尾部空白   [全模式可用]
" <Leader>rm                 --一键去除^M字符         [全模式可用]
" <Leader>rt                 --一键替换全部Tab为空格  [全模式可用]
" <Leader>ra                 --一键清理当前代码文件   [Normal模式可用]
"
" <Leader>bb                 --按=号对齐代码          [Normal模式可用]
"
" <Leader>ev                 --编辑当前所使用的Vim配置文件
"
" <Leader>/                  --取消搜索后的单词高亮
"
" "<Shift-Tab>               --向前轮询切换每一个标签
"
" "<Leader>vsp               --将当前所在标签文件复制并左右分割
" "<Leader>sp                --将当前所在标签文件复制并上下分割
"
" ---------- 格式化命令 ----------
"
" ==                         --缩进当前行
" =G                         --缩进直到文件结尾
" gg=G                       --缩进整个文件
" 行号G=行号G                 --缩进指定区间

" u [小写]                   --单步复原               [非插入模式]
" U [大写]                   --整行复原               [非插入模式]
" Ctrl + R                   --反撤消                 [非插入模式]
"
" ---------- 搜索命令 ----------
"
" #                          --向前搜索当前光标所在字符
" *                          --向后搜索当前光标所在字符
" ?                          --向前搜索
" /                          --向后搜索
"
" ---------- 跳转命令 ----------
"
" 0 or ^ or $                --跳至 行首 or 第一个非空字符 or 行尾
" %                          --在匹配的括号间跳跃
" { or }                     --按段落上/下跳跃
" f字符                      --跳至从当前光标开始本行第一个指定字符出现的位置
" gd                         --跳至当前光标所在单词首次出现的位置
" gf                         --打开当前光标所在的文件名，如果确实存在该文件的话
"
" ]c                         --跳到下一个差异处
" [c                         --跳到上一个差异处
"
" [ Ctrl+D                   --跳至当前光标所在变量的首次定义位置 [从文件头部开始]
" [ Ctrl+I                   --跳至当前光标所在变量的首次出现位置 [从文件头部开始]
" [ D                        --列出当前光标所在变量的所有定义位置 [从文件头部开始]
" [ I                        --列出当前光标所在变量的所有出现位置 [从文件头部开始]
"
" ---------- 文本操作 ----------
"
" dw de d0 d^ d$ dd          --删除
" cw ce c0 c^ c$ cc          --删除并进入插入模式
" yw ye y0 y^ y$ yy          --复制
" vw ve v0 v^ v$ vv          --选中
"
" di分隔符                   --删除指定分隔符之间的内容 [不包括分隔符]
" ci分隔符                   --删除指定分隔符之间的内容并进入插入模式 [不包括分隔符]
" yi分隔符                   --复制指定分隔符之间的内容 [不包括分隔符]
" vi分隔符                   --选中指定分隔符之间的内容 [不包括分隔符]
"
" da分隔符                   --删除指定分隔符之间的内容 [包括分隔符]
" ca分隔符                   --删除指定分隔符之间的内容并进入插入模式 [包括分隔符]
" ya分隔符                   --复制指定分隔符之间的内容 [包括分隔符]
" va分隔符                   --选中指定分隔符之间的内容 [包括分隔符]
"
" Xi和Xa都可以在X后面加入一个数字，以指代所处理的括号层次
" 如 d2i( 执行的是删除当前光标外围第二层括号内的所有内容
"
" dt字符                     --删除本行内容，直到遇到第一个指定字符 [不包括该字符]
" ct字符                     --删除本行内容，直到遇到第一个指定字符并进入插入模式 [不包括该字符]
" yt字符                     --复制本行内容，直到遇到第一个指定字符 [不包括该字符]
" vt字符                     --选中本行内容，直到遇到第一个指定字符 [不包括该字符]
"
" df字符                     --删除本行内容，直到遇到第一个指定字符 [包括该字符]
" cf字符                     --删除本行内容，直到遇到第一个指定字符并进入插入模式 [包括该字符]
" yf字符                     --复制本行内容，直到遇到第一个指定字符 [包括该字符]
" vf字符                     --选中本行内容，直到遇到第一个指定字符 [包括该字符]
"
" <                           --可视化模式下整块代码左移一个tab位
" >                           --可视化模式下整块代码右移一个rab位
"
" ---------- 便捷操作 ----------
"
" Ctrl + A                   --将当前光标所在数字自增1        [仅普通模式可用]
" Ctrl + X                   --将当前光标所在数字自减1        [仅普通模式可用]
" :g/^/m0                    --将整个文件所有行排列顺序颠倒   [命令模式]
" m字符       and '字符      --标记位置 and 跳转到标记位置
" q字符 xxx q and @字符      --录制宏   and 执行宏

" ======================= General setup 通用配置 =========================="
"
:se ff=mac                " --更改文件格式，可选 unix、dos、mac

" ------------ 定义快捷键前缀，即<Leader>" --------------
let mapleader=","

" ------------ 判断操作系统类型 -------------
""if system is windows
"let g:isWIN = 1
"let g:isMAC = 0

""if system is mac
"let g:isWIN = 0
"let g:isMAC = 1

""if system is others
let g:isWIN = 0
let g:isMAC = 0

" ------------ 判断是否处于GUI界面 -------------
""if GUI
"let g:isGUI = 1
""if not GUI
let g:isGUI = 0


" ------------ 设置着色模式和字体 -------------
" 如果在~/.vim/colors/路径下已经放置了molokai.vim主题，但依然无法显示molokai主题
" 问题可能原因是，在终端下运行，终端没有配置成256色，需要在.bashrc中增加：
"       ` export TERM=xterm-256color `
" 并 source .bashrc即可
set background=dark
""if in windows or mac GUI
"colorscheme molokai
"set guifont=Monaco:h14
""if in terminal
colorscheme molokai
set guifont=Monaco\ 14

" ------------- 基本配置 --------------
set autowrite                   " 自动保存"
set backspace=eol,start,indent  " 设置退格键可用
set whichwrap+=<,>,h,l          " 配合退格键使用
set autoindent!                 " 设置自动缩进
set smartindent                 " 智能自动缩进
set cindent                     " c/c++缩进模式
set relativenumber              " 开启相对行号
set number!                     " 显示行号
set ruler                       " 右下角显示光标位置的状态行
set incsearch                   " 开启实时搜索功能，搜索时可以实时匹配
set hlsearch                    " 开启高亮显示结果
set ignorecase                  " 搜索时大小写不敏感"
set smartcase                   " 如果搜索内容中包含大写字母，则不使用ignorecase
set nowrapscan                " 搜索到文件两端时不重新搜索
set nocompatible                " 关闭vi兼容模式，避免之前版本的一些bug
set hidden                      " allow change buffer when current buffer is unsave "允许在有未保存的修改时切换缓冲区
set autochdir                   " 设定文件浏览器目录为当前目录
" set foldmethod=indent         " 选择代码折叠类型，基于缩进进行代码折叠
set foldmethod=syntax           " 选择代码折叠类型，基于语法进行代码折叠
set foldlevel=100               " 禁止自动折叠
" set nofoldenable              " 启动vim时关闭折叠代码
set foldenable                  " 启动vim时打开折叠代码
set laststatus=2                " 开启状态栏信息，2为总显示最后一个窗口的状态行，1则为窗口数多于一个的时候显示最后一个窗口的状态行，0为不显示最后一个窗口的状态行
set cmdheight=2                 " 命令行的高度，默认为1，这里设为2
set autoread                    " 当文件在外部被修改时自动更新该文件
set nobackup                    " 不生成备份文件
set noswapfile                  " 不生成交换文件
set wildmenu                    " vim 自身命令行模式智能补全"
set list                        " Show special characters " 显示特殊字符
set listchars=tab:\~\ ,trail:.  " Tab is indicated with '~', trail is indicated with '.' "Tab使用高亮~代替，尾部空白使用高亮点号代替
set showmatch                   " 显示括号配对情况
set nowrap                      " 禁止代码自动折行
set history=100                 " 设置vim历史记录最大条目数
"set magic
set mat=4                       " 光标闪烁以及闪烁频率

set lazyredraw                  " Don't update screen during macro and script execution "在宏和脚本运行时不要刷新屏幕（提高使用性能）

"set scroll=5                   " 指定翻页时的行数，默认不设置则为半页
set scrolloff=7                 " When moving the cursor scroll the screen, at least remain the 'scrolloff' lines above or below
                                "上下移动光标使正文滚页时，光标的上方或下方将至少始终保留的行数，默认给7行 set so=7

set cursorline                  " highlight current line "高亮光标当前行
set cursorcolumn                " highlight current column "高亮光标当前列
hi CursorLine   cterm=underline ctermbg=darkred ctermfg=none  " config current line color style "配置高亮当前行样式
hi CursorColumn cterm=NONE  ctermbg=lightmagenta ctermfg=none " config current column color style "配置高亮当前列样式

set showcmd                     " 命令行显示输入的命令
set showmode                    " 命令行显示vim当前模式中

"set mouse=a                    " 启动鼠标操作
set mouse-=a                    " 关闭鼠标操作

" ------------- 设置通用缩进策略 --------------
set expandtab                   " Automatically converts tabs to Spaces " 将Tab自动转化成空格
set tabstop=4                   " Spaces occupied by tab " 设置编辑时制表符占用空格数
set shiftwidth=2                " Spaces occupied by tab when formatting " 设置格式化时制表符占用空格数
set softtabstop=2               " Treat the number of spaces as tab " 把连续数量的空格视为一个制表符
set smarttab                    " delete a tab with one backspace button " 按一次backspace就删除整个tab

au FileType c,cpp,html,htmldjango,lua,javascript,nsis
    \ set expandtab | set tabstop=2 | set shiftwidth=2  " change tab indent strategy for some c style files

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs, set tabs to 8 spaces
" 在makefile中，不将tabs扩展成空格，因为我们需要真的tab，并设定tab为8个空格
au FileType make set noexpandtab | set tabstop=8 | set shiftwidth=8
" auto wrap in xml file
au FileType xml set wrap
" 与系统共用剪切板，（将系统剪切板与匿名寄存器映射）
set clipboard=unnamed

set textwidth=80                " set textwidth, auto return to next line when exceed the number
                                " 设置文本宽度，当输入大于该数值时，自动换行
set colorcolumn=81              " textwidth border highlight "文本宽度高亮提示线

" ------------- 文件类型检测与语法开关 --------------
if has("syntax")
    syntax enable               " 打开语法高亮
    syntax on                   " 允许用指定语法高亮配色方案替换默认方案
endif
filetype on                     " 开启文件类型侦测
filetype indent on              " 针对不同的文件类型采用不同的缩进格式
filetype plugin on              " 针对不同的文件类型加载对应的插件
filetype plugin indent on       " 针对不同的文件类型加载对应的插件缩进

" -------------- 根据后缀名指定文件类型 ---------------
autocmd BufRead,BufNewFile *.h        setlocal ft=c
autocmd BufRead,BufNewFile *.i        setlocal ft=c
autocmd BufRead,BufNewFile *.m        setlocal ft=objc
autocmd BufRead,BufNewFile *.ss       setlocal ft=scheme
autocmd BufRead,BufNewFile *.txt      setlocal ft=txt
autocmd BufRead,BufNewFile *.log      setlocal ft=conf
autocmd BufRead,BufNewFile hosts      setlocal ft=conf
autocmd BufRead,BufNewFile *.conf     setlocal ft=dosini
autocmd BufRead,BufNewFile *.ini      setlocal ft=dosini
autocmd BufRead,BufNewFile CMakeLists.txt setlocal ft=cmake
autocmd BufRead,BufNewFile *.cmake setlocal ft=cmake
autocmd BufRead,BufNewFile *.launch setlocal ft=xml

" -------------- 设置文件编码和文件格式 ---------------
set fenc=utf-8
set encoding=utf-8                          " 设置内部编码"
set fileencodings=utf-8,gbk,cp936,latin-1   " 设置支持的文件编码"
set ambiwidth=double
set fileformat=unix                         " 设置新文件的EOL格式"
set fileformats=unix,mac,dos                " 给出文件的EOL格式类型"

if g:isWIN    " 以下的内容是用于避免中文菜单的乱码问题，默认设置为在windows系统中启用
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif

" -------------- 打开vim，自动定位到上次最后变更的位置 ---------------
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal!g'\"" | endif

" -------------- 使用GUI界面时的设置 ---------------------------------
if g:isGUI
    " 启动时自动最大化窗口
    if g:isWIN
        au GUIEnter * simalt ~x
    endif
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    set guioptions+=c        " 使用字符提示框
    " set guioptions-=m        " 隐藏菜单栏
    " set guioptions-=T        " 隐藏工具栏
    " set guioptions-=L        " 隐藏左侧滚动条
    " set guioptions-=r        " 隐藏右侧滚动条
    " set guioptions-=b        " 隐藏底部滚动条
    " set showtabline=0        " 隐藏Tab栏
    set cursorline           " 高亮突出当前行
    " set cursorcolumn       " 高亮突出当前列
endif

" ------------- Use for LLVM -------------------
augroup filetype
    au! BufRead,BufNewFile *Makefile*       set filetype=make
augroup END

" Set a few indentation parameters for LLVM source code style.
set cinoptions=:0,g0,(0,Ws,l1

" Delete trailing whitespace and tabs at the end of each line
command! DeleteTrailingWs :%s/\s\+$//

" Enable syntax highlighting for LLVM files. To use, copy
" utils/vim/llvm.vim to ~/.vim/syntax
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
" Enable syntax highlighting for tablegen files. To use, copy
" utils/vim/tablegen.vim to ~/.vim/syntax
augroup filetype
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" ==================== Custom shortcut key 自定义快捷键 =================== "

"关闭方向健"
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>
imap <Up> <Nop>
imap <Down> <Nop>

" Ctrl + hjkl 改为切换窗口键"
map <c-h> <esc><c-w>h
map <c-l> <esc><c-w>l
map <c-k> <esc><c-w>k
map <c-j> <esc><c-w>j

map <c-d> :bdelete<cr>

" Ctrl + vs 为将当前窗口左右复制分割
" Ctrl + hs 为将当前窗口上下复制分割
nnoremap <Leader>vs <esc><c-w>v
nnoremap <Leader>hs <esc><c-w>s
" 另外备注：
" 打开新文件并左右分割：:vsp filename
" 打开新文件并上下分割：:sp filename
nnoremap :vs :vsp
nnoremap :hs :sp
"
" 调整窗口大小
nnoremap <silent> + :exe "resize " . (winheight(0) * 4/3)<cr>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 3/4)<cr>
nnoremap <silent> = :exe "vertical resize " . (winwidth(0) * 4/3)<cr>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 3/4)<cr>
"
"交换上下行切换的物理切换与逻辑切换"
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" 增加一行但不进入插入模式"
nnoremap to o<Esc>
nnoremap tO O<Esc>

"关闭上次搜索的高亮"
noremap <silent><leader>/ :nohls<CR>

" 保证缩进调整后，还是选中状态"
vnoremap < <gv
vnoremap > >gv

" 自动跳转到粘贴文本的最后
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"没有权限时保存"
cmap w!! w !sudo tee >/dev/null %

"改变撤销后反撤销的键位"
nnoremap U <C-r>

" 将之前输入的一串字符转换为大写，完美替换[CapsLock]
inoremap <C-u> <esc>gUiwea

" Ctrl + ]            多选择跳转
nmap <c-]> g<c-]>
vmap <c-]> g<c-]>

nnoremap J <esc>8j<cr>  " Scroll down for the specified lines "向下滚屏 8行
nnoremap K <esc>8k<cr>  " Scroll up for the specified lines "向上滚屏 8行

" nnoremap H :bp<cr>  " switch to previous buffer "切换到之前一个buffer
" nnoremap L :bn<cr>  " switch to next buffer "切换到之后一个buffer
" switch to line head "光标跳转到行首
nnoremap H 0
" switch to line tail "光标跳转到行尾
nnoremap L $

" \c                  复制至公共剪贴板
vmap <leader>c "+y

" \a                  复制所有至公共剪贴板
nmap <leader>a <esc>ggVG"+y<esc>

" \rb                 一键去除所有尾部空白
imap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
nmap <leader>rb :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>
vmap <leader>rb <esc>:let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar>:nohl<cr>

" \rm                 一键去除windows字符^M
imap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>
nmap <leader>rm :%s/<c-v><c-m>//g<cr>
vmap <leader>rm <esc>:%s/<c-v><c-m>//g<cr>

" \rt 一键替换全部Tab为空格
imap <leader>rt <esc>:retab<cr>
nmap <leader>rt :retab<cr>
vmap <leader>rt <esc>:retab<cr>

" \ra 一键清理当前代码文件
nmap <leader>ra <esc><Leader>rt<esc><Leader>rb<esc><Leader>rm<esc>gg=G<esc>

nmap <leader>ev <esc>:e $MYVIMRC<cr>       " \ev open and edit default vimrc "打开编辑默认vimrc
nmap <leader>sv <esc>:source $MYVIMRC<cr>  " \sv source default vimrc "生效默认vimrc

" 真正的删除，而不是剪切
nnoremap <leader>x "_x
nnoremap <leader>X "_X
nnoremap <leader>d "_d
nnoremap <leader>dd "_dd
nnoremap <leader>D "_D
vnoremap <leader>d "_d
vnoremap <leader>dd "_dd

highlight ExtraWhitespace ctermbg=red guibg=red         " highlight trailing whitespace in red "高亮行末空格为红色
match ExtraWhitespace /\s\+$/                           " match trailing whitespace "匹配行末空格
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()               " for performance

" This function can delete trailing whitespace "这个函数通过替换命令删除行尾空格
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc

au BufWrite * :call DeleteTrailingWS()    " Auto delete trailing whitespace when save file "保存时自动删除行尾空格

" ========================== about make 编译相关 ======================================= "
" 在程序工程目录下的workspace.vim中，需要编写如下命令，其中的路径要填写为当前程序路径"
" \mm 使用make编译当前工程
" \mc 使用make clean清空当前工程
" \mi 使用make install安装当前工程二进制文件
"nnoremap <silent> <Leader>mm :wa<cr> :make -C ~/project/<cr> :cw<cr>
"nnoremap <silent> <Leader>mc :make clean -C ~/project/<cr> :cw<cr>
"nnoremap <silent> <Leader>mi :make install -C ~/project/<cr> :cw<cr>
" 注意，若向使:cw正常跳转到出错文件，需要将make输出信息设置为英文，如在.bashrc中添加:
" export LANGUAGE=en_US.UTF-8
" \mp 上一项错误项
" \mn 下一项错误项
noremap <Leader>mp :cp<cr>
noremap <Leader>mn :cn<cr>

" ========================== Environment deployment of Vundle and Plugins Vundle ======= "
" [COMETOVUNDLE]
" ==== 环境配置以及插件 ===== "
" 如果你是第一次使用该vim配置文件，需要在shell中执行如下一行命令：
" `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
"
" 在命令行模式下输入：
" PluginInstall         " 安装下边罗列出的所有插件
" PluginClean           " 清除下边注释或未罗列但在系统中存在的插件
" PluginUpdate          " 更新下边罗列出的所有插件

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle 管理的插件必须位于 vundle#begin() 和 vundle#end() 之间"
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'            " vim下美观智能任务栏，取代vim-powerline，同时可取代minibufexpl
Plugin 'octol/vim-cpp-enhanced-highlight'   " c++ 增强高亮插件
Plugin 'Yggdroot/indentLine'                " 缩进指示
" Plugin 'derekwyatt/vim-fswitch'           " 源文件与头文件快速切换
" Plugin 'lilydjwg/fcitx.vim'               " 插入模式是中文输入后，返回命令模式自动切换回英文
Plugin 'scrooloose/nerdtree'              " 工程目录管理，替代vim中固定的newtrw插件，功能一样
Plugin 'scrooloose/nerdcommenter'           " 自动开关注释
" Plugin 'SirVer/ultisnips'                 " 模板补全插件 替代snipmate
Plugin 'dyng/ctrlsf.vim'                  " 工程目录下的内容查找，基于ack，替代grep.vim和ack.vim插件
" Plugin 'kshenoy/vim-signature'            " 文件书签辅助，显示书签等功能
" Plugin 'vim-scripts/taglist.vim'          " 辅助实现tag显示
Plugin 'majutsushi/tagbar'                  " exchange taglist，better than taglist
Plugin 'jiangmiao/auto-pairs'               " 括号自动补全插件
Plugin 'ctrlpvim/ctrlp.vim'               " 文件模糊搜索插件
"Plugin 'junegunn/fzf'                     " 比ctrlp快不少的模糊搜索插件，可以替换ctrlp，但需要系统安装fzf
"Plugin 'Yggdroot/LeaderF'                  " 另一个能替换ctrlp的插件，和fzf差不多，但依赖少
" Plugin 'terryma/vim-multiple-cursors'     " 多光标操作插件
" Plugin 'Valloric/YouCompleteMe'           " 比较难安装的一个插件
"  syntastic这个插件由于在最新的YouCompleteMe中已经集成，所以不再使用
" Plugin 'scrooloose/syntastic'             " 语法检查插件，最新的YouCompleteMe也集成了这个插件
" Plugin 'Lokaltog/vim-easymotion'          " 快速移动插件
" Plugin 'vim-scripts/DoxygenToolkit.vim'   " 可以通过快捷键快速添加doxygen注释
Plugin 'othree/xml.vim'                     " xml file helper
" Plugin 'taketwo/vim-ros'                  " used to develop ros
Plugin 'airblade/vim-gitgutter'             " show git diff in the code, jump to changed code hunks
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }     " confirm you have already install fzf
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype on

" ---------- 插件配置选项 ----------"
" 可以通过搜索：Plugin:[plugin name]来全文快速查找插件配置
"
" # 部分插件需要系统软件的支持，罗列在这里：
" ctrlsf 插件需要系统安装有 ack, sudo apt-get install ack-grep
" Ultisnips 插件需要系统.vim文件夹中设置好 snips脚本
" taglist 插件需要系统安装有 ctags，sudo apt-get install ctags，并且在使用前在工程中创建ctags标签文件
" YCM 插件需要系统的支持，需要系统vim支持python，注意不是python3，需要clang支持，是唯一需要编译才可以运行的插件

" Plugin:vim-airline (https://github.com/vim-airline/vim-airline)"
" 加入airline状态栏
let g:airline_powerline_fonts = 1 " 字体
let g:airline#extensions#tabline#enabled = 1  " 允许显示tabline
let g:airline#extensions#tabline#formatter = 'unique_tail'   " tabline上的标题只显示文件名
let g:airline#extensions#tabline#buffer_nr_show = 1    " tabline上显示buffer的标号
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
let g:airline#extensions#whitespace#enabled=0   " 下边两行为关闭状态栏空白符号计数显示
let g:airline#extensions#whitespace#symbol='!'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Plugin:indentLine (https://github.com/Yggdroot/indentLine)"
" 缩进指示插件
let g:indentLine_color_term = 239
let g:indentLine_char = '|'
let g:indentLine_enabled = 1

" Plugin:vim-fswitch (https://github.com/derekwyatt/vim-fswitch)"
" 源文件与头文件快速切换插件
nmap <silent> <Leader>sw :FSHere<cr>
" 跳转到同一工程路径下的另一个目录下寻找对应项
autocmd! BufEnter *.c let b:fswitchdst = 'h' | let b:fswitchlocs = '../inc'
autocmd! BufEnter *.h let b:fswitchdst = 'c' | let b:fswitchlocs = '../src'
autocmd! BufEnter *.cpp let b:fswitchdst = 'hpp' | let b:fswitchlocs = '../inc'
autocmd! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = '../src'

" Plugin:nerdtree (https://github.com/scrooloose/nerdtree)"
" NERDTree            树形文件浏览器
" o 打开/关闭光标所在目录
" t 在新tab中打开文件或目录，并跳转
" T 在新tab中打开文件或目录，并不跳转
" p 跳转到父节点
" P 跳转到根节点
" q 关闭nerdtree窗口
" \nt 打开/关闭文件树窗口快捷键
nmap <leader>nt :NERDTree<cr>
let g:NERDTreeShowHidden = 1                   " 显示隐藏文件
let NERDTreeWinSize=25                          " 设置子窗口宽度
let NERDTreeWinPos="left"                      " 设置子窗口位置
let NERDTreeMinimalUI=1                         " 子窗口不显示冗余帮助信息
let NERDTreeAutoDeleteBuffer=1                  " 删除文件时自动删除对应buffer

" Plugin:nerdcommenter (https://github.com/scrooloose/nerdcommenter)"
" NERDcommenter      注释处理插件
" 以下为插件默认快捷键，其中的说明是以C/C++为例的
" \ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" \cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" \cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" \cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" \cca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" \cA 行尾注释
let g:NERDSpaceDelims = 1                        " 自动添加前置空格
let g:NERDCompactSexyComs = 1                    " 美化多行注释下的紧凑语法
let g:NERDefaultAlign = 1                        " 注释在评论行的最左边而不是跟随代码缩进
let g:NERDAltDelims_c = 1                        " 使用c的分隔符作为默认备用分隔符
let g:NERDCustomDelimiters = { 'c': { 'left': '/*', 'right': '*/'} }   " 用户定义
let g:NERDCommentEmptyLines = 1                  " 允许注释空行

" Plugin:Ultisnips (https://github.com/SirVer/ultisnips)
" 自动补全插件
" ~/.vim/bundle/ultisnips/mysnippets需要备份，或者：
" 在安装插件后，在目录`~/.vim/bundle/ultisnips/`下，新建目录`mysnippets`，在该目录下手动下载snippets
" 下载地址：https://github.com/honza/vim-snippets，可以直接输入:
" `wget https://raw.githubusercontent/honza/vim-snippets/c.snippets`下载，c.snippets可以换成其他语言
" 另外，我在我的repo中提供了一些snippets
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips模板补全快捷键与YCM快捷键有冲突，所以重新设定"
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Plugin:ctrlsf (https://github.com/dyng/ctrlsf.vim)"
" 强大的工程目录名称搜索内容查找插件
" 需要系统安装ack, ubuntu下为sudo apt-get install ack-grep
" 进入ctrlsf后的基本操作：
" p 打开当前选中匹配项，但不关闭ctrlsf窗口"
" q 关闭ctrlsf窗口，不进行匹配"
" <enter> 打开当前选中匹配项，并关闭ctrlsf窗口"
" <Leader>sf 搜索快捷键, 速记 ctrl's''f'
nnoremap <Leader>sf :wa<cr> :CtrlSF<cr>
" 默认搜索路径为工程目录，工程目录的确认是寻找最近的.git .hg .svn .bzr _darcs"
let g:ctrlsf_default_root = 'project'

" Plugin:vim-signature (https://github.com/kshenoy/vim-signature)"
" 辅助标签使用的插件，如标签显示，添加标签等
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "m?"
            \ }

" Plugin:taglist.vim (https://github.com/vim-script/taglist.vim)"
" 用于显示tag的辅助插件
" 需要系统中有ctags支持
" :TlistOpen 用于打开taglist窗口
" :TlistClose 用于关闭taglist窗口，直接输入q也可以关闭窗口
" :TlistToggle 若打开则关闭，若关闭则打开
" <space> 显示光标下的tag的原型定义
" o 在一个新打开的窗口中显示光标下的tag
" x taglist窗口放大或缩小
" + 打开一个折叠，用zo也可以
" - 关闭一个折叠，用zc也可以
" × 打开所有折叠，用zR也可以
" = 关闭所有折叠，用zM也可以
" [[ 跳到前一个文件
" ]] 跳到后一个文件
" q 关闭taglist窗口
" \tl                 打开/关闭Tags窗口，在右侧栏显示 [Tagbar插件]
nmap <leader>tl :TlistToggle<cr>
nmap <leader>tg <esc><c-]>
nmap <leader>tr <esc><c-t>
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr><cr> :TlistUpdate<cr>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr><cr> :TlistUpdate<cr>
set tags=tags
set tags+=tags;/
set tags+=./tags "添加当前路径下的tags文件
let Tlist_Ctags_Cmd = '/usr/bin/ctags'      " 如果ctags在PATH路径下，可以不设置该项
"let Tlist_Show_One_File = 1                 " 不允许同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1               " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1              " 在右侧窗口中显示taglist窗口
"let Tlist_Auto_Open = 1                    " 启动vim时，自动打开taglist窗口
let Tlist_GainFocus_On_ToggleOpen = 1       " 当使用:TlistToggle打开taglist窗口时，自动跳转到taglist窗口
let Tlist_Close_On_Select = 1              " 选择了tag后自动关闭taglist窗口
let Tlist_File_Fold_Auto_Close = 1          " 当同时显示多个文件中的tag时，可只显示当前文件tag，其他的tag都折叠起来
let Tlist_Process_File_Always = 1           " 始终解析文件中的tag，而不管taglist是否打开
"let Tlist_Use_Horiz_Window = 1             " 设置taglist横向显示

" Plugin:tagbar
nmap <leader>tb :TagbarToggle<cr>
let g:tagbar_autofocus = 1

" Plugin:ctrlp插件"
" 文件模糊搜索，可以搜索文件、buffer、mru、tag等
" 原始为kien/ctrlp，使用改进版ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<cr>
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \}
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1

" Plugin:fzf插件
" you need to install fzf tool in your system and add install path to PATH
" then you need to move fzf.vim (find in fzf source project) to your .vim/plugin folder.
" be noticed that fzf.vim is not fzf vim plugin, but a help configure that fzf vim plugin needed.
nmap <Leader>f :Files<cr>
nmap <Leader>b :Buffers<cr>
nmap <Leader>t :Tags<cr>
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_history_dir = '~/.fzf-history'

" Plugin:Leaderf插件
let g:Lf_ReverseOrder = 1

" Plugin:vim-multiple-cursors插件
" 多光标操作插件
" 选中多个相同字段后，需要按c进入替换状态
let g:multi_cursor_usr_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Plugin:YouCompleteMe插件 (https://github.com/Valloric/YouCompleteMe)"
" 自动补全，定义跳转，语法检查插件
" 安装说明：
"       - 1.通过.vimrc中`PluginInstall`下载插件，需要一定的时间
"       - 2.开始安装插件: （需要一定时间）
"           ```
"               cd ~/.vim/bundle/YouCompleteMe
"               git submodule update --init --recursive
"               ./install.py --clang-completer
"           ```
"           其中的`--clang-completer`是c-family语言支持，如果需要c#补全，需要另外加`--omnisharp-completer`
"           如果系统中已经有clang(需要clang版本为3.9.0或以上，否则会出错)，加上`--system-libclang`
"       - 3.安装完成后，可能找不到c-family支持的东西，需要在`~/.vim/bundle/YouCompleteMe`中链接
"           `~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/`
"           ```
"               cd ~/.vim/bundle/YouCompleteMe
"               ln -s ./third_party/ycmd/cpp/
"           ```
"       - 4.可能需要配置`~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py`，实现一些特性
"           我在我的repo中增加了我的ycm_extra_conf.py，直接替换即可
"       -
"       5.参考的网页：
"           [1](http://blog.miskcoo.com/2015/12/vim-plugin-youcompleteme)
"           [2](http://blog.jobbole.com/58978)
"
" <leader>yf    跳转到定义或者跳转到声明
" <leader>yd    打开错误信息界面
" <Ctrl>o       返回跳转
" <Ctrl>i       撤销返回跳转，这两条与vim的系统跳转控制是一致的
nnoremap <Leader>yf :YcmCompleter GoToDefinitionElseDeclaration<cr>
nmap <Leader>yd :YcmDiags<cr>
"回车即选中当前项
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:ycm_global_ycm_extra_conf='/home/pwe/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
let g:ycm_seed_identifiers_with_syntax=1    "语法关键字补全
"let g:ycm_confirm_extra_conf=0             "打开vim不再询问是否加载ycm_extra_conf.py
let g:ycm_key_invoke_completion= '<C-a>'    " 主动调用补全，对于一些c/c++全局函数，是不会自动补全的，需要主动补全
"let g:ycm_key_list_select_completion=['<Down>']     "选择列表中选择某个项
let g:ycm_key_list_previous_completion=['<Up>']     "选择列表中选择前边一个项
let g:ycm_complete_in_comments=1            "在注释输入中也能补全
let g:ycm_complete_in_strings=1             "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings=0   "注释和字符串中的内容不收录到补全
set completeopt=longest,menu                "让补全菜单行为与一般ide一致

let g:clang_user_options='-I... || exit 0'

let g:ycm_semantic_triggers={
\   'roslaunch' : ['="', '$(', '/'],
\   'rosmsg,rossrv,rosaction' : ['re!^', '/'],
\}

" Plugin:syntastic插件(https://github.com/scrooloose/syntastic)"
" Syntastic           语法检查
" 由YouCompleteMe功能代替
" 语法检查是自动启动的
" <leader>s  打开错误界面
" <leader>sn 错误界面的下一条位置
" <leader>sp 错误界面的上一条位置
"nnoremap <Leader>s :call ToggleErrors()<cr>
"nnoremap <Leader>sn :lnext<cr>
"nnoremap <Leader>sp :lprevious<cr>
"关于开关配置
"let g:syntastic_error_symbol='>>'
"let g:syntastic_warning_symbol='>'
"let g:syntastic_check_on_open=1             "默认开启
"let g:syntastic_check_on_wq=0
"let g:syntastic_enable_highlighting=1
"let g:syntastic_python_checkers=['pyflakes']    "使用pyflakes，速度比pylint快
"let g:syntastic_javascript_checkers=['jsl','jshint']
"let g:syntastic_html_checkers=['tidy','jshint']
"修改背景高亮色，适应主题
"highlight SyntasticErrorSign guifg=white guibg=black
"关于错误列表
"let g:syntastic_always_populate_loc_list=0
"let g:syntastic_auto_loc_list=0
"let g:syntastic_loc_list_height=5
"function! ToggleErrors()
"    let old_last_winnr=winnr('$')
"    lclose
"    if old_last_winnr==winnr('$')
"        "打开错误界面
"        Errors
"    endif
"endfunction

" Plugin:vim-easymotion插件 (https://github.com/Lokaltog/vim-easymotion.git)
" 可以变换一些位置的字母为高亮特殊字符，然后直接跳转
" <Leader><Leader>w  向下跳转到指定字符处
" <Leader><Leader>b  向上跳转到指定字符处
" <Leader><Leader>s  指定搜索一个字符，将附近所有该字符重新变换，直接跳转
" <Leader><Leader>j   向下跳转到指定字符所在行行首
" <Leader><Leader>k  向上跳转到指定字符所在行行首
" <Leader><Leader>h  光标所在行光标之前的单词跳转
" <Leader><Leader>l  光标所在行光标之后的单词跳转
" <Leader><Leader>.  重复上一个跳转
let g:EasyMotion_smartcase=1
map <Leader><Leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>. <Plug>(easymotion-repeat)

" Plugin:DoxygenToolkit插件 (https://github.com/vim-scripts/DoxygenToolkit.vim)
" 可以快捷键自动添加doxygen注释
let g:DoxygenToolkit_briefTag_funcName = "yes"
" let g:DoxygenToolkit_commentType = "C++"
" let g:DoxygenToolkit_startCommentBlock = "/// "
" let g:DoxygenToolkit_interCommentBlock = "/// "
let g:DoxygenToolkit_briefTag_pre = "\\brief   "
let g:DoxygenToolkit_templateParamTag_pre = "\\tparam  "
let g:DoxygenToolkit_paramTag_pre = "\\param   "
let g:DoxygenToolkit_returnTag = "\\return  "
let g:DoxygenToolkit_throwTag_pre = "\\throw   " " @exception is also valid
let g:DoxygenToolkit_fileTag = "\\file    "
let g:DoxygenToolkit_dateTag = "\\date    "
let g:DoxygenToolkit_authorTag = "\\author  "
let g:DoxygenToolkit_versionTag = "\\version "
let g:DoxygenToolkit_blockTag = "\\name    "
let g:DoxygenToolkit_classTag = "\\class   "
let g:DoxygenToolkit_authorName = "S-PWE, dicksonliuming@gmail.com"

let g:Doxygen_enhanced_color = 1

" Plugin:vim-gitgutter (https://github.com/airblade/vim-gitgutter.git)
" 可以在代码中显示当前的修改情况，自动标记增加、删除、修改行，以及跳转到下个修改段等功能
"
" current hunk is what your cursor pointed to.
" <Leader>ha : add current hunk into git stage, if you regret to do it, use git
"              to rollback -- git reset HEAD <file>
" <Leader>hr : reset current hunk to what it write before
" <Leader>hv : view current hunk with a small window
" <Leader>hn : jump to next hunk
" <Leader>hm : jump to previous hunk
let g:gitgutter_terminal_reports_focus = 1
set updatetime=200 " Pay attentain that this is a vim config option
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hm <Plug>(GitGutterPrevHunk)
