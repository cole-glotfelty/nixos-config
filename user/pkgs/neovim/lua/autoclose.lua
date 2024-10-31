-- nvim/after/plugin/autoclose.lua

require("autoclose").setup({
    options = {
        disabled_filetypes = {"text", "markdown"},
        disable_when_touch = true,
        disable_command_mode = true,
    }
})

