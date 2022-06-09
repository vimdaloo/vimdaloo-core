--- The `vimdaloo` module.
--
-- @module vimdaloo
-- @see vimdaloo.lang
-- @see vimdaloo.version
-- @see vimdaloo.color

--- Details.
-- Vimdaloo system root.
-- @section Details
--
-- @code
--    -- accept the defaults
--    require('vimdaloo').setup()
--
--    -- …or override the defaults
--    require('vimdaloo').setup({
--        lang = {
--            env = _G,
--            base_path = vim and 'lua' or 'src',
--        },
--    })

--- API.
-- @section API

local M = {
    --- Vimdaloo 0.0.1-1
    -- @display _VERSION
    _VERSION = 'Vimdaloo 0.0.1-1',
    --- Object-Oriented Lua Library for Neovim
    -- @display _DESCRIPTION
    _DESCRIPTION = 'Object-Oriented Lua Library for Neovim',
    --- https://github.com/vimdaloo/vimdaloo-core
    -- @display _URL
    _URL = 'https://github.com/vimdaloo/vimdaloo-core',
    --- Apache License 2.0
    -- @display _LICENSE
    _LICENSE = 'Apache License 2.0',
}

--- Initializes the entire `vimdaloo` system, including all submodules in this order: `lang`, `version`, `color`. You can do this, or individually call each of _just_ the submodules' setups that you care about. However, if you do so, `lang` **always** needs to be called first.
-- @display setup
-- @tparam table config Optional custom user configuration. Submodules' setup functions get called passing _just_ the config's matching sub-config, based on name.
function M.setup(config)
    config = config or {}
    -- initialize each submodule, in a specific order
    for _, submod in pairs {
        'lang',
        'version',
        'color',
    } do
        local submod_config = config[submod] or {}
        require('vimdaloo.' .. submod).setup(submod_config)
    end
    -- require('vimdaloo.version').print()
end

return M
