--- The `vimdaloo` module.
--
-- @module vimdaloo

local M = {
    _VERSION = 'Vimdaloo 0.0.1-1',
    _DESCRIPTION = 'Object-Oriented Lua Library for Neovim',
    _URL = 'https://github.com/vimdaloo/vimdaloo-core',
    _LICENSE = 'Apache License 2.0',
}

--- Details.
-- Core Vimdaloo system.
-- @section Details
--
-- @code
--    -- accept the defaults
--    require('vimdaloo').setup()
--
--    -- …or override the defaults
--    require('vimdaloo').setup({
--        env = _G,
--        base_path = vim and 'lua' or 'src',
--    })

--- API.
--- @section API

--- Initializes the entire `vimdaloo` system, including all submodules.
-- @display setup
-- @tparam table config optional custom user configuration
function M.setup(config)
    -- initialize each submodule
    for _, sm in pairs {
        'lang',
        'version',
    } do
        require('vimdaloo.' .. sm).setup(config)
    end
end

return M
