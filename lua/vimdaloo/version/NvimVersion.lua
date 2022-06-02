local oo = require('vimdaloo')
local SemanticVersion = oo.import('vimdaloo.version.SemanticVersion')

---
-- @class vimdaloo.version.NvimVersion
-- @display …version.NvimVersion
-- @inherits vimdaloo.version.SemanticVersion
local NvimVersion = oo.singleton(SemanticVersion:subclass('vimdaloo.version.NvimVersion'))

--- Description.
-- A semantic version populated from [`Neovim`](https://neovim.io)
-- @section Description
--
-- @code
--    -- SemanticVersion parent class gets populated from:
--    --   io.popen(vim.v.progpath .. ' -v')
--
--    -- NvimVersion class gets further populated from:
--    --   vim.version()
--    --     NVIM v0.7.0
--           {
--             api_compatible = 0,
--             api_level = 9,
--             api_prerelease = false,
--             major = 0,
--             minor = 7,
--             patch = 0
--           }
--    --     NVIM v0.8.0-dev+302-gaf2899aee
--           {
--             api_compatible = 0,
--             api_level = 10,
--             api_prerelease = true,
--             major = 0,
--             minor = 8,
--             patch = 0,
--             prerelease = true
--           }

--- API.
--- @section API

local function _assert_consistent(name, val1, val2)
    assert(val1 == val2, string.format('inconsistent %s version (%s ~= %s)', name, val1, val2))
end

--- singleton
-- @display NvimVersion:instance
-- @treturn vimdaloo.version.NvimVersion
function NvimVersion:initialize()
    assert(vim, 'unable to initialize NvimVersion: "vim" global variable missing')
    -- HACK: shouldn't have to spawn the command to get the full semantic version
    local handle = io.popen(vim.v.progpath .. ' -v')
    local value = handle:read() ---@diagnostic disable-line: need-check-nil
    handle:close() ---@diagnostic disable-line: need-check-nil
    value = value:gsub('NVIM v', '')

    SemanticVersion.initialize(self, value)
    local ver = vim.version()
    _assert_consistent('major', self.major, ver.major)
    _assert_consistent('minor', self.minor, ver.minor)
    _assert_consistent('patch', self.patch, ver.patch)
    self.api_compatible = ver.api_compatible
    self.api_level = ver.api_level
    self.api_prerelease = ver.api_prerelease
    -- use underscore (_), otherwise it clobbers self.prerelease in SemanticVersion
    self._prerelease = ver['prerelease'] ~= nil and ver.prerelease or false
    _assert_consistent('prerelease', self['prerelease'] ~= nil, self._prerelease)
end

--- api compatible accessor
-- @treturn number get api compatible
function NvimVersion:getApiCompatible()
    return self.api_compatible
end

--- api level accessor
-- @treturn number get api level
function NvimVersion:getApiLevel()
    return self.api_level
end

--- api prerelease accessor
-- @treturn boolean true if api prerelease
function NvimVersion:isApiPrerelease()
    return self.api_prerelease
end

--- prerelease accessor
-- @treturn boolean true if prerelease
function NvimVersion:isPrerelease()
    -- use underscore (_), otherwise it references self.prerelease in SemanticVersion
    return self._prerelease
end

return NvimVersion
