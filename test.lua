if not vim then
    require('vimdaloo').setup()
end

local function test_version()
    require('vimdaloo.version').print()
    print ' '
end
test_version()

local function test_color()
    local mod = require 'vimdaloo.color'
    local color = mod.web.green
    print(color:toString())
    print ' '
    -- local rgb = color:rgb()
    -- print(string.format('hex(%s), rgb(%s, %s, %s)', color:hex(), rgb.r, rgb.g, rgb.b))
    -- print ' '
end
test_color()
