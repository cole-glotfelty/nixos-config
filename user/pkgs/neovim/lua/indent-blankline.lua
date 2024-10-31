-- nvim/after/plugin/indent-blankline.lua

require('ibl').setup({
    indent = {
        char = '┊',
    },
    whitespace = {
        remove_blankline_trail = true,
    },
    scope = {
        enabled = false,
    },
    exclude = {
        buftypes = { "terminal", "nofile" },
        filetypes = {
            "help",
            "startify",
            "dashboard",
            "packer",
            "neogitstatus",
            "Trouble",
        },
    }
})

