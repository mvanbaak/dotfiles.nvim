-- ================================================================================================
-- TITLE : render-markdown.nvim
-- ABOUT : Improve viewing Markdown files in Neovim.
-- LINKS :
--   > github : https://github.com/MeanderingProgrammer/render-markdown.nvim
--   > wiki   : https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki
-- ================================================================================================

return {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = {
        "markdown",
        "quarto",
        "gitcommit",
    },
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        completions = {
            lsp = {
                enabled = true,
            },
        },
    },
}
