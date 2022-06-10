#!/usr/bin/env lua

local prettystr = require('luaunit').prettystr
local lua_color = require 'lua-color'
-- local xterm = require 'xterm'

local function build()
    local file = '/usr/share/X11/rgb.txt'
    local colors = {}

    for line in io.lines(file) do
        local words = {}
        for word in line:gmatch '%w+' do
            table.insert(words, word)
        end
        local rgb = { r = words[1], g = words[2], b = words[3] }

        local key = string.format('rgb %s %s %s', words[1], words[2], words[3])

        local name = ''
        -- TODO: local Name = nil
        for i, word in ipairs(words) do
            if i > 3 then
                name = name .. word
                if i < #words then
                    name = name .. ' '
                end
            end
        end
        -- TODO: if no spaces, upper-case first letter of name to Name, and *add* it to the names list in addition to lowercase name
        -- TODO: once we have the upper-case version, we can compare that to a list built from https://www.ditig.com/256-colors-cheat-sheet to figure out the best xterm number

        if colors[key] == nil then
            local color = lua_color(key)
            local hex = color:tostring '#rrggbb'
            local numbers = {}

            -- for n, h in pairs(xterm) do
            --     if h == hex then
            --         table.insert(numbers, n)
            --     end
            -- end

            -- local handle = io.popen('fromhex "' .. hex .. '"')
            -- local n = tonumber(handle:read()) ---@diagnostic disable-line: need-check-nil
            -- handle:close() ---@diagnostic disable-line: need-check-nil
            -- table.insert(numbers, n)

            colors[key] = { rgb = rgb, hex = hex, numbers = numbers, names = { name } }
        else
            table.insert(colors[key].names, name)
        end
    end

    return colors
end

print(prettystr(build()))
