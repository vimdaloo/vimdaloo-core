local Object = import 'vimdaloo.lang.Object'

namespace 'vimdaloo.lang' {
    ---
    -- @class vimdaloo.lang.Class
    -- @display …lang.Class
    -- @inherits vimdaloo.lang.Object
    class 'Class',
    extends 'vimdaloo.lang.Object' {

        --- Description.
        -- An object class representation.
        -- @section Description

        --- API.
        --- @section API

        --- constructor
        -- @display Class
        -- @tparam string name the name of the class
        -- @treturn vimdaloo.lang.Class
        new = function(self, name)
            Object.new(self)
            self.name = name
        end,

        --- name getter
        -- @display getName
        -- @treturn string the name of the class
        getName = function(self)
            return self.name
        end,

        --- just class + classname; overrides `vimdaloo.lang.Object:toString()`
        -- @display toString
        -- @treturn string the string form
        toString = function(self)
            return 'class ' .. self.name
        end,
    },
}
