-- ================================================================================================
-- TITLE : bluz71/vim-moonfly-colors
-- ABOUT : A dark charcoal theme for modern Neovim & classic Vim
-- LINKS :
--   > github : https://github.com/bluz71/vim-moonfly-colors
-- ================================================================================================
return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.moonflyCursorColor = false
        vim.g.moonflyNormalPmenu = true
        vim.g.moonflyNormalFloat = true
        vim.o.winborder = "rounded"
        vim.cmd([[colorscheme moonfly]])
    end,
}
