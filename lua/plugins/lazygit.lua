-- ================================================================================================
-- TITLE : lazygit
-- ABOUT : Plugin for calling lazygit from within neovim.
-- LINKS :
--   > github : https://github.com/kdheepak/lazygit.nvim
-- ================================================================================================

return {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>tg", "<cmd>LazyGit<cr>", desc = "Toggle LazyGit" }
    }
}
