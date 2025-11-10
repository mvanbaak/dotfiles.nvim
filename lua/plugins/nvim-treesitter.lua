-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- ================================================================================================

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names that MUST always be installed
            ensure_installed = {
                "bash",
                "c",
                "dockerfile",
                "javascript",
                "lua",
                "markdown_inline",
                "markdown",
                "python",
                "query",
                "terraform",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            sync_install = false, -- Install parsers synchronously
            auto_install = true, -- Automatically install missing parsers when entering buffer
            -- modules
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enbale = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
            indent = {
                enable = true,
            },
            -- end of modules

        })
    end,
}
