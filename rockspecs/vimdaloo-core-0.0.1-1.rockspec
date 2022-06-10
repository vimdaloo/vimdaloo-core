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
        'neovim',
        'nvim',
        'object',
        'oo',
        'oop',
        'plugin',
        'vimdaloo',
    },
}
dependencies = {
    'lua >= 5.1, < 5.5',
    'lua-semver = 1.2.2-1',
    'lua-color = 1.2-1',
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
        ['vimdaloo.lang'] = 'lua/vimdaloo/lang/init.lua',
        ['vimdaloo.lang.Object'] = 'lua/vimdaloo/lang/Object.lua',
        ['vimdaloo.lang.Class'] = 'lua/vimdaloo/lang/Class.lua',
        ['vimdaloo.version'] = 'lua/vimdaloo/version/init.lua',
        ['vimdaloo.version.Version'] = 'lua/vimdaloo/version/Version.lua',
        ['vimdaloo.version.LuaJITVersion'] = 'lua/vimdaloo/version/LuaJITVersion.lua',
        ['vimdaloo.version.LuaVersion'] = 'lua/vimdaloo/version/LuaVersion.lua',
        ['vimdaloo.version.NvimVersion'] = 'lua/vimdaloo/version/NvimVersion.lua',
        ['vimdaloo.version.SemanticVersion'] = 'lua/vimdaloo/version/SemanticVersion.lua',
        ['vimdaloo.version.VimdalooVersion'] = 'lua/vimdaloo/version/VimdalooVersion.lua',
        ['vimdaloo.color'] = 'lua/vimdaloo/color/init.lua',
        ['vimdaloo.color.Color'] = 'lua/vimdaloo/color/Color.lua',
        -- ['vimdaloo.vim.api'] = 'lua/vimdaloo/vim/api/init.lua',
        -- ['vimdaloo.vim.diff'] = 'lua/vimdaloo/vim/diff/init.lua',
        -- ['vimdaloo.vim.filetype'] = 'lua/vimdaloo/vim/filetype/init.lua',
        -- ['vimdaloo.vim.highlight'] = 'lua/vimdaloo/vim/highlight/init.lua',
        -- ['vimdaloo.vim.keymap'] = 'lua/vimdaloo/vim/keymap/init.lua',
        -- ['vimdaloo.vim.log'] = 'lua/vimdaloo/vim/log/init.lua',
        -- ['vimdaloo.vim.loop'] = 'lua/vimdaloo/vim/loop/init.lua',
        -- ['vimdaloo.vim.mpack'] = 'lua/vimdaloo/vim/mpack/init.lua',
        -- ['vimdaloo.vim.regex'] = 'lua/vimdaloo/vim/regex/init.lua',
        -- ['vimdaloo.vim.script.Call'] = 'lua/vimdaloo/vim/script/Call.lua',
        -- ['vimdaloo.vim.script.Function'] = 'lua/vimdaloo/vim/script/Function.lua',
        -- ['vimdaloo.vim.script.Option'] = 'lua/vimdaloo/vim/script/Option.lua',
        -- ['vimdaloo.vim.script.Variable'] = 'lua/vimdaloo/vim/script/Variable.lua',
        -- ['vimdaloo.vim.spell'] = 'lua/vimdaloo/vim/spell/init.lua',
        -- ['vimdaloo.vim.types'] = 'lua/vimdaloo/vim/types/init.lua',
        -- ['vimdaloo.vim.ui'] = 'lua/vimdaloo/vim/ui/init.lua',
        -- ['vimdaloo.vim.uri'] = 'lua/vimdaloo/vim/uri/init.lua',
    },
}
