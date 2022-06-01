local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.LuaJITVersion
-- @inherits vimdaloo.version.SemanticVersion
local LuaJITVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.LuaJITVersion'))

--- Description.
-- A semantic version populated from [`jit.version`](https://luajit.org/ext_jit.html)
-- @section Description

--- API.
--- @section API

--- constructor
-- @display LuaJITVersion
-- @treturn vimdaloo.version.LuaJITVersion
function LuaJITVersion:initialize()
    SemanticVersion.initialize(self, jit.version:gsub('LuaJIT ', ''))
end

return LuaJITVersion
