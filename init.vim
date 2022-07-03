syntax on
call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'mhartington/oceanic-next'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'andys8/vim-elm-syntax'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'michal-h21/vim-zettel'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'kyazdani42/nvim-web-devicons'
"------------- Language Server Stuff --------
"
" Language Server Protocol
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'folke/trouble.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'creativenull/diagnosticls-configs-nvim'

"  cmp framework for auto-completion
Plug 'hrsh7th/nvim-cmp'
" Completion sources
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'

"------- Snippets -------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

"------ typescript and react stuff ---------"
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'Quramy/vim-js-pretty-template' "syntax highlight for template strings
Plug 'jason0x43/vim-js-indent' "JS and TS indentation

"------------- Golang --------------------
"
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" tmux plugins
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'

" tpope plugins
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired' " helpful shorthand like [b ]b
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'

" Themes
"--------

Plug 'projekt0n/github-nvim-theme'

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
"set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx


call plug#end()
"----------------Plugins End -----------------

"------------- Elixir ----------------------
lua << EOF
-- A callback that will get called when a buffer connects to the language server.
-- Here we create any key maps that we want to have on that buffer.
local lspconfig = require("lspconfig")

-- `on_attach` callback will be called after a language server
-- instance has been attached to an open buffer with matching filetype
-- here we're setting key mappings for hover documentation, goto definitions, goto references, etc
-- you may set those key mappings based on your own preference
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true }

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
end

-- setting up the elixir language server
-- you have to manually specify the entrypoint cmd for elixir-ls
require('lspconfig').elixirls.setup {
  cmd = { "/Users/arun/elixir/elixir-ls/release/language_server.sh" },
  on_attach = on_attach,
  settings = {
    elixirLS = {
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = false,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = false
    }
  },
  handlers=handlers

}
EOF


" ------------- NERD Tree File browser-------
"  q to quit an open instance
nnoremap <silent> <Space>. :NERDTreeFocus<CR>
nnoremap <silent> <Space>, :NERDTreeClose<CR>

" Theme & Colors Config
" --------------------------


" set gui colors in vim too
set termguicolors

"Set theme to github dark dimmed"
lua << EOF
require('github-theme').setup({
  theme_style = "dimmed", -- dark/dark_default/dimmed/light/light_default
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"}
})
EOF


"------------ LSP Config ----------------"

" Plug 'onsails/lspkind-nvim' {{{
lua << EOF
require('lspkind').init({})
EOF
" }}}

lua << EOF
vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"🭽", "FloatBorder"},
      {"▔", "FloatBorder"},
      {"🭾", "FloatBorder"},
      {"▕", "FloatBorder"},
      {"🭿", "FloatBorder"},
      {"▁", "FloatBorder"},
      {"🭼", "FloatBorder"},
      {"▏", "FloatBorder"},
}

vim.diagnostic.config({
  virtual_text = false,
  underline = false
})

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
EOF

" neovim/nvim-lspconfig {{{
" npm i -g typescript typescript-language-server
lua << EOF
local util = require "lspconfig/util"
require 'lspconfig'.tsserver.setup{
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
    --[=====[ 
    handlers = {
      ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
        local ignore_codes = { 80001, 7016 };
        if params.diagnostics ~= nil then
          local idx = 1
          while idx <= #params.diagnostics do
            if vim.tbl_contains(ignore_codes, params.diagnostics[idx].code) then
              table.remove(params.diagnostics, idx)
            else
              idx = idx + 1
            end 
          end
        end
        vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
      end,
    },
    --]=====]
}
EOF

lua << EOF
-- npm install -g diagnostic-languageserver eslint_d prettier_d_slim prettier
 local function on_attach(client)
   print('Attached to ' .. client.name)
 end
 local dlsconfig = require 'diagnosticls-configs'
 dlsconfig.init {
   default_config = false,
   format = true,
   on_attach = on_attach,
 }
 local eslint = require 'diagnosticls-configs.linters.eslint'
 local prettier = require 'diagnosticls-configs.formatters.prettier'
 prettier.requiredFiles = {
     '.prettierrc',
     '.prettierrc.json',
     '.prettierrc.toml',
     '.prettierrc.json',
     '.prettierrc.yml',
     '.prettierrc.yaml',
     '.prettierrc.json5',
     '.prettierrc.js',
     '.prettierrc.cjs',
     'prettier.config.js',
     'prettier.config.cjs',
   }
 dlsconfig.setup {
   ['javascript'] = {
     linter = eslint,
     formatter = { prettier }
   },
   ['javascriptreact'] = {
     linter = { eslint },
     formatter = { prettier }
   },
   ['css'] = {
     formatter = prettier
   },
   ['html'] = {
     formatter = prettier
   },
 }
EOF


"-------- From https://github.com/hrsh7th/nvim-cmp ---------------
"


nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gca   <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>fo <cmd>lua vim.lsp.buf.formatting()<CR>

 autocmd BufWritePre *.js lua vim.lsp.buf.formatting()
 autocmd BufWritePre *.ts lua vim.lsp.buf.formatting()
 autocmd BufWritePre *.css lua vim.lsp.buf.formatting()

lua << EOF
require 'trouble'.setup {}
EOF
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}

" 'williamboman/nvim-lsp-installer' {{{
lua << EOF
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
    server:setup(opts)
end)
EOF
" }}}

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
       { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['gopls'].setup {
    capabilities = capabilities
  }
EOF


" VIM Config Stuff 
" ----------------
"
nnoremap <SPACE> <Nop>
let mapleader="\ "



" A word about mappings
" -------------------------------------------------
" map              recursive mapping (All Modes ??)
" noremap          non-recursive mapping (All Mode ??)
" nmap             recursive mapping (Normal Mode)
" nnoremap         non-recursive mapping (Normal Mode)
" vmap             recursive mapping (Visual & select Mode)
" vnoremap         non-recursive mapping (Visual & SelectMode)
" xmap             recursive mapping (Visual Mode)
" xnoremap         non-recursive mapping (Visual Mode)
" imap             recursive mapping (Insert Mode)
" inoremap         non-recursive mapping (Insert Mode)
" ...................................................
"
" and so on. see `:help :map` and `:help :map-modes` for more info
" There's also s, c, o for select, command-line and operator pending mode



" map jk to ESC  
inoremap jk <Esc>
"use escape to un-hightlight, when done.
nnoremap <esc> :noh<return><esc>

set number
set clipboard=unnamed


" source config 
nmap <silent> <leader>sc :source $MYVIMRC<CR>

" edit config 
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>


" toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>

" go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
" https://github.com/neovim/neovim/issues/2048
nnoremap <C-h> :bp<CR>

" close buffer
nnoremap <silent> <leader>bd :bd<CR>

" toggle relativenumber
nnoremap <leader>tn :set invrelativenumber<cr>

" toggle word wrap
nnoremap <leader>tw :set wrap!<cr>

" clear and redraw screen, de-highlight, fix syntax highlighting
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>

" nnoremap gp `[v`] " reselect pasted text

nnoremap <leader>id :r!date -u +"\%Y-\%m-\%dT\%H:\%M:\%SZ"<CR>
" nnoremap id "=strftime("%FT%T%z")<CR>P

nnoremap <leader>cx :!chmod +x %<cr>
" }}}


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsSnippetsDir='/Users/arun/Ultisnips'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/UltiSnips']

" vimwiki setup
let g:vimwiki_list = [{'path': '~/Dropbox/wiki/', 'syntax': 'markdown', 'ext': '.md'}]


" For faster split jumping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" tpope/vim-commentary {{{
nnoremap <leader>/ :Commentary<CR>
vnoremap <leader>/ :Commentary<CR>
"}}}

" setting default tab width
" TLDR use spaces and width of 4

set tabstop=2     " Size of a hard tabstop (ts).
set shiftwidth=2  " Size of an indentation (sw).
set expandtab     " Always uses spaces instead of tab characters (et).
set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
set autoindent    " Copy indent from current line when starting a new line.
set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).

" Don't create backup files. Use Git instead :D
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" Vimwiki stuff
" https://dev.to/konstantin/taking-notes-with-vim-3619
let g:vimwiki_list = [{ 'path': '~/Documents/notes/',
       \ 'syntax':'markdown', 'ext': '.md' }]
autocmd FileType vimwiki set ft=markdown

:set backspace=indent,eol,start
" ack.vim --- {{{
" Reference: https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>\ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> ,, :cclose<CR>

" GO lang configs
" ---------------
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" References  & Credits 
" ----------------------
"
" https://github.com/elijahmanor/dotfiles/blob/master/nvim/.config/nvim/init.vim
