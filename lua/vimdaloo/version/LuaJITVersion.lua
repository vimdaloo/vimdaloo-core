local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.LuaJITVersion
-- @display …version.LuaJITVersion
-- @inherits vimdaloo.version.SemanticVersion
local LuaJITVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.LuaJITVersion'))

--- Description.
-- A semantic version populated from [`jit.version`](https://luajit.org/ext_jit.html)
-- @section Description

--- API.
--- @section API

--- singleton
-- @display LuaJITVersion:instance
-- @treturn vimdaloo.version.LuaJITVersion
function LuaJITVersion:initialize()
    assert(jit, 'unable to initialize LuaJITVersion: "jit" global variable missing')
    local prefix = 'LuaJIT '
    SemanticVersion.initialize(self, prefix, jit.version:gsub(prefix, ''))
end

return LuaJITVersion
