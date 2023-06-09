local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
end

local file_browser_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup({
    defaults = {
        mappings = {
            n = {
                ['q'] = actions.close
            },
        },
        file_ignore_patterns = {
            'node_modules',
            '.git/',
            '__pycache__',
            '.pytest_cache',
            '.venv'
        }
    },
    extensions = {
        file_browser = {
            theme = 'dropdown',
            -- disables netrw (vim builtin file browser)
            hijack_netrw = true,
            mappings = {
                -- normal mode settings
                ['n'] = {
                    ['N'] = file_browser_actions.create,
                    ['h'] = file_browser_actions.goto_parent_dir,
                    ['d'] = file_browser_actions.remove,
                    ['r'] = file_browser_actions.rename,
                }
            },
        },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
        },
    }
})

telescope.load_extension('file_browser')
telescope.load_extension('fzf')

vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
end)
vim.keymap.set('n', '\\\\', function() builtin.buffers() end)
vim.keymap.set('n', ';t', function() builtin.help_tags() end)
vim.keymap.set('n', ';;', function() builtin.resume() end)
vim.keymap.set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
