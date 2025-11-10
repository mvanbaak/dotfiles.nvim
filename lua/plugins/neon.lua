-- ================================================================================================
-- TITLE : rafamadriz/neon
-- ABOUT : Customizable coloscheme with dark and light options, vivid colors and easy on the eye.
-- LINKS :
--   > github : https://github.com/rafamadriz/neon
-- ================================================================================================

return {
    "rafamadriz/neon",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        vim.g.neon_style = "dark" -- Pick the dark version
        vim.cmd([[colorscheme neon]])
    end,
}
