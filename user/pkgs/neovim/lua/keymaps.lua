-- nvim/lua/keymaps.lua

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Toggle ruler at 81st
vim.cmd([[nnoremap <leader>c :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>]])

-- Up/Down to move selected text
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("n", "J", "mzJ`z", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
keymap({"n", "v"}, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)

keymap({"n", "v"}, "<leader>d", [["_d]], opts)

-- This is going to get me cancelled
keymap("i", "<C-c>", "<Esc>", opts)

keymap("n", "Q", "<nop>", opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
keymap("n", "<leader>f", vim.lsp.buf.format, opts)

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Unbind space so it can be used for leader
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Toggle sidebar tree
-- keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>e", vim.cmd.Ex)

-- Toggle Undo Tree
keymap("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Close current buffer
keymap("n", "<leader>bc", ":Bd<CR>", opts)

-- Apply first quickfix/Code Actions
-- credit: https://stackoverflow.com/questions/67988374/neovim-lsp-auto-fix-fix-current
local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end

keymap("n", "gk", quickfix, opts)
keymap("n", "<leader>a", vim.lsp.buf.code_action)
