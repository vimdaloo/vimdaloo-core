local import = require('vimdaloo').import

--- The vimdaloo version module.
--
-- @module vimdaloo.version

local M = {}

--- returns singleton
-- @display lua
-- @treturn vimdaloo.version.LuaVersion
M.lua = function()
    return import('vimdaloo.version.LuaVersion'):instance()
end

--- returns singleton
-- @display luajit
-- @treturn vimdaloo.version.LuaJITVersion
M.luajit = function()
    if jit then
        return import('vimdaloo.version.LuaJITVersion'):instance()
    else
        return nil
    end
end

--- returns singleton
-- @display nvim
-- @treturn vimdaloo.version.NvimVersion
M.nvim = function()
    if vim then
        return import('vimdaloo.version.NvimVersion'):instance()
    else
        return nil
    end
end

--- returns singleton
-- @display vimdaloo
-- @treturn vimdaloo.version.VimdalooVersion
M.vimdaloo = function()
    return import('vimdaloo.version.VimdalooVersion'):instance()
end

--- returns singletons
-- @display versions
-- @treturn vimdaloo.version.LuaVersion lua
-- @treturn vimdaloo.version.LuaJITVersion lujit
-- @treturn vimdaloo.version.NvimVersion nvim
-- @treturn vimdaloo.version.VimdalooVersion vimdaloo
M.versions = function()
    return {
        lua = M.lua(),
        luajit = M.luajit(),
        nvim = M.nvim(),
        vimdaloo = M.vimdaloo(),
    }
end

--- returns values
-- @display values
-- @treturn string lua
-- @treturn string lujit
-- @treturn string nvim
-- @treturn string vimdaloo
M.values = function()
    local v = M.versions()
    return {
        lua = v.lua:getValue(),
        luajit = jit and v.luajit:getValue() or nil,
        nvim = vim and v.nvim:getValue() or nil,
        vimdaloo = v.vimdaloo:getValue(),
    }
end

--- returns values string
-- @display string
-- @treturn string versions
M.string = function()
    local v = M.values()
    local s = 'Vimdaloo ' .. v.vimdaloo .. ' | Lua ' .. v.lua
    if jit then
        s = s .. ' | LuaJIT ' .. v.luajit
    end
    if vim then
        s = s .. ' | NVIM v' .. v.nvim
    end
    return s
end

--- prints values string
-- @display print
M.print = function()
    print(M.string())
end

--- notifies values string (or prints if not in nvim)
-- @display notify
M.notify = function()
    if vim then
        vim.notify(M.string())
    else
        M.print()
    end
end

return M
