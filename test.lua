#!/usr/bin/env lua

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
    local Color = import 'vimdaloo.color.Color'
    local colors = {
        -- mod.xorg.green,
        mod.x11.green,
        mod.web.green,
        Color('rgb 0 255 0'),
    }
    for _, color in pairs(colors) do
        local str = color:toString()
        local hex = color:hex()
        local rgb = color:rgb()
        print(string.format('%s -> hex(%s), rgb(%s, %s, %s)', str, hex.rrggbb, rgb.r, rgb.g, rgb.b))
        print ' '
    end
end
test_color()
