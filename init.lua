-- ================================================================================================
-- TITLE : NeoVim Configuration
-- ABOUT : Entrypoint of neovim configuration in lua
-- ================================================================================================

-- We use lazy.vim, and their documentation
-- suggest to require config.lazy and require/setup
-- the rest of the config from there.
require("config.lazy")