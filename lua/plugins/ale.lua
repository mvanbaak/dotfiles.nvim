-- ================================================================================================
-- TITLE : ale
-- ABOUT : Check syntax in Vim/Neovim asynchronously and fix files.
-- LINKS :
--   > github : https://github.com/dense-analysis/ale
-- ================================================================================================

local js_fixers = { "eslint", "prettier" }

return {
    'dense-analysis/ale',
    config = function()
        local g = vim.g
        g.ale_linters = {
            ruby = {
                'rubocop',
                'ruby',
            },
            lua = {'lua_language_server'},
            python = {
                'bandit',
                'flake8',
                'pycodestyle',
                'pylint',
                'pyright',
                'ruff',
                'unimport',
                'vulture',
            },
        }
        g.ale_fixers = {
            ["*"] = {
                "remove_trailing_lines",
                "trim_whitespace",
            },
            python = {
                "pycln",
                "reorder-python-imports",
                "ruff_format",
            },
            -- javascript = js_fixers,
            -- typescript = js_fixers,
            -- javascriptreact = js_fixers,
            -- typescriptreact = js_fixers,
        }
        -- fix on save
        g.ale_fix_on_save = 0
        -- disable lsp stuff
        g.ale_disable_lsp = 1
        -- Report using neovim diagnostics
        g.ale_use_neovim_diagnostics_api = 1
        -- All python plugin should auto detect / use uv
        g.ale_python_pyright_change_directory = 1
        g.ale_python_ruff_change_directory = 1
        g.ale_python_ruff_format_change_directory = 1
        g.ale_python_pyright_auto_uv = 1
        g.ale_python_auto_uv = 1
        g.ale_python_ruff_auto_uv = 1
        g.ale_python_ruff_format_auto_uv = 1
        -- configure some python tools
        -- slower, but gets rid of a lot of warnings/errors
        g.ale_python_mypy_options="--check-untyped-defs"
        -- prefer 88 characters instead of 79
        g.ale_python_flake8_options = '--max-line-length=88'

    end,
}
