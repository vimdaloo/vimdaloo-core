-- https://www.lua.org/pil/19.3.html
local function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0 -- iterator variable
    local iter = function() -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

local function flatten(str, tbl)
    str = str or ''
    for key, val in pairsByKeys(tbl) do
        if string.len(str) ~= 0 then
            str = str .. ','
        end
        if type(key) == 'number' then
            if type(val) == 'table' then
                str = str .. flatten(nil, val)
            else
                str = str .. val
            end
        elseif string.sub(key, 1, 1) ~= '_' then
            if type(val) == 'table' then
                val = string.format('{%s}', flatten(nil, val))
            end
            str = string.format('%s%s=%s', str, key, val)
        end
    end
    return str
end

namespace 'vimdaloo.lang' {
    ----
    --- &nbsp;<br/>
    --- **Class Root**
    ---
    --- &nbsp; &nbsp; <code style="padding: 0.2em; font-family: 'Consolas', 'Deja Vu Sans Mono', 'Bitstream Vera Sans Mono', monospace; font-size: 0.95em; letter-spacing: 0.01em; background-color: #ceffce;">vimdaloo.lang.Object</code>
    ---
    -- @class vimdaloo.lang.Object
    -- @display …lang.Object
    --
    -- &nbsp;<br/>
    -- **Subclasses**
    --
    -- @{vimdaloo.lang.Class|Class},
    -- @{vimdaloo.version.Version|Version},
    -- @{vimdaloo.color.Color|Color}
    class 'Object' {

        --- Details.
        -- Base class for all objects
        -- @section Details

        --- API.
        --- @section API

        --- constructor
        -- @display Object
        -- @treturn vimdaloo.lang.Object
        new = function(self) --- @diagnostic disable-line:unused-local
        end,

        --- class getter
        -- @display getClass
        -- @treturn string the class
        getClass = function(self)
            -- if self.class == nil then
            if not self.class then
                -- import and instanciate lazily, otherwise we get
                -- a cross-dependency loop between Class and Object
                import 'vimdaloo.lang.Class'
                -- self.class = vimdaloo.lang.Class(self.__getclass(self):getName())
                self.class = vimdaloo.lang.Class(self:__getclass():getName())
            end
            return self.class
        end,

        --- string representation
        -- @display toString
        -- @tparam string props extra properties to include by subclasses
        -- @treturn string the string representation
        toString = function(self, props)
            local str = flatten(nil, self)
            str = flatten(str, props)
            local classname = self.__getclass(self):getName()
            if string.len(str) == 0 then
                return string.format('%s', classname)
            else
                return string.format('%s(%s)', classname, str)
            end
        end,

        __tostring = function(self, props)
            return self:toString(props)
        end,
    },
}
