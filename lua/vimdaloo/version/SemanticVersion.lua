local import = require('vimdaloo').import
local Version = import('vimdaloo.version.Version')

---
-- @class vimdaloo.version.SemanticVersion
-- @inherits vimdaloo.version.Version
--
-- **Subclasses**
--
-- @{vimdaloo.version.LuaJITVersion|LuaJITVersion},
-- @{vimdaloo.version.LuaVersion|LuaVersion},
-- @{vimdaloo.version.NvimVersion|NvimVersion},
-- @{vimdaloo.version.VimdalooVersion|VimdalooVersion}
local SemanticVersion = Version:subclass('vimdaloo.version.SemanticVersion')

local semver = require('semver')

--- Description.
-- A version adhering to the [Semantic Versioning](https://semver.org) format.
-- @section Description

--- API.
--- @section API

--- constructor
-- @display SemanticVersion
-- @tparam string value
-- @treturn vimdaloo.version.SemanticVersion
function SemanticVersion:initialize(value)
    Version.initialize(self, value)
    local sv = semver(value)
    self.major = sv.major
    self.minor = sv.minor
    self.patch = sv.patch
    self.prerelease = sv.prerelease
    self.build = sv.build
end

--- major accessor
-- @treturn number major
function SemanticVersion:getMajor()
    return self.major
end

--- minor accessor
-- @treturn number minor
function SemanticVersion:getMinor()
    return self.minor
end

--- patch accessor
-- @treturn number patch
function SemanticVersion:getPatch()
    return self.patch
end

--- prerelease accessor
-- @treturn string prerelease
function SemanticVersion:getPrerelease()
    return self.prerelease
end

--- build accessor
-- @treturn string build
function SemanticVersion:getBuild()
    return self.build
end

return SemanticVersion
