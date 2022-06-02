local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.LuaVersion
-- @display …version.LuaVersion
-- @inherits vimdaloo.version.SemanticVersion
local LuaVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.LuaVersion'))

--- Description.
-- A semantic version populated from [`_VERSION`](https://www.lua.org/manual/5.4/manual.html#pdf-_VERSION)
-- @section Description

--- API.
--- @section API

--- singleton
-- @display LuaVersion:instance
-- @treturn vimdaloo.version.LuaVersion
function LuaVersion:initialize()
    assert(_VERSION, 'unable to initialize LuaVersion: "_VERSION" global variable missing')
    SemanticVersion.initialize(self, _VERSION:gsub('Lua ', ''))
end

return LuaVersion
