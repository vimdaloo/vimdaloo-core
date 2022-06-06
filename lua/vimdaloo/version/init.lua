-- stylua: ignore start
local LuaVersion      = import 'vimdaloo.version.LuaVersion'
local LuaJITVersion   = import 'vimdaloo.version.LuaJITVersion'
local NvimVersion     = import 'vimdaloo.version.NvimVersion'
local VimdalooVersion = import 'vimdaloo.version.VimdalooVersion'
-- stylua: ignore end

--- The `vimdaloo.version` submodule.
--
-- @module vimdaloo.version
-- @see vimdaloo

--- Details.
-- Version convenience functions.
-- @section Details

--- API.
-- @section API

local M = {}

--- Initializes the `version` submodule. By default called automatically by `vimdaloo.setup(config)`.
-- @display setup
-- @tparam table config optional custom user configuration
function M.setup(config) --- @diagnostic disable-line:unused-local
    -- if in vim, add commands
    if vim then
        vim.cmd [[command! VimdalooVersionNotify :lua require('vimdaloo.version').notify()<CR>]]
        vim.cmd [[command! VimdalooVersionPrint :lua require('vimdaloo.version').print()<CR>]]
    end
end

--- returns the singleton LuaVersion object
-- @display lua
-- @treturn vimdaloo.version.LuaVersion
function M.lua()
    return LuaVersion.instance()
end

--- returns the singleton LuaJITVersion object
-- @display luajit
-- @treturn vimdaloo.version.LuaJITVersion
function M.luajit()
    if jit then
        return LuaJITVersion.instance()
    else
        return nil
    end
end

--- returns the singleton NvimVersion object
-- @display nvim
-- @treturn vimdaloo.version.NvimVersion
function M.nvim()
    if vim then
        return NvimVersion.instance()
    else
        return nil
    end
end

--- returns the singleton VimdalooVersion object
-- @display vimdaloo
-- @treturn vimdaloo.version.VimdalooVersion
function M.vimdaloo()
    return VimdalooVersion.instance()
end

--- returns a table of singleton version objects
-- @display versions
-- @treturn table { lua = @{vimdaloo.version.LuaVersion}, luajit = @{vimdaloo.version.LuaJITVersion}, nvim = @{vimdaloo.version.NvimVersion}, vimdaloo = @{vimdaloo.version.VimdalooVersion} }
function M.versions()
    return {
        lua = M.lua(),
        luajit = jit and M.luajit() or nil,
        nvim = vim and M.nvim() or nil,
        vimdaloo = M.vimdaloo(),
    }
end

--- returns a table of version values
-- @display values
-- @treturn table e.g. { lua = "5.1", luajit = "2.1.0-beta3", nvim = "0.7.0", vimdaloo = "0.0.1-1" }
function M.values()
    return {
        lua = M.lua():getValue(),
        luajit = jit and M.luajit():getValue() or nil,
        nvim = vim and M.nvim():getValue() or nil,
        vimdaloo = M.vimdaloo():getValue(),
    }
end

--- returns combined versions string
-- @display string
-- @treturn string e.g. "Lua 5.1, LuaJIT 2.1.0-beta3, NVIM v0.7.0, Vimdaloo 0.0.1-1"
function M.string()
    local s = M.lua():toString()
    if jit then
        s = s .. ', ' .. M.luajit():toString()
    end
    if vim then
        s = s .. ', ' .. M.nvim():toString()
    end
    return s .. ', ' .. M.vimdaloo():toString()
end

--- prints combined versions string
-- @display print
function M.print()
    print(M.string())
end

--- notifies combined versions string via [`vim.notify()`](https://neovim.io/doc/user/lua.html#vim.notify()), or falls back to printing if not within `nvim`
-- @display notify
function M.notify()
    if vim then
        vim.notify(M.string())
    else
        M.print()
    end
end

return M
