import 'vimdaloo.lang.Object'

namespace 'vimdaloo.version' {
    ---
    -- @class vimdaloo.version.Version
    -- @display …version.Version
    -- @inherits vimdaloo.lang.Object
    --
    -- **Subclasses**
    --
    -- @{vimdaloo.version.SemanticVersion|SemanticVersion}
    class 'Version',
    extends 'vimdaloo.lang.Object' {

        --- Description.
        -- A simple version prefix/value holder.
        -- @section Description

        --- API.
        --- @section API

        --- constructor
        -- @display Version
        -- @tparam string prefix the prefix
        -- @tparam string value the value
        -- @treturn vimdaloo.version.Version
        new = function(self, prefix, value)
            vimdaloo.lang.Object.new(self)
            self.prefix = prefix
            self.value = value
        end,

        --- prefix getter
        -- @display getPrefix
        -- @treturn string prefix the prefix
        getPrefix = function(self)
            return self.prefix
        end,

        --- value getter
        -- @display getValue
        -- @treturn string value the value
        getValue = function(self)
            return self.value
        end,

        --- full version string (prefix + value); overrides `vimdaloo.lang.Object:toString()`
        -- @display toString
        -- @treturn string the string form
        toString = function(self)
            return self:getPrefix() .. self:getValue()
        end,
    },
}
