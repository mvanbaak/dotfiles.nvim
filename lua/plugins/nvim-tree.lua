-- ================================================================================================
-- TITLE : nvim-tree/nvim-tree.lua
-- ABOUT : A file explorer written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- ================================================================================================

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "NvimTreeToggle",
    keys = {
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<cr>",
            desc = "Toggle explorer",
        },
    },
    opts = {
        view = {
            width = 40,
            side = "left",
        },
        renderer = {
            group_empty = false,
        },
        git = {
            enable = true,
            ignore = false,
        },
        filters = {
            dotfiles = false,
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
        update_focused_file = {
            enable = true,
        },
    },
}