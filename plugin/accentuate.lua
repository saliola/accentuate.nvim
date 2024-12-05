-- Highlight word under cursor
-- <leader>w will highlight the word under the cursor with the next available color;
-- <leader>N, with N in 1-9, will highlight the word with the i-th color;
-- <leader>0 will clear the highlighting.
-- Original idea: Steve Losh (https://gist.github.com/sooop/8dc424e13c6fe2e2a663#file-gistfile1-vim-L2291)

local M = {}

-- Colors to use for highlighting
M.colors = { "#dfff00", "#ffbf00", "#ff7f50", "#de3163",
             "#9fe2bf", "#40e0d0", "#6495ed", "#ccccff", "#ffffff" }

-- Create highlight groups for each color
M.create_highlight_groups = function()
    for i, color in ipairs(M.colors) do
        vim.api.nvim_set_hl(0, "AccentuatedWord" .. i, { fg="#000000", bg=color, italic = true })
    end
end
M.create_highlight_groups()

-- Next color to use for highlighting
M.next_color = 1

-- Highlight the word under the cursor (defaults to using the next color)
M.highlight_word_under_cursor = function(n)
    if n == nil then
        n = M.next_color
    end
    local word = vim.fn.expand("<cword>")
    local matchid = 86750 + n
    pcall(vim.fn.matchdelete, matchid)
    vim.fn.matchadd("AccentuatedWord" .. n, "\\V\\<" .. vim.fn.escape(word, "\\") .. "\\>", 1, matchid)
    M.next_color = math.fmod(n, #M.colors) + 1
end

-- Clear all highlighted words
M.clear_highlighted_words = function()
    for i=1, #M.colors do
        pcall(vim.fn.matchdelete, 86750 + i)
    end
    M.next_color = 1
end

-- Key mappings
vim.keymap.set("n", "<leader>w", M.highlight_word_under_cursor)
for i, _ in ipairs(M.colors) do
    vim.keymap.set("n", "<leader>" .. i, function () M.highlight_word_under_cursor(i) end)
end
vim.keymap.set("n", "<leader>0", M.clear_highlighted_words)

return M
