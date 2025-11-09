-- ================================================================================================
-- TITLE : folke/tokyonight.nvim
-- ABOUT : A clean, dark Neovim theme
-- LINKS :
--   > github : https://github.com/folke/tokyonight.nvim
-- ================================================================================================

return {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        require("tokyonight").setup({style = "night"})
        vim.cmd([[colorscheme tokyonight]])
    end,
}
