local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup({
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        'markdown',
        'markdown_inline',
        'tsx',
        'typescript',
        'fish',
        'php',
        'json',
        'yaml',
        'css',
        'html',
        'lua',
        'python',
        'svelte'
    },
    autotag = {
        enable = true,
    },
    context_commentstring = { -- used to automatically set the comment string of the language used
        enable = true,
        enable_autocmd = false,
    }
})

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = {'javascript', 'typescript.tsx'}
