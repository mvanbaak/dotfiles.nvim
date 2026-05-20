-- ================================================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Treesitter configurations and abstraction layer for Neovim.
-- LINKS :
--   > github : https://github.com/nvim-treesitter/nvim-treesitter
-- NOTE : For Neovim 0.12+, uses the new main branch (rewrite)
-- ================================================================================================

return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "neovim-treesitter/treesitter-parser-registry",
    },
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            },
        })

        local parsers = {
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
        }

        local installed = require("nvim-treesitter.config").installed_parsers()
        local to_install = vim.tbl_filter(function(parser)
            return not vim.tbl_contains(installed, parser)
        end, parsers)

        if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
        end
    end,
}
