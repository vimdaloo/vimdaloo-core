local Version = import 'vimdaloo.version.Version'

local semver = require 'semver'

namespace 'vimdaloo.version' {
    ---
    -- @class vimdaloo.version.SemanticVersion
    -- @display …version.SemanticVersion
    -- @inherits vimdaloo.version.Version
    --
    -- **Subclasses**
    --
    -- @{vimdaloo.version.LuaJITVersion|LuaJITVersion},
    -- @{vimdaloo.version.LuaVersion|LuaVersion},
    -- @{vimdaloo.version.NvimVersion|NvimVersion},
    -- @{vimdaloo.version.VimdalooVersion|VimdalooVersion}
    class 'SemanticVersion',
    extends 'vimdaloo.version.Version' {

        --- Description.
        -- A version able to parse and adhere to the **Semantic Versioning Specification** ([SemVer](https://semver.org))
        -- @section Description

        --- API.
        --- @section API

        --- constructor
        -- @display SemanticVersion
        -- @tparam string prefix the prefix
        -- @tparam string value the value
        -- @treturn vimdaloo.version.SemanticVersion
        new = function(self, prefix, value)
            Version.new(self, prefix, value)
            local sv = semver(value)
            self.major = sv.major
            self.minor = sv.minor
            self.patch = sv.patch
            self.prerelease = sv.prerelease
            self.build = sv.build
        end,

        --- major getter
        -- @display getMajor
        -- @treturn string major the major section
        getMajor = function(self)
            return self.major
        end,

        --- minor getter
        -- @display getMinor
        -- @treturn string minor the minor section
        getMinor = function(self)
            return self.minor
        end,

        --- patch getter
        -- @display getPatch
        -- @treturn string patch the patch section
        getPatch = function(self)
            return self.patch
        end,

        --- prerelease getter
        -- @display getPrerelease
        -- @treturn string prerelease the prerelease section
        getPrerelease = function(self)
            return self.prerelease
        end,

        --- build getter
        -- @display getBuild
        -- @treturn string build the build section
        getBuild = function(self)
            return self.build
        end,
    },
}
