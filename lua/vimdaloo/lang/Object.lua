local class = require('vimdaloo').class

---
-- &nbsp;<br/>
-- **Class**
--
-- &nbsp; &nbsp; <code style="padding: 0.2em; font-family: 'Consolas', 'Deja Vu Sans Mono', 'Bitstream Vera Sans Mono', monospace; font-size: 0.95em; letter-spacing: 0.01em; background-color: #fbedc3;">vimdaloo.lang.Object</code>
--
-- @class vimdaloo.lang.Object
-- @display …lang.Object
--
-- &nbsp;<br/>
-- **Subclasses**
--
-- @{vimdaloo.version.Version|Version}
local Object = class('vimdaloo.lang.Object')

--- Description.
-- Base class for all objects.
-- @section Description

--- API
--- @section API

Object.static._instanceCounters = {}

--- constructor
-- @display Object
-- @treturn vimdaloo.lang.Object
function Object:initialize()
    local tab = Object.static._instanceCounters
    local key = self.class.name
    if tab[key] == nil then
        tab[key] = 0
    end
    self._instanceNumber = tab[key] + 1
    tab[key] = self._instanceNumber
end

function Object:getClass()
    return self.class
end

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

--- string formatter
-- @treturn string
function Object:toString()
    local str = ''
    for key, val in pairsByKeys(self) do
        if key ~= 'class' and string.sub(key, 1, 1) ~= '_' then
            if string.len(str) ~= 0 then
                str = str .. ','
            end
            str = string.format('%s%s=%s', str, key, val)
        end
    end
    if string.len(str) == 0 then
        return string.format('%s@%s', self.class.name, self._instanceNumber)
    else
        return string.format('%s@%s(%s)', self.class.name, self._instanceNumber, str)
    end
end

function Object:__tostring()
    return self:toString()
end

return Object
