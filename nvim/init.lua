local vim = vim
local map = vim.keymap.set
local set = vim.opt
local Plug = vim.fn['plug#']

set.ignorecase = true
set.smartcase = true
set.hlsearch = true
set.incsearch = true
set.swapfile = false

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.colorcolumn = "88" --8

set.expandtab = true

set.smarttab = true
set.autoindent = true
set.smartindent = true

set.number = true
set.relativenumber = true

vim.g.airline_powerline_fonts = 1
vim.call('plug#begin')

Plug('ryanoasis/vim-devicons')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug('nvim-treesitter/nvim-treesitter')
Plug('powerline/powerline')
Plug('preservim/nerdcommenter')
Plug('scrooloose/nerdtree')
Plug('folke/todo-comments.nvim')
Plug('ap/vim-css-color')
Plug('tpope/vim-commentary')
Plug('folke/which-key.nvim')
Plug('lewis6991/gitsigns.nvim')
Plug('xiyaowong/transparent.nvim')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('VonHeikemen/lsp-zero.nvim')
Plug('NoahTheDuke/vim-just')

Plug('projekt0n/caret.nvim')
Plug('olivercederborg/poimandres.nvim')
Plug('cocopon/iceberg.vim')

vim.call('plug#end')

vim.o.background = 'dark'
vim.cmd('colorscheme caret')
vim.g.airline_theme = 'base16_shell'

map('', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
map('n', 'zs', ':q!<CR>')
map('n', 'zo', ':wq!<CR>')

map('i', '<C-B>', 'BUG: ')
map('i', '<C-T>', 'TODO: ')
map('i', '<C-W>', 'WARN: ')
map('i', '<C-P>', 'PASSED: ')


-- BUG: V----- лох
require("todo-comments").setup({
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
        FIX  = {
            icon = "",
            color = "error",
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
        },
        TODO = { icon = "", color = "info" },
        HACK = { icon = "", color = "warning" },
        WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "", color = "hint", alt = { "INFO" } },
        TEST = {
            icon = "",
            color = "test",
            alt = { "TESTING", "PASSED", "FAILED" }
        },
    },
    gui_style = {
        fg = "NONE",
        bg = "BOLD",
    },
    merge_keywords = true,
    highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "", -- "fg" or "bg" or empty
        keyword = "wide",
        after = "fg",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400, -- ignore lines longer than this
        exclude = {},       -- list of file types to exclude highlighting
    },
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
        warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
        info = { "DiagnosticInfo", "#2563EB" },
        hint = { "DiagnosticHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
        test = { "Identifier", "#FF00FF" }
    },
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    },
})

require('gitsigns').setup {
    signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable          = true,
    signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir                 = {
        follow_files = true
    },
    auto_attach                  = true,
    attach_to_untracked          = false,
    current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority                = 6,
    update_debounce              = 100,
    status_formatter             = nil,   -- Use default
    max_file_length              = 40000, -- Disable if file is longer than this (in lines)
    preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}

require("lsp")
