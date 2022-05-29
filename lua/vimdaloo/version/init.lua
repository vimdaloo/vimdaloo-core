local import = require('vimdaloo').import

--- The vimdaloo version module.
--
-- @module vimdaloo.version

local M = {}

---
-- @display lua
-- @treturn vimdaloo.version.LuaVersion the LuaVersion singelton
M.lua = function()
    return import('vimdaloo.version.LuaVersion'):instance()
end

---
-- @display luajit
-- @treturn vimdaloo.version.LuaJITVersion the LuaJITVersion singelton
M.luajit = function()
    return import('vimdaloo.version.LuaJITVersion'):instance()
end

---
-- @display nvim
-- @treturn vimdaloo.version.NvimVersion the NvimVersion singelton
M.nvim = function()
    return import('vimdaloo.version.NvimVersion'):instance()
end

---
-- @display vimdaloo
-- @treturn vimdaloo.version.VimdalooVersion the VimdalooVersion singelton
M.vimdaloo = function()
    return import('vimdaloo.version.VimdalooVersion'):instance()
end

return M
