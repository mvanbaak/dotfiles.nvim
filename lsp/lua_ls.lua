-- ================================================================================================
-- TITLE : lua_ls
-- ABOUT : aka lua-language-server
-- LINKS :
--   > github : https://github.com/LuaLS/lua-language-server
-- ================================================================================================

return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
                },
            },
        },
    },
}
