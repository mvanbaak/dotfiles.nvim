-- ================================================================================================
-- TITLE : which-key
-- ABOUT : WhichKey helps you remember your Neovim keymaps, by showing keybindings as you type.
-- LINKS :
--   > github : https://github.com/folke/which-key.nvim
-- ================================================================================================

return {
    "folke/which-key.nvim",
    dependencies = {
        "nvim-mini/mini.icons",
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>f", group = "FZF [F]ind" },
            { "<leader>l", group = "[L]azy*" },
            { "<leader>n", group = "[N]ext" },
            { "<leader>p", group = "[P]rev" },
            { "<leader>s", group = "[S]plit" },
            { "<leader>t", group = "[T]oggle" },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
