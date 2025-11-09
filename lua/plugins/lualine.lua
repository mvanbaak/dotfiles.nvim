-- ================================================================================================
-- TITLE : nvim-lualine/lualine.nvim
-- ABOUT : A blazing fast and easy to configure Neovim statusline written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- ================================================================================================

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            theme = "tokyonight",
        },
        tabline = {
            lualine_a = {
                {
                    "buffers",
                    mode = 4,
                }
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {"lsp_status"}
        },
    }
}
