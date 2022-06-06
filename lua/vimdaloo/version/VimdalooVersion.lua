local SemanticVersion = import 'vimdaloo.version.SemanticVersion'

local oo = require 'vimdaloo'

namespace 'vimdaloo.version' {
    ---
    -- @class vimdaloo.version.VimdalooVersion
    -- @display …version.VimdalooVersion
    -- @inherits vimdaloo.version.SemanticVersion
    class 'VimdalooVersion',
    extends 'vimdaloo.version.SemanticVersion' {

        --- Description.
        -- The [Vimdaloo](https://vimdaloo.io/) semantic version singleton, populated from `vimdaloo._VERSION`
        -- @section Description

        --- API.
        --- @section API

        --- singleton
        -- @display instance
        -- @treturn vimdaloo.version.VimdalooVersion
        singleton = function(self)
            local prefix = 'Vimdaloo '
            SemanticVersion.new(self, prefix, oo._VERSION:gsub(prefix, ''))
        end,
    },
}
