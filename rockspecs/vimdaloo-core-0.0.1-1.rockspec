---@diagnostic disable: lowercase-global
rockspec_format = '3.0'
package = 'vimdaloo-core'
version = '0.0.1-1'
description = {
    summary = 'Object-Oriented Lua Library for Neovim',
    detailed = 'Object-Oriented Lua Library for Neovim',
    license = 'Apache License 2.0',
    homepage = 'https://vimdaloo.io',
    issues_url = 'https://github.com/vimdaloo/vimdaloo-core/issues',
    maintainer = 'David Ward <dward@redhat.com>',
    labels = {
        'object',
        'oo',
        'oop',
        'vimdaloo',
    },
}
dependencies = {
    'lua >= 5.1, < 5.5',
    'middleclass = 4.1.1-0',
    'middleclass-mixin-singleton = 0.01-1',
    'lua-semver = 1.2.2-1',
}
-- test_dependencies = {
--     'luaunit = 3.4-1',
-- }
source = {
    url = 'git+https://github.com/vimdaloo/vimdaloo-core',
    branch = 'main',
}
build = {
    type = 'builtin',
    modules = {
        ['vimdaloo'] = 'lua/vimdaloo/init.lua',
        ['vimdaloo.lang.Object'] = 'lua/vimdaloo/lang/Object.lua',
        ['vimdaloo.version'] = 'lua/vimdaloo/version/init.lua',
        ['vimdaloo.version.LuaVersion'] = 'lua/vimdaloo/version/LuaVersion.lua',
        ['vimdaloo.version.NvimVersion'] = 'lua/vimdaloo/version/NvimVersion.lua',
        ['vimdaloo.version.SemanticVersion'] = 'lua/vimdaloo/version/SemanticVersion.lua',
        ['vimdaloo.version.Version'] = 'lua/vimdaloo/version/Version.lua',
        ['vimdaloo.version.VimdalooVersion'] = 'lua/vimdaloo/version/VimdalooVersion.lua',
        -- ['vimdaloo.nvim.api'] = 'lua/vimdaloo/nvim/api/init.lua',
        -- ['vimdaloo.nvim.diff'] = 'lua/vimdaloo/nvim/diff/init.lua',
        -- ['vimdaloo.nvim.filetype'] = 'lua/vimdaloo/nvim/filetype/init.lua',
        -- ['vimdaloo.nvim.highlight'] = 'lua/vimdaloo/nvim/highlight/init.lua',
        -- ['vimdaloo.nvim.keymap'] = 'lua/vimdaloo/nvim/keymap/init.lua',
        -- ['vimdaloo.nvim.log'] = 'lua/vimdaloo/nvim/log/init.lua',
        -- ['vimdaloo.nvim.loop'] = 'lua/vimdaloo/nvim/loop/init.lua',
        -- ['vimdaloo.nvim.mpack'] = 'lua/vimdaloo/nvim/mpack/init.lua',
        -- ['vimdaloo.nvim.regex'] = 'lua/vimdaloo/nvim/regex/init.lua',
        -- ['vimdaloo.nvim.script.Call'] = 'lua/vimdaloo/nvim/script/Call.lua',
        -- ['vimdaloo.nvim.script.Function'] = 'lua/vimdaloo/nvim/script/Function.lua',
        -- ['vimdaloo.nvim.script.Option'] = 'lua/vimdaloo/nvim/script/Option.lua',
        -- ['vimdaloo.nvim.script.Variable'] = 'lua/vimdaloo/nvim/script/Variable.lua',
        -- ['vimdaloo.nvim.spell'] = 'lua/vimdaloo/nvim/spell/init.lua',
        -- ['vimdaloo.nvim.types'] = 'lua/vimdaloo/nvim/types/init.lua',
        -- ['vimdaloo.nvim.ui'] = 'lua/vimdaloo/nvim/ui/init.lua',
        -- ['vimdaloo.nvim.uri'] = 'lua/vimdaloo/nvim/uri/init.lua',
    },
}
