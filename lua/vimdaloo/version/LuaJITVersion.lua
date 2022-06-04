import 'vimdaloo.version.SemanticVersion'

namespace 'vimdaloo.version' {
    ---
    -- @class vimdaloo.version.LuaJITVersion
    -- @display …version.LuaJITVersion
    -- @inherits vimdaloo.version.SemanticVersion
    class 'LuaJITVersion',
    extends 'vimdaloo.version.SemanticVersion' {

        --- Description.
        -- A semantic version populated from [`jit.version`](https://luajit.org/ext_jit.html)
        -- @section Description

        --- API.
        --- @section API

        --- constructor
        -- @display LuaJITVersion
        -- @treturn vimdaloo.version.LuaJITVersion
        new = function(self)
            assert(jit, 'unable to initialize LuaJITVersion: "jit" global variable missing')
            local prefix = 'LuaJIT '
            vimdaloo.version.SemanticVersion.new(self, prefix, jit.version:gsub(prefix, ''))
        end,
    },
}
