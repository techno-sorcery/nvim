-- Basic config

-- vim.opt.termguicolors = true
vim.opt.number = true                   -- Show line number
vim.opt.cul = true                      -- Show cursor line

-- vim.opt.foldmethod = "indent"           -- Fold matching indent levels
vim.opt.lazyredraw = true               -- Wait to redraw screen
vim.cmd [[colorscheme cool]]            -- Set theme to custom

vim.opt.list = true                     -- Show tab and EOL
vim.opt.listchars:append "space:·"      -- Space char
vim.opt.listchars:append "eol:↴"        -- Eol char

vim.opt.smartindent = true              -- Use smart indentation
vim.opt.expandtab = true                -- Spaces instead of tabs
vim.opt.tabstop = 4                     -- Number of tab spaces
vim.opt.shiftwidth = 4                  -- Number of expanded tab spaces

vim.opt.ignorecase = true               -- Non case-sensitive searches
vim.opt.smartcase = true                -- Pattern is case sensitive if uppercase
vim.opt.hlsearch = true                 -- Automatically highlight

vim.opt.showcmd = true                  -- Show last command on status
vim.opt.showmode = true                 -- Show current mode on status

vim.opt.dir = "/home/" .. os.getenv("USER") .. "/.cache/nvim"           -- Set swapfile directory
vim.opt.bdir = "/home/".. os.getenv("USER") .."/.cache/nvim"          -- Set backup file directory

vim.opt.history = 500                   -- Remember 500 last commands
vim.opt.scrolloff = 10                  -- Lines to pad cursor

vim.opt.undofile = true                 -- Save undo history to file
vim.opt.undodir = "/home/".. os.getenv("USER") .."/.cache/nvim"       -- Set undo file directory

vim.opt.formatoptions = "c"
vim.opt.formatoptions = "r"
vim.opt.formatoptions = "o"


-- Keybinds
vim.keymap.set("c", "<cr>", function()
    if vim.fn.pumvisible() == 1 then return '<c-y>' end
    return '<cr>'
end, { expr = true })


-- Matchparen
vim.g['matchparen_timeout'] = 10
vim.g['matchparen_insert_timeout'] = 10


-- Vim airline
vim.g['airline_powerline_fonts'] = 1                -- Use powerline fonts
vim.g['airline_theme'] = "codedark"                 -- Use VSCode dark theme


-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- Config and use lazy
require("lazy").setup({

    -- LSP
    "VonHeikemen/lsp-zero.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",

    -- Autocomplete
    "f3fora/cmp-spell",                     -- Spell suggestion autocomplete source
    "hrsh7th/cmp-buffer",                   -- Buffer autocomplete source
    "hrsh7th/cmp-calc",                     -- Calculator autocomplete source
    "hrsh7th/cmp-nvim-lsp",                 -- LSP autocomplete source
    "hrsh7th/cmp-path",                     -- Filepath autocomplete source
    "hrsh7th/nvim-cmp",
    "onsails/lspkind.nvim",
    "saadparwaiz1/cmp_luasnip",             -- LuaSnip autocomplete source

    -- Snippets
    "L3MON4D3/LuaSnip",                     -- Snippet plugin
    "rafamadriz/friendly-snippets",         -- Snippets for common languages

    -- Git
    "lewis6991/gitsigns.nvim",              -- Git decorations
    "tpope/vim-fugitive",                   -- Git integration

    -- Misc
    "brenoprata10/nvim-highlight-colors",   -- Color previews
    "folke/which-key.nvim",                 -- Pop-up for custom keybinds
    "junegunn/fzf.vim",                     -- Fuzzy finding
    "lukas-reineke/indent-blankline.nvim",  -- Indentation lines
    "nvim-tree/nvim-web-devicons",          -- Icon pack
    "petertriho/nvim-scrollbar",            -- Status scrollbar
    "stevearc/oil.nvim",                    -- File browser in buffer
    "tomasiser/vim-code-dark",              -- VS Code theme
    "tpope/vim-commentary",                 -- Selection commenting
    "tpope/vim-surround",                   -- Change parentheses/quotes/etc
    "vim-airline/vim-airline",              -- Improved status bar
    "windwp/nvim-autopairs",                -- Pair parentheses and brackets

    -- Sessionizer
    {
        "xolox/vim-session",
        dependencies = {
            "xolox/vim-misc",
        }

    },
})


-- Config vim-session
vim.g['session_directory'] = '~/.cache/nvim/sessions'    -- Session directory
vim.g['session_autosave'] = 'no'                         -- Don't autosave sessions
vim.g['session_default_to_last'] = 1
vim.g['session_command_aliases'] = 1


-- Set up gitsigns
require('gitsigns').setup {
    signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '▁' },
        topdelete    = { text = '▔' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '▁' },
        topdelete    = { text = '▔' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 1,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
}

-- Set up which-key
require("which-key").setup();


-- Set up nvim highlight colors
require("nvim-highlight-colors").setup {
    ---Render style
    render = 'virtual',
    virtual_symbol = '⯀',

    ---Set virtual symbol position()
    virtual_symbol_position = 'inline',
    enable_hex = true,
    enable_short_hex = true,
    enable_rgb = true,
    enable_hsl = true,
    enable_var_usage = true,
    enable_named_colors = true,
    enable_tailwind = false,

    ---Set custom colors
    custom_colors = {
        { label = '%-%-theme%-primary%-color', color = '#0f1219' },
        { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
    },

    exclude_filetypes = {},
    exclude_buftypes = {}
}


-- Set up nvim-autopairs
require("nvim-autopairs").setup {}


-- Setup nvim oil
require("oil").setup()


-- Indent lines
require("ibl").setup({
    scope = {
        enabled = false
    }
})


-- Disable new line comments
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')


-- Setup LSP zero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- Error icons
lsp_zero.set_sign_icons({
    error = 'X',
    warn = '!',
    hint = '⚑',
    info = 'i',
})


-- Setup LSP mason package manager
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('luasnip.loaders.from_vscode').lazy_load()


cmp.setup({

    -- LSP sources
    sources = {
        {name = 'nvim_lsp'},
        {name = 'path'},
        {name = 'calc'},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
        {
            name = "spell",
            option = {
                keep_all_entries = false,
                enable_in_context = function()
                    return true
                end,
                preselect_correct_word = true,
            },
        },
    },


    -- Autocomplete keybinds
    mapping = cmp.mapping.preset.insert({

        -- Tab autocomplete
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ['<Enter>'] = cmp.mapping.confirm({select = false}),
    }),

    -- Snippets support
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    -- Completion menu formatting
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)

            -- lsp-kind formatting
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 32 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
        end,
    },
})


-- Autosuggest menu colors
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })


-- Set up scrollbar
require("scrollbar").setup({
    handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = false, -- Requires hlslens
        ale = false, -- Requires ALE
    },
})
